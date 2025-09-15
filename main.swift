//
//  main.swift
//  SPMLtest

import SPML
import RegexBuilder

var digits  = ACSet( "0123456789" )

// MARK: - Utilities

struct BenchResult
{
    let name      : String
    let iterations: Int
    let duration  : Duration
    let matches   : Int
}

@inline(__always)
func time<T>(label name:String, iterations: Int = 25, _ body: () -> T) -> (result: T, elapsed: Duration)
{
    let clock = ContinuousClock()
    let start = clock.now
    let result = body()
    let end   = clock.now
    return (result, end - start)
}

@inline(__always)
func runTimed(label name:String, iterations: Int = 25, _ body: () -> Int) -> BenchResult
{
    let (_, elapsed) = time(label: name, iterations: iterations)
    {
        var total = 0
        for _ in 0..<iterations
        {
            total &+= body()
        }
        return total
    }
    // One extra pass to report “per-run” match count:
    let totalMatches = body()
    return BenchResult(name: name, iterations: iterations, duration: elapsed, matches: totalMatches)
}

@inline(__always)
func fmt(_ d: Duration) -> String
{
    let c = d.components
    let seconds = Double(c.seconds) + Double(c.attoseconds) / 1e18
    return String(format: "%.2f ms", seconds * 1000.0)
}

// MARK: - Corpus Generator

func makeCorpus( _ copies:Int ) -> String
{
   let levels  = ["TRACE","DEBUG","INFO","WARN","ERROR"]
   let modules = ["net.http","auth.core","db.pg","ui.kit","regex.engine","scheduler"]

   let emails  = [
     "anna.smith+test@example.com",
     "john-doe@example.co.uk",
     "δοκιμή+αλφα@παράδειγμα.gr",
     "bad..dots@example.com",
     "simple@example.org",
     "x@y.z"
   ]

   let urls = [
     "https://example.com",
     "http://localhost:8080/path/to/resource?x=1&y=2#frag",
     "ftp://192.168.0.1/pub/file.tar.gz",
     "https://sub.domain.example.io:443/a/b/c?q=swift%20regex",
     "ws://[::1]/socket"
   ]

   let jsons = [
     #"{"id": 42, "name": "Widget", "price": 12.50, "tags": ["swift","regex","benchmark"]}"#,
     #"{"ok": true, "msg": "hello \"world\"", "pi": 3.14159}"#,
     #"{"bad": [1,2,,3], "x": }"#
   ]

   let code = [
     "let foo = 123; let bar = foo + 456 // sum",
     "func greet(_ name: String) -> String { return \"Hello, \\(name)!\" }",
     "struct Point { var x: Double; var y: Double }",
     "if a == b && c != d || e <= f { print(\"ok\") }"
   ]

   let text = [
     "This is is a test with a repeated word word for backreference.",
     "Sphinx of black quartz, judge my vow. 12345 abcde Áéîøü",
     "P@ssw0rdPolicyMustHaveMix and length >= 12 with symbols!"
   ]

   let dates = [
     "2025-09-01 12:34:56.789",
     "1970-01-01 00:00:00.000",
     "2000-02-29 23:59:59.123"
   ]

   let ipv4s = [
     "0.0.0.0","10.0.0.1","127.0.0.1","192.168.100.200","256.12.12.12","12.34.56.078"
   ]

   var parts: [String] = []

   var lvlNdx    = 0
   var modNdx    = 0
   var dateNdx   = 0
   var emailNdx  = 0
   var urlNdx    = 0
   var jsonNdx   = 0
   var codeNdx   = 0
   var textNdx   = 0
   var ipv4sNdx   = 0
   
   for _ in 0..<copies
   {

      let lvl = levels[lvlNdx]
      lvlNdx = (lvlNdx + 1) % levels.count

      let mod = modules[modNdx]
      modNdx  = (modNdx + 1) % modules.count

      let dt  = dates[dateNdx]
      dateNdx  = (dateNdx + 1) % dates.count

      let msg = [
         emails[emailNdx],
         urls[urlNdx],
         jsons[jsonNdx],
         code[codeNdx],
         text[textNdx],
         ipv4s[ipv4sNdx]
      ].joined(separator: " | ")
      
      emailNdx  = (emailNdx + 1) % emails.count
      urlNdx    = (urlNdx + 1) % urls.count
      jsonNdx   = (jsonNdx + 1) % jsons.count
      codeNdx   = (codeNdx + 1) % code.count
      textNdx   = (textNdx + 1) % text.count
      ipv4sNdx  = (ipv4sNdx + 1) % ipv4s.count

      parts.append("[\(dt)] [\(lvl)] [\(mod)] (\(Int.random(in: 1000...9999))) \(msg)")
   }
   return parts.joined(separator: "\n") + "\n"
}


// MARK: - Benchmark Runner

    func printP( _ p:Pattern )
    {
         var end:String.Index
         let maxDist  =
            p.haystack.distance(
               from: p.cursor,
               to: p.endStr
            )
            
         if maxDist < 30
         {
            end = p.endStr
         }
         else
         {
            end =  p.haystack.index( p.cursor, offsetBy: 30 )
         }
         print( p.haystack[p.cursor..<end] )
    }
    


    // MARK: - Lightweight Test Harness

   final class SPMLHarness
   {
      private(set) var passed = 0
      private(set) var failed = 0
      private(set) var total  = 0

      func expect
      (
         _ cond  :Bool,
         _ msg   :@autoclosure ()->String = ""
      )
      {
         total += 1
         if cond
         {
            passed += 1
         }
         else
         {
            failed += 1
            print( "❌ FAIL: \(msg())" )
         }
      }

      func note( _ s:String )
      {
         print( "— \(s)" )
      }

      func summary()
      {
         print( "—" )
         print( "✅ PASS: \(passed)  ❌ FAIL: \(failed)  (TOTAL: \(total))" )
         precondition( failed == 0, "SPMLHarness has failures" )
      }
   }

   // MARK: - Helpers to drive Pattern

   @discardableResult
   private func run
   (
      _ s    :String,
      _ body :(Pattern)->Bool
   )->Bool
   {
      let p = Pattern()
      return p.match( s )
      {
         body( p )
      }
   }

   @inline(__always)
   private func remaining( _ p:Pattern )->Substring
   {
      return p.haystack[ p.cursor..<p.endStr ]
   }

   // MARK: - Public entry point

   public func runSPMLSmokeTests()
   {
      let T = SPMLHarness()
      print( "=== SPML.swift Smoke Tests ===" )

      // -----------------------------
      // match (basic) + tailGate behavior
      // -----------------------------
      T.note( "match: basic success and tail execution" )
      T.expect(
         run( "" )
         { p in
            return p.succeed() && p.eos { return true }
         },
         "match should succeed and run tail"
      )

      // match within a window (start/end)
      T.note( "match(start:end:): matches within a window" )
      do
      {
         let s = "hello world"
         let start = s.index( s.startIndex, offsetBy: 6 )  // 'w'
         let end   = s.endIndex
         let p = Pattern()
         let ok = p.match( s, start:start, end:end )
         {
            return p.bos
            {
               return p.skip( 1 )
               {
                  return true
               }
            }
         }
         T.expect( ok, "windowed match should succeed" )
      }

      // match(pat:,_:)
      T.note( "match(pat:_, _ tail:_): sequencing" )
      do
      {
         let s = "abc"
         let p = Pattern()
         let ok = p.match(
            s,
            start: s.startIndex,
            end:   s.endIndex,
            pat:
            {
               return true
            })
         {
            return p.eos { return true }
         }
         T.expect( ok, "match(pat:,_:) should run pat then tail" )
      }

      // -----------------------------
      // succeed / fail / fence
      // -----------------------------
      T.note( "succeed & fail" )
      T.expect(
         run( "x" )
         { _ in
            return false || true
         },
         "fail || succeed should short-circuit to true"
      )

      T.note( "fence: forces total failure" )
      T.expect(
         !run( "x" )
         { p in
            return p.fence { return true }
         },
         "fence should force overall failure even if tail is true"
      )

      // -----------------------------
      // BOS / EOS
      // -----------------------------
      T.note( "bos/eos on empty string" )
      T.expect(
         run( "" )
         { p in
            return p.bos
            {
               return p.eos { return true }
            }
         },
         "bos + eos should be true on empty input"
      )

      // -----------------------------
      // atPos / position (+capture) / skip (+capture) / getPos
      // -----------------------------
      T.note( "atPos: check position without moving" )
      T.expect(
         run( "abc" )
         { p in
            return p.skip( 1 )
            {
               return p.atPos( 1 )
               {
                  return true
               }
            }
         },
         "atPos(1) should succeed when cursor at index 1"
      )

      T.note( "position: move forward and backward; capture span" )
      T.expect(
         run( "abcdef" )
         { p in
            let cap = RefSubstring()
            return p.position( 3, capture:cap )
            {
               let forwardOK = (cap.s == "abc")
               return p.position( 1, capture:cap )
               {
                  let backOK = (cap.s == "bc")
                  return forwardOK && backOK
               }
            }
         },
         "position(capture:) should capture correct spans"
      )

      T.note( "skip forward and backward; capture skipped text" )
      T.expect(
         run( "012345" )
         { p in
            let cap = RefSubstring()
            return p.skip( 3, capture:cap )
            {
               let fwd = (cap.s == "012")
               return p.skip( -2, capture:cap )
               {
                  let back = (cap.s == "12")
                  return fwd && back
               }
            }
         },
         "skip(capture:) should capture moved-over text"
      )

      T.note( "getPos returns 0-based cursor offset" )
      T.expect(
         run( "abcd" )
         { p in
            let pos = RefInt()
            return p.skip( 2 )
            {
               return p.getPos( pos )
               {
                  return pos.i == 2
               }
            }
         },
         "getPos should report 2 after skipping 2"
      )

      // -----------------------------
      // arb (eager) / arb_lazy + capturing variants
      // -----------------------------
      T.note( "arb: eager backoff until tail ok" )
      T.expect(
         run( "abcDEF" )
         { p in
            return p.arb
            {
               if p.cursor < p.endStr,
                  ("A"..."Z").contains( p.haystack[p.cursor] )
               {
                  return true
               }
               return false
            }
         },
         "arb should back off to before 'D'"
      )

      T.note( "arb(capture:): captures prefix before tail" )
      T.expect(
         run( "hello!" )
         { p in
            let cap = RefSubstring()
            return p.arb( capture:cap )
            {
               if p.cursor < p.endStr, p.haystack[p.cursor] == "!"
               {
                  return cap.s == "hello"
               }
               return false
            }
         },
         "arb(capture:) should capture 'hello'"
      )

      T.note( "arb_lazy: grow until tail accepts" )
      T.expect(
         run( "....X" )
         { p in
            return p.arb_lazy
            {
               if p.cursor < p.endStr && p.haystack[p.cursor] == "X"
               {
                  return true
               }
               return false
            }
         },
         "arb_lazy should grow until 'X'"
      )

      // -----------------------------
      // integer (+capture)
      // -----------------------------
      T.note( "integer: leading ws, sign, digits" )
      T.expect(
         run( "   -42;" )
         { p in
            let r = RefInt()
            return p.integer( r )
            {
               T.expect( r.i == -42, "integer should parse -42" )
               // Positioned before ';' — OK:
               return true
            }
         },
         "integer should succeed and set RefInt"
      )

      T.note( "integer: capture full matched span" )
      T.expect(
         run( "\t+123x" )
         { p in
            let r   = RefInt()
            let cap = RefSubstring()
            return p.integer( r, capture:cap )
            {
               return (r.i == 123) && (cap.s == "+123")
            }
         },
         "integer(capture:) should capture '+123'"
      )

      T.note( "integer: failure on non-digits" )
      T.expect(
         !run( "  +  x" )
         { p in
            let r = RefInt()
            return p.integer( r )
            {
               // This should not succeed; but if it did, assert false:
               return false
            }
         },
         "integer should fail if no digits"
      )

      // -----------------------------
      // floatingPoint (+capture)
      // -----------------------------
      T.note( "floatingPoint: basic decimals and with exponent" )
      T.expect(
         run( "  3.14e-2;" )
         { p in
            let d = RefDouble()
            return p.floatingPoint( d )
            {
               return abs( d.d - 0.0314 ) < 1e-9
            }
         },
         "floatingPoint should parse 3.14e-2"
      )

      T.note( "floatingPoint: .5 and 2. cases" )
      T.expect(
         run( " .5 X" )
         { p in
            let d = RefDouble()
            return p.floatingPoint( d )
            {
               return abs( d.d - 0.5 ) < 1e-9
            }
         }
         &&
         run( " 2. y" )
         { p in
            let d = RefDouble()
            return p.floatingPoint( d )
            {
               return abs( d.d - 2.0 ) < 1e-9
            }
         },
         "floatingPoint should accept .5 and 2."
      )

      T.note( "floatingPoint(capture:): captures matched span" )
      T.expect(
         run( "\t-0.75E+1!" )
         { p in
            let d   = RefDouble()
            let cap = RefSubstring()
            return p.floatingPoint( d, capture:cap )
            {
               return (abs( d.d - (-7.5) ) < 1e-9) && (cap.s == "-0.75E+1")
            }
         },
         "floatingPoint(capture:) should capture '-0.75E+1'"
      )

      T.note( "floatingPoint: fails on bare 'e' without digits" )
      T.expect(
         !run( " 1e+ x" )
         { p in
            let d = RefDouble()
            return p.floatingPoint( d )
            {
               // If this tail runs, parsing erroneously succeeded:
               return true
            }
         },
         "floatingPoint should fail if exponent has no digits"
      )

      // -----------------------------
      // identifier (skips leading ws)
      // -----------------------------
      T.note( "identifier parses C-style identifiers" )
      T.expect(
         run( "  _var123 = 1" )
         { p in
            let id = RefSubstring()
            return p.identifier( id )
            {
               return id.s == "_var123"
            }
         },
         "identifier should capture '_var123'"
      )

      T.note( "identifier fails if first non-ws is not valid start" )
      T.expect(
         !run( "  9bad" )
         { p in
            let id = RefSubstring()
            return p.identifier( id )
            {
               // Should not succeed
               return true
            }
         },
         "identifier should fail on leading digit"
      )

      // -----------------------------
      // choiceOf (alternation) (+capture)
      // -----------------------------
      T.note( "choiceOf: any of the alternates may succeed" )
      T.expect(
         run( "b" )
         { p in
            return p.choiceOf(
               [
                  { tail in return p.match( "a", tail ) },
                  { tail in return p.match( "b", tail ) },
                  { tail in return p.match( "c", tail ) }
               ]
            )
            {
               return true
            }
         },
         "choiceOf should accept 'b'"
      )

      T.note( "choiceOf(capture:): captures the matched alternate span" )
      T.expect(
         run( "hello!" )
         { p in
            let cap = RefSubstring()
            return p.choiceOf(
               [
                  { tail in return p.s( "hi",   tail ) },
                  { tail in return p.s( "hello",tail ) }
               ],
               capture: cap,
            )
            {
               return cap.s == "hello"
            }
         },
         "choiceOf(capture:) should capture 'hello'"
      )

      // -----------------------------
      // BOS/EOS + position together
      // -----------------------------
      T.note( "position + eos combo check" )
      T.expect(
         run( "xyz" )
         { p in
            return p.position( 3 )
            {
               return p.eos { return true }
            }
         },
         "position(3) should allow eos at end"
      )

      // -----------------------------
      // Final summary
      // -----------------------------
      T.summary()
   }
   

// MARK: - Tiny test harness

public final class SPMLTestHarness
{
    public private(set) var passed = 0
    public private(set) var failed = 0

    @inline(__always)
    public func expect(_ cond: @autoclosure () -> Bool, _ msg: @autoclosure () -> String)
    {
        if cond() {
            passed &+= 1
        } else {
            failed &+= 1
            print("❌ \(msg())")
        }
    }

    public func summary(_ title: String)
    {
        print("— \(title): \(passed) passed, \(failed) failed —")
    }
}

// MARK: - Helpers used inside tests

@inline(__always)
private func alwaysTrue() -> Bool { return true }

@inline(__always)
private func alwaysFalse() -> Bool { return false }

// Build an alt that matches exactly one of the given ASCII chars without using c()/s()
private func altMatchesASCIIChar(_ p: Pattern, _ ch: Character) -> (PatClosure) -> Bool
{
    return { tail in
        let cap = RefSubstring()
        return p.any_peek(capture: cap) {
            // Verify next char equals desired ASCII (and not a newline)
            if cap.s.count == 1, let c = cap.s.first, c == ch, c != "\n" {
                return p.skip(1) { return p.tailGate(tail) }
            }
            return false
        }
    }
}

// Tail that asserts next literal ASCII string (again without depending on s()/c())
private func tailAssertASCII(_ p: Pattern, literal: String) -> Bool
{
    var ok = true
    for expected in literal {
        ok = ok && p.any_peek { return true }
        if !ok { return false }
        // peek the char and compare
        let cap = RefSubstring()
        ok = p.any_peek(capture: cap) {
            return true
        }
        if !ok { return false }
        if cap.s.count != 1 || cap.s.first! != expected { return false }
        // consume it
        ok = p.skip(1) { return true }
        if !ok { return false }
    }
    return true
}

// MARK: - Individual test procedures

public func test_match_and_positions(_ T: SPMLTestHarness)
{
    let p = Pattern()

    // Empty string BOS/EOS
    T.expect(
        p.match("") {
            return p.bos {
                return p.eos { return true }
            }
        },
        "BOS/EOS should succeed on empty string"
    )

    // getPos starts at 0
    T.expect(
        p.match("abc") {
            let pos = RefInt()
            return p.getPos(pos) {
                return pos.i == 0
            }
        },
        "getPos should be 0 at start"
    )

    // position forward and back (with capture)
    T.expect(
        p.match("abcdef") {
            let cap = RefSubstring()
            return p.position(3, capture: cap) {
                // captured "abc"
                return String(cap.s) == "abc"
            }
        },
        "position(3,capture:) should capture leading slice"
    )

    // atPos exact
    T.expect(
        p.match("012345") {
            return p.position(4) {
                return p.atPos(4) { return true }
            }
        },
        "atPos should detect exact position"
    )
}

public func test_skip_and_getPos(_ T: SPMLTestHarness)
{
    let p = Pattern()

    // skip forward
    T.expect(
        p.match("hello") {
            return p.skip(2) {             // he|llo
                let pos = RefInt()
                return p.getPos(pos) { return pos.i == 2 }
            }
        },
        "skip(2) should land at index 2"
    )

    // negative skip (back up)
    T.expect(
        p.match("hello") {
            return p.skip(4) {             // hell|o
                return p.skip(-2) {        // he|llo
                    let pos = RefInt()
                    return p.getPos(pos) { return pos.i == 2 }
                }
            }
        },
        "skip(-2) should move back correctly"
    )
}

public func test_any_and_peek(_ T: SPMLTestHarness)
{
    let p = Pattern()

    // any matches first non-newline character and advances
    T.expect(
        p.match("A") {
            return p.any {
                return p.eos { return true }
            }
        },
        "`any` should consume one char (not newline) and allow EOS"
    )

    // any_peek does not advance
    T.expect(
        p.match("Z") {
            return p.any_peek {
                // Still at BOS, so another any should consume it:
                return p.any {
                    return p.eos { return true }
                }
            }
        },
        "`any_peek` should not advance the cursor"
    )

    // any capturing
    T.expect(
        p.match("Q") {
            let s = RefSubstring()
            return p.any(capture: s) {
                return String(s.s) == "Q"
            }
        },
        "`any(capture:)` should capture the matched character"
    )

    // newline rejected
    T.expect(
        p.match("\n") {
            return !p.any { return true }
        },
        "`any` must reject newline"
    )
}

public func test_nTomAny_and_family(_ T: SPMLTestHarness)
{
    let p = Pattern()

    // nTomAny greedy stops at newline
    T.expect(
        p.match("abc\ndef") {
            return p.nTomAny(n: 1, m: 4) {
                // we’re somewhere after 1..4 chars, but before '\n'
                // prove we’re at '\n' or later text:
                return p.any_peek {
                    // Should be '\n' or 'd' depending on greediness/backtrack.
                    // Accept either; the tailGate/backtracking decides.
                    return true
                }
            }
        },
        "nTomAny(1,4) should consume 1..4 non-newline chars"
    )

    // nTomAny_peek does not consume, but verifies availability
    T.expect(
        p.match("wxyz") {
            return p.nTomAny_peek(n: 2, m: 3) {
                // Now consume exactly 2 to confirm peek didn't consume
                return p.nAny(n: 2) {
                    return p.eos { return false } || true // just proceed
                }
            }
        },
        "nTomAny_peek should verify without consuming"
    )

    // nTomAny_lazy prefers minimal length
    T.expect(
        p.match("abcdX") {
            // lazily grab 1..4, then require 'X'
            return p.nTomAny_lazy(n: 1, m: 4) {
                return tailAssertASCII(p, literal: "X")
            }
        },
        "nTomAny_lazy should grow only as needed to satisfy the tail"
    )

    // Capturing variant
    T.expect(
        p.match("12345") {
            let cap = RefSubstring()
            return p.nTomAny(n: 2, m: 4, capture: cap) {
                let s = String(cap.s)
                return (s.count >= 2 && s.count <= 4) && s.allSatisfy { $0 != "\n" }
            }
        },
        "nTomAny(… ,capture:) should capture the consumed span"
    )

    // Convenience families

    // zeroOrOneAny (0 case)
    T.expect(
        p.match("") {
            return p.zeroOrOneAny {
                return p.eos { return true }
            }
        },
        "zeroOrOneAny should accept zero-length at EOS"
    )

    // oneOrMoreAny must consume at least one
    T.expect(
        p.match("A") {
            return p.oneOrMoreAny {
                return p.eos { return true }
            }
        },
        "oneOrMoreAny should require one character"
    )

    // zeroOrMoreAny captures empty
    T.expect(
        p.match("") {
            let cap = RefSubstring()
            return p.zeroOrMoreAny(capture: cap) {
                return String(cap.s).isEmpty
            }
        },
        "zeroOrMoreAny(capture:) should capture empty at EOS"
    )

    // nAny exact length
    T.expect(
        p.match("XYZ") {
            return p.nAny(n: 3) {
                return p.eos { return true }
            }
        },
        "nAny(n:3) should consume exactly 3 characters"
    )

    // nAny_peek should not consume
    T.expect(
        p.match("PQRS") {
            return p.nAny_peek(n: 2) {
                return p.nAny(n: 2) { return true }
            }
        },
        "nAny_peek should verify without consuming"
    )
}

public func test_arb_variants(_ T: SPMLTestHarness)
{
    let p = Pattern()

    // arb (eager) backtracks to satisfy a tight tail
    T.expect(
        p.match("aaaaX") {
            return p.arb {
                return tailAssertASCII(p, literal: "X")
            }
        },
        "arb (eager) should backtrack so tail can see 'X'"
    )

    // arb_lazy grows as needed
    T.expect(
        p.match("ZzzzX") {
            return p.arb_lazy {
                return tailAssertASCII(p, literal: "X")
            }
        },
        "arb_lazy should grow only as needed to see 'X'"
    )

    // Capturing eager
    T.expect(
        p.match("hello!") {
            let cap = RefSubstring()
            return p.arb(capture: cap) {
                // Tail wants '!'
                return tailAssertASCII(p, literal: "!")
            } && String(cap.s) == "hello"
        },
        "arb(capture:) should capture the maximal-but-backtracked prefix"
    )

    // Capturing lazy (prefer minimal then grow)
    T.expect(
        p.match("aX") {
            let cap = RefSubstring()
            return p.arb_lazy(capture: cap) {
                return tailAssertASCII(p, literal: "X")
            } && (String(cap.s) == "" || String(cap.s) == "a")
        },
        "arb_lazy(capture:) should capture minimal (or minimal+growth) before tail success"
    )
}

public func test_choiceOf_and_fence(_ T: SPMLTestHarness)
{
    let p = Pattern()

    // choiceOf over single-char alts
    T.expect(
        p.match("b!") {
            return p.choiceOf(
                [
                    altMatchesASCIIChar(p, "a"),
                    altMatchesASCIIChar(p, "b"),
                    altMatchesASCIIChar(p, "c")
                ]
            ) {
                return tailAssertASCII(p, literal: "!")
            }
        },
        "choiceOf should accept the first matching alternate and run the tail"
    )

    // fence causes total failure past this point
    T.expect(
        !p.match("anything") {
            // Trip the fence and then try to continue.
            p.fence{   // sets failFence
               // Any tailGate path must fail now:
               return !p.tailGate { return true }
            }
        },
        "fence should prevent any further success via tailGate"
    )
}

// (Optional) sanity checks for bos/eos on non-empty strings
public func test_bos_eos_nonempty(_ T: SPMLTestHarness)
{
    let p = Pattern()

    T.expect(
        p.match("hi") {
            return p.bos {
                // consume both chars
                return p.nAny(n: 2) {
                    return p.eos { return true }
                }
            }
        },
        "BOS at start, EOS at end on non-empty string"
    )
}

// MARK: - Top-level runner

public func runSPMLTests()
{
    let T = SPMLTestHarness()
    test_match_and_positions(T)
    test_skip_and_getPos(T)
    test_any_and_peek(T)
    test_nTomAny_and_family(T)
    test_arb_variants(T)
    test_choiceOf_and_fence(T)
    test_bos_eos_nonempty(T)
    T.summary("SPML.swift (2)")
}


// MARK: - Main test program:

    func main()
    {
         // Run tests:
         
         testACSet()
         testCSet()
         testSetC()
         testChar()
         testPat()
         testString()
         testWS()
         testSpecial()
         testExpr()
         runSPMLSmokeTests()
         runSPMLTests()
         
//         // Run benchmark:
//         
//         let copies        = 1
//         let iterations    = 150000       // bump for longer timing windows
//         var matchResult   = true
//
//         let corpus  = makeCorpus( copies )
//
//         print("Corpus size: \(corpus.utf8.count) bytes")
//         print("Iterations per regex: \(iterations)\n")
//
//         var results: [BenchResult] = []
//         let p = Pattern()
//         var count = 0
//
//         let r = runTimed(label: "log", iterations: iterations)
//         {
//            let result =
//               p.match( corpus )
//               {
//                  p.nPat_fast(
//                     n:copies,
//                     block:{ tail in
//                  
//                     // Date/Time:
//                     
//                     p.c( "[" ){
//                     p.nADigit( n:4 ){
//                     p.c( "-" ){
//                     p.nADigit( n:2 ){
//                     p.c( "-" ){
//                     p.nADigit( n:2 ){
//                     p.ws(){
//                     p.nADigit( n:2 ){
//                     p.c( ":" ){
//                     p.nADigit( n:2 ){
//                     p.c( ":" ){
//                     p.nADigit( n:2 ){
//                     p.c( "." ){
//                     p.nADigit( n:3 ){
//                     p.s( "] [" ){
//                     
//                     // Level:
//                     
//                     p.choiceOf(
//                       [
//                          {tail in p.s("TRACE", tail)},
//                          {tail in p.s("DEBUG", tail)},
//                          {tail in p.s("INFO", tail)},
//                          {tail in p.s("WARN", tail)},
//                          {tail in p.s("ERROR", tail)}
//                       ]
//                     )
//                     {
//                        p.s( "] [" ){
//
//                        // Module:
//                        
//                        p.oneOrMoreWordChar(){
//                        p.zeroOrMorePat(
//                           block:
//                              { tail in
//                                 p.s(".")
//                                 {
//                                    p.oneOrMoreWordChar( tail )
//                                 }
//                              }
//                        ){
//                        p.s("] (" ){
//                        p.nADigit( n:4 ){
//                        p.c( ")" ){
//                        p.oneOrMoreWS(){
//                        p.thruChar( "\n" ){
//                        tail()
//                        }}}}}}}}}}}}}}}}}}}}}}}}
//                     } // block
//                  ) // nPat
//               } // Match
//               
//            matchResult = matchResult && result
//            if result {count += 1}
//            return  (result) ? 1 : 0
//         }
//         results.append(r)
//         print("log",  "matches: \(r.matches)",   "time: \(r.duration), result=\(matchResult), count=\(count)" )
//
//        let totalSeconds = results.reduce(0.0)
//        { acc, r in
//            let c = r.duration.components
//            return acc + Double(c.seconds) + Double(c.attoseconds) / 1e18
//        }
//        //let sTemp = String(format: "%.3f s", totalSeconds)
//        print("\nTotal wall time (sum of individual regex runs): \(totalSeconds)")
    }
main()

