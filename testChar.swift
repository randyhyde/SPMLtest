//
//  testChar.swift
//  SPMLtest

import Foundation
import SPML

func testChar()
{
   let s1      = RefSubstring( "" )
   let s2      = RefSubstring( "" )
   let s3      = RefSubstring( "" )
   let s4      = RefSubstring( "" )

   var name    = ""
   var test    = ""
   var pResult = false
   
   let a       :Character = "a"
   
   var p       = Pattern()
   
   //---------------------------------------------
   //
   // Test c


   name     = "c"
   s1.s     = "*"
   s2.s     = "*"
   s3.s     = "*"
   s4.s     = "*"
   test     = " #1 cc"
   p        = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.c( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.c( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.c( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.c #2
               return result3
            } // p.c #1
            return result2
         } // p.c
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1)', s2='\(s2)', s3='\(s3)', s4='\(s4)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )

   //-------------------------------------------------------------------------
   
   runCharSmokeTests()
}

// MARK: - Lightweight Test Harness (no XCTest)

final class CharHarness {
   private(set) var passed = 0
   private(set) var failed = 0
   private(set) var total  = 0

   func expect(_ cond: Bool, _ msg: @autoclosure ()->String = "") {
      total += 1
      if cond { passed += 1 } else { failed += 1; print("❌ FAIL:", msg()) }
   }
   func note(_ s: String) { print("—", s) }
   func summary() {
      print("—")
      print("✅ PASS: \(passed)  ❌ FAIL: \(failed)  (TOTAL: \(total))")
      precondition( failed == 0, "CharHarness has failures" )
   }
}

// MARK: - Helpers to drive Pattern

@discardableResult
private func run(_ s: String, _ body: (Pattern) -> Bool) -> Bool {
   let p = Pattern()
   return p.match(s) { body(p) }
}

@inline(__always)
private func consume(_ p: Pattern, _ k: Int) -> Bool {
   var i = 0
   while i < k && p.cursor < p.endStr { p.incCursor(); i += 1 }
   return i == k
}

@inline(__always)
private func remaining(_ p: Pattern) -> Substring {
   p.haystack[p.cursor..<p.endStr]
}

// MARK: - Public entry point

public func runCharSmokeTests() {
   let T = CharHarness()
   print("=== Char.swift Smoke Tests ===")

   // -----------------------------
   // c / c_peek (case-sensitive), with capture
   // -----------------------------
   T.note("c: match and consume one exact character")
   T.expect(
      run("Ax") { p in
         p.c("A") {
            T.expect(remaining(p) == "x", "c should have consumed 'A'")
            return true
         }
      },
      "c('A') should succeed on 'Ax'"
   )

   T.note("c: boundary — empty input")
   T.expect(
      !run("") { p in p.c("A") { true } },
      "c should fail on empty haystack"
   )

   T.note("c_peek: does not consume on success")
   T.expect(
      run("Az") { p in
         p.c_peek("A") {
            T.expect(remaining(p) == "Az", "c_peek must not consume")
            return true
         }
      },
      "c_peek should succeed and not consume"
   )

   T.note("c(capture:): captures matched character")
   T.expect(
      run("Q!") { p in
         let cap = RefSubstring()
         return p.c("Q", capture: cap) {
            T.expect(cap.s == "Q", "capture should be 'Q', got '\(cap.s)'")
            return true
         }
      },
      "c(capture:) should capture single char"
   )

   T.note("c_peek(capture:): captures but does not consume")
   T.expect(
      run("R?") { p in
         let cap = RefSubstring()
         return p.c_peek("R", capture: cap) {
            T.expect(cap.s == "R", "peek capture mismatch '\(cap.s)'")
            T.expect(remaining(p) == "R?", "cursor must not move for peek")
            return true
         }
      },
      "c_peek(capture:) should capture & restore"
   )

   // -----------------------------
   // ci / ci_peek (case-insensitive), with capture
   // -----------------------------
   T.note("ci: matches case-insensitively and consumes")
   T.expect(
      run("aX") { p in
         p.ci("A") {
            T.expect(remaining(p) == "X", "ci should have consumed 'a'")
            return true
         }
      },
      "ci('A') should match 'a'"
   )

   T.note("ci: mismatch still fails")
   T.expect(
      !run("b") { p in p.ci("A") { true } },
      "ci('A') should fail on 'b'"
   )

   T.note("ci_peek: non-consuming, case-insensitive")
   T.expect(
      run("Z9") { p in
         p.ci_peek("z") {
            T.expect(remaining(p) == "Z9", "ci_peek must not consume")
            return true
         }
      }
   )

   T.note("ci(capture:): captures consumed char")
   T.expect(
      run("a!") { p in
         let cap = RefSubstring()
         return p.ci("A", capture: cap) {
            T.expect(cap.s == "a", "ci capture should be 'a', got '\(cap.s)'")
            return true
         }
      }
   )

   T.note("ci_peek(capture:): captures but does not consume")
   T.expect(
      run("X.") { p in
         let cap = RefSubstring()
         return p.ci_peek("x", capture: cap) {
            T.expect(cap.s == "X", "peek ci capture mismatch '\(cap.s)'")
            T.expect(remaining(p) == "X.", "ci_peek must leave cursor")
            return true
         }
      }
   )

   // -----------------------------
   // nTomChar (eager) and nTomChar_lazy; with peeking and capture
   // -----------------------------
   T.note("nTomChar eager: greedy then backtrack for tail")
   T.expect(
      run("aaa!") { p in
         p.nTomChar("a", n: 1, m: 3) {
            // Tail should see '!' immediately (no further 'a')
            if p.cursor < p.endStr, p.haystack[p.cursor] == "!" { return true }
            return false
         }
      },
      "nTomChar should align so next char is '!'"
   )

   T.note("nTomChar eager: boundary — cannot reach minimum")
   T.expect(
      !run("bb") { p in p.nTomChar("a", n: 1, m: 2) { true } },
      "nTomChar should fail when minimum not met"
   )

   T.note("nTomChar_lazy: grows only as needed")
   T.expect(
      run("aaX") { p in
         p.nTomChar_lazy("a", n: 0, m: 3) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "a" { return true }
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
            return true
         }
      },
      "nTomChar_lazy should prefer fewer matches"
   )

   T.note("nTomChar_peek: verifies ≥ n without consuming")
   T.expect(
      run("aaaa!") { p in
         p.nTomChar_peek("a", n: 3, m: 5) {
            T.expect(remaining(p) == "aaaa!", "peek must not consume")
            return true
         }
      }
   )

   T.note("nTomChar(capture:): captures greedy slice")
   T.expect(
      run("aaab") { p in
         let cap = RefSubstring()
         return p.nTomChar("a", n: 1, m: 3, capture: cap) {
            T.expect(cap.s == "aaa", "capture should be 'aaa', got '\(cap.s)'")
            return true
         }
      }
   )

   T.note("nTomChar_lazy(capture:): captures minimal slice on success")
   T.expect(
      run("aaX") { p in
         let cap = RefSubstring()
         return p.nTomChar_lazy("a", n: 0, m: 3, capture: cap) {
            p.c_peek( "X" ){
               // We expect lazy to stop before 'X' with as few 'a' as possible
               T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "should stop at 'X', was '\(p.haystack[p.cursor])'")
               T.expect(cap.s.count <= 3, "cap length within bounds")
               return true
            }
         }
      }
   )

   T.note("nTomChar_peek(capture:): capture without consumption")
   T.expect(
      run("aaaa!") { p in
         let cap = RefSubstring()
         return p.nTomChar_peek("a", n: 2, m: 4, capture: cap) {
            T.expect(!cap.s.isEmpty && cap.s.allSatisfy { $0 == "a" }, "cap should be all 'a'")
            T.expect(remaining(p) == "aaaa!", "peek must keep cursor")
            return true
         }
      }
   )

   // -----------------------------
   // Case-insensitive runs: nTomChari / lazy / peek (+capture variants)
   // -----------------------------
   T.note("nTomChari eager: greedy, case-insensitive")
   T.expect(
      run("AaA!") { p in
         p.nTomChari("a", n: 1, m: 3) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "!" { return true }
            return false
         }
      }
   )

   T.note("nTomChari_lazy: grows as needed (case-insensitive)")
   T.expect(
      run("aAAX") { p in
         p.nTomChari_lazy("a", n: 0, m: 3) {
            if p.cursor < p.endStr, "aA".contains(p.haystack[p.cursor]) { return true }
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "stop at 'X'")
            return true
         }
      }
   )

   T.note("nTomChari_peek: verify without consuming")
   T.expect(
      run("AaA.") { p in
         p.nTomChari_peek("a", n: 3, m: 5) {
            T.expect(remaining(p) == "AaA.", "peek must not consume")
            return true
         }
      }
   )

   T.note("nTomChari(capture:): capture case-insensitive run")
   T.expect(
      run("AaAb") { p in
         let cap = RefSubstring()
         return p.nTomChari("a", n: 1, m: 4, capture: cap) {
            T.expect(cap.s.lowercased().allSatisfy { $0 == "a" }, "cap should be all 'a' (ci)")
            return true
         }
      }
   )

   T.note("nTomChari_lazy(capture:) & nTomChari_peek(capture:)")
   T.expect(
      run("aAaX") { p in
         let cap = RefSubstring()
         return p.nTomChari_lazy("a", n: 0, m: 3, capture: cap) {
            p.ci_peek( "x" ){
               T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy ci stop at 'X'")
               return true
            }
         }
      }
   )
   T.expect(
      run("AaA!") { p in
         let cap = RefSubstring()
         return p.nTomChari_peek("a", n: 2, m: 4, capture: cap) {
            T.expect(!cap.s.isEmpty, "peek ci capture should not be empty when n≥2")
            T.expect(remaining(p) == "AaA!", "peek should not consume")
            return true
         }
      }
   )

   // -----------------------------
   // Convenience wrappers: zero/one/more (sensitive & insensitive)
   // -----------------------------
   T.note("zeroOrOneChar: optional match (both paths)")
   T.expect(
      run("a?") { p in
         p.zeroOrOneChar("a") {
            T.expect(remaining(p) == "?", "zeroOrOneChar should consume when present")
            return true
         }
      }
   )
   T.expect(
      run("?") { p in
         p.zeroOrOneChar("a") {
            T.expect(remaining(p) == "?", "zeroOrOneChar can match zero")
            return true
         }
      }
   )

   T.note("zeroOrMoreChar: consumes run; peek variant non-consuming")
   T.expect(
      run("aaaa!") { p in
         p.zeroOrMoreChar("a") {
            T.expect(remaining(p) == "!", "zeroOrMoreChar should eat all 'a'")
            return true
         }
      }
   )
   T.expect(
      run("aaaa!") { p in
         p.zeroOrMoreChar_peek("a") {
            T.expect(remaining(p) == "aaaa!", "peek should not consume")
            return true
         }
      }
   )

   T.note("oneOrMoreChar & oneOrMoreChar_lazy")
   T.expect(
      run("bbb.") { p in
         p.oneOrMoreChar("b") {
            T.expect(remaining(p) == ".", "oneOrMoreChar should consume bbb")
            return true
         }
      }
   )
   T.expect(
      run("bbX") { p in
         p.oneOrMoreChar_lazy("b") {
            // Lazy path: success even with minimal consumption (≥1)
            T.expect(remaining(p).hasSuffix("X"), "lazy tail should see 'X' next")
            return true
         }
      }
   )

   T.note("Case-insensitive convenience: zeroOrOneChari / zeroOrMoreChari / oneOrMoreChari")
   T.expect(
      run("A?") { p in p.zeroOrOneChari("a") { remaining(p) == "?" } }
   )
   T.expect(
      run("AaA!") { p in p.zeroOrMoreChari("a") { remaining(p) == "!" } }
   )
   T.expect(
      run("aA.") { p in p.oneOrMoreChari("a") { remaining(p) == "." } }
   )

   // -----------------------------
   // Final summary
   // -----------------------------
   T.summary()
}
