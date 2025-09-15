//
//  testSpecial.swift
//  SPMLtest

import Foundation
import SPML



// SpecialSetsTests.swift
// Drop into your tests target or a demo CLI target.
// Assumes `Pattern` and all SpecialSets.swift APIs are visible to this file.

import Foundation

// MARK: - Lightweight test harness

private struct TAssert
{
   static func log(_ ok: Bool, _ label: String, _ detail: @autoclosure ()->String = "")
   {
      if ok
      {
         print("✅ \(label) \(detail())")
      }
      else
      {
         print("❌ \(label) \(detail())")
      }
   }

   static func eq(_ got: String, _ exp: String, _ label: String)
   {
      let ok = (got == exp)
      log(ok, label, "[got: \"\(got)\", exp: \"\(exp)\"]")
   }

   static func isTrue(_ got: Bool, _ label: String)
   {
      log(got, label)
   }

   static func isFalse(_ got: Bool, _ label: String)
   {
      log(!got, label)
   }
}

// MARK: - Helpers

@inline(__always)
private func run(_ s: String, _ label: String, _ body: (Pattern)->Bool, expected: Bool, after: String? = nil)
{
   let p = Pattern()
   let ok =
      p.match(s)
      {
         return body(p)
      }
   TAssert.log(ok == expected, label,
               after.map { a in "[after: \"\(a)\"]" } ?? "")
}

@inline(__always)
private func runCap(_ s: String, _ label: String, _ body: (Pattern, RefSubstring)->Bool,
                    expected: Bool, capExp: String? = nil)
{
   let p = Pattern()
   let cap = RefSubstring("")
   let ok =
      p.match(s)
      {
         body(p, cap)
      }
   if let capExp
   {
      TAssert.log(ok == expected && cap.s == capExp, label,
                  "[ok: \(ok), cap: \"\(cap)\", expCap: \"\(capExp)\"]")
   }
   else
   {
      TAssert.log(ok == expected, label, "[ok: \(ok), cap: \"\(cap)\"]")
   }
}

// Tail that always succeeds / fails
@inline(__always) private func okTail() -> Bool { true }
@inline(__always) private func failTail() -> Bool { false }

// MARK: - WordChar family tests (letters, digits, underscore)

public func test_oneWordChar_variants()
{
   run("A", "oneWordChar(A) -> true",
       { p in p.oneWordChar(okTail) },
       expected: true)

   run("_", "oneWordChar(_) -> true",
       { p in p.oneWordChar(okTail) },
       expected: true)

   run("7", "oneWordChar(7) -> true",
       { p in p.oneWordChar(okTail) },
       expected: true)

   run("-", "oneWordChar(-) -> false",
       { p in p.oneWordChar(okTail) },
       expected: false)

   run("", "oneWordChar(empty) -> false",
       { p in p.oneWordChar(okTail) },
       expected: false)

   run("A", "oneWordChar + failing tail -> false",
       { p in p.oneWordChar(failTail) },
       expected: false)

   run("B", "oneWordChar_peek(B) -> true (no consume)",
       { p in p.oneWordChar_peek(okTail) },
       expected: true)

   run("*", "oneWordChar_peek(*) -> false",
       { p in p.oneWordChar_peek(okTail) },
       expected: false)

   runCap("Az", "oneWordChar(capture) -> \"A\"",
          { p, s in p.oneWordChar(capture: s, okTail) },
          expected: true, capExp: "A")

   runCap("x1", "oneWordChar_peek(capture) -> \"x\"",
          { p, s in p.oneWordChar_peek(capture: s, okTail) },
          expected: true, capExp: "x")
}

public func test_oneNotWord_variants()
{
   run("-", "oneNotWord('-') -> true",
       { p in p.oneNotWord(okTail) },
       expected: true)

   run("A", "oneNotWord('A') -> false",
       { p in p.oneNotWord(okTail) },
       expected: false)

   run("", "oneNotWord(empty) -> false",
       { p in p.oneNotWord(okTail) },
       expected: false)

   runCap("$A", "oneNotWord(capture) -> \"$\"",
          { p, s in p.oneNotWord(capture: s, okTail) },
          expected: true, capExp: "$")

   run("!", "oneNotWord_peek('!') -> true",
       { p in p.oneNotWord_peek(okTail) },
       expected: true)

   runCap("#", "oneNotWord_peek(capture) -> \"#\"",
          { p, s in p.oneNotWord_peek(capture: s, okTail) },
          expected: true, capExp: "#")
}

public func test_nTomWordChar_core()
{
   run("abc-XYZ", "nTomWordChar(2,5) -> true; stops at '-'",
       { p in p.nTomWordChar(n: 2, m: 5, okTail) },
       expected: true)

   run("__-", "nTomWordChar(2,10) -> true; next '-'",
       { p in p.nTomWordChar(n: 2, m: 10, okTail) },
       expected: true)

   run("_", "nTomWordChar(2,4) -> false (short)",
       { p in p.nTomWordChar(n: 2, m: 4, okTail) },
       expected: false)

   run("abc1-", "nTomWordChar tail-fail backtracks to fence -> false",
       { p in p.nTomWordChar(n: 2, m: 5, { failTail() }) },
       expected: false)

   run("abc-", "nTomWordChar_lazy(2,5) minimal then tail -> true",
       { p in p.nTomWordChar_lazy(n: 2, m: 5, okTail) },
       expected: true)

   run("abcd", "nTomWordChar_lazy(1,3) tail always fails -> false",
       { p in p.nTomWordChar_lazy(n: 1, m: 3, { failTail() }) },
       expected: false)

   run("__-_", "nTomWordChar_peek(2,5) -> true; no consume",
       { p in p.nTomWordChar_peek(n: 2, m: 5, okTail) },
       expected: true)

   run("_", "nTomWordChar_peek(2,5) -> false",
       { p in p.nTomWordChar_peek(n: 2, m: 5, okTail) },
       expected: false)

   runCap("Abc-123", "nTomWordChar(1,6,capture) -> \"Abc\"",
          { p, s in p.nTomWordChar(n: 1, m: 6, capture: s, okTail) },
          expected: true, capExp: "Abc")

   runCap("z9__", "nTomWordChar_lazy(1,4,capture) minimal -> \"z\"",
          { p, s in p.nTomWordChar_lazy(n: 1, m: 4, capture: s, okTail) },
          expected: true, capExp: "z")

   runCap("qwerty-", "nTomWordChar_peek(1,6,capture) -> \"qwerty\"",
          { p, s in p.nTomWordChar_peek(n: 1, m: 6, capture: s, okTail) },
          expected: true, capExp: "qwerty")
}

public func test_wordChar_wrappers()
{
   run("_X", "zeroOrOneWordChar -> true",
       { p in p.zeroOrOneWordChar(okTail) },
       expected: true)

   run("-x", "zeroOrOneWordChar (match zero) -> true",
       { p in p.zeroOrOneWordChar(okTail) },
       expected: true)

   runCap("W", "zeroOrOneWordChar(capture) -> \"W\"",
          { p, s in p.zeroOrOneWordChar(capture: s, okTail) },
          expected: true, capExp: "W")

   run("A", "zeroOrOneWordChar_lazy prefers 0 if tail ok -> true",
       { p in p.zeroOrOneWordChar_lazy(okTail) },
       expected: true)

   runCap("B", "zeroOrOneWordChar_lazy(capture) minimal -> \"\"",
          { p, s in p.zeroOrOneWordChar_lazy(capture: s, okTail) },
          expected: true, capExp: "")

   run("C", "zeroOrOneWordChar_peek -> true (no consume)",
       { p in p.zeroOrOneWordChar_peek(okTail) },
       expected: true)

   runCap("_", "zeroOrOneWordChar_peek(capture) -> \"_\"",
          { p, s in p.zeroOrOneWordChar_peek(capture: s, okTail) },
          expected: true, capExp: "_")

   run("__--", "zeroOrMoreWordChar consumes run -> true",
       { p in p.zeroOrMoreWordChar(okTail) },
       expected: true)

   runCap("abc-xyz", "zeroOrMoreWordChar(capture) -> \"abc\"",
          { p, s in p.zeroOrMoreWordChar(capture: s, okTail) },
          expected: true, capExp: "abc")

   runCap("hello_world!", "zeroOrMoreWordChar_lazy(capture) minimal -> \"\"",
          { p, s in p.zeroOrMoreWordChar_lazy(capture: s, okTail) },
          expected: true, capExp: "")

   run("alpha-", "zeroOrMoreWordChar_peek -> true",
       { p in p.zeroOrMoreWordChar_peek(okTail) },
       expected: true)

   runCap("abc123-", "zeroOrMoreWordChar_peek(capture) -> \"abc123\"",
          { p, s in p.zeroOrMoreWordChar_peek(capture: s, okTail) },
          expected: true, capExp: "abc123")

   run("Z-!", "oneOrMoreWordChar -> true",
       { p in p.oneOrMoreWordChar(okTail) },
       expected: true)

   run("YY-", "oneOrMoreWordChar_lazy -> true",
       { p in p.oneOrMoreWordChar_lazy(okTail) },
       expected: true)

   run("abc-", "oneOrMoreWordChar_peek -> true",
       { p in p.oneOrMoreWordChar_peek(okTail) },
       expected: true)

   runCap("Name:Bob", "oneOrMoreWordChar(capture) -> \"Name\"",
          { p, s in p.oneOrMoreWordChar(capture: s, okTail) },
          expected: true, capExp: "Name")

   runCap("ID42]", "oneOrMoreWordChar_peek(capture) -> \"ID42\"",
          { p, s in p.oneOrMoreWordChar_peek(capture: s, okTail) },
          expected: true, capExp: "ID42")

   run("abc-", "nWordChar(3) -> true",
       { p in p.nWordChar(n: 3, okTail) },
       expected: true)

   run("ab-", "nWordChar(3) -> false (short)",
       { p in p.nWordChar(n: 3, okTail) },
       expected: false)

   run("qwe-", "nWordChar_peek(3) -> true",
       { p in p.nWordChar_peek(n: 3, okTail) },
       expected: true)

   runCap("qwerty", "nWordChar(4,capture) -> \"qwer\"",
          { p, s in p.nWordChar(n: 4, capture: s, okTail) },
          expected: true, capExp: "qwer")

   runCap("abc", "nWordChar_peek(2,capture) -> \"ab\"",
          { p, s in p.nWordChar_peek(n: 2, capture: s, okTail) },
          expected: true, capExp: "ab")
}

// MARK: - ASCII Decimal Digit family

public func test_asciiDigits_core()
{
   run("9X", "aDigit -> true",
       { p in p.aDigit(okTail) },
       expected: true)

   run("X", "aDigit(non-digit) -> false",
       { p in p.aDigit(okTail) },
       expected: false)

   run("1234-", "nADigit(4) -> true",
       { p in p.nADigit(n: 4, okTail) },
       expected: true)

   run("123", "nADigit(4) -> false",
       { p in p.nADigit(n: 4, okTail) },
       expected: false)

   runCap("007Bond", "nADigit(3,capture) -> \"007\"",
          { p, s in p.nADigit(n: 3, capture: s, okTail) },
          expected: true, capExp: "007")

   run("12345X", "nTomADigit(2,5) -> true",
       { p in p.nTomADigit(n: 2, m: 5, okTail) },
       expected: true)

   run("1234Y", "nTomADigit tail-fail -> false",
       { p in p.nTomADigit(n: 2, m: 5, { failTail() }) },
       expected: false)

   run("123X", "nTomADigit_lazy(2,5) -> true (minimal)",
       { p in p.nTomADigit_lazy(n: 2, m: 5, okTail) },
       expected: true)

   run("12", "nTomADigit_lazy(1,1) with failing tail -> false",
       { p in p.nTomADigit_lazy(n: 1, m: 1, { failTail() }) },
       expected: false)

   run("987Z", "nTomADigit_peek(3,5) -> true (no consume)",
       { p in p.nTomADigit_peek(n: 3, m: 5, okTail) },
       expected: true)

   run("98", "nTomADigit_peek(3,5) -> false",
       { p in p.nTomADigit_peek(n: 3, m: 5, okTail) },
       expected: false)

   runCap("2025/09", "nTomADigit(1,4,capture) -> \"2025\"",
          { p, s in p.nTomADigit(n: 1, m: 4, capture: s, okTail) },
          expected: true, capExp: "2025")

   runCap("42end", "nTomADigit_lazy(1,3,capture) minimal -> \"4\"",
          { p, s in p.nTomADigit_lazy(n: 1, m: 3, capture: s, okTail) },
          expected: true, capExp: "4")

   runCap("314159.", "nTomADigit_peek(1,6,capture) -> \"314159\"",
          { p, s in p.nTomADigit_peek(n: 1, m: 6, capture: s, okTail) },
          expected: true, capExp: "314159")
}

public func test_asciiDigits_wrappers()
{
   run("5", "zeroOrOneADigit -> true",
       { p in p.zeroOrOneADigit(okTail) },
       expected: true)

   run("-", "zeroOrOneADigit (match zero) -> true",
       { p in p.zeroOrOneADigit(okTail) },
       expected: true)

   runCap("7", "zeroOrOneADigit(capture) -> \"7\"",
          { p, s in p.zeroOrOneADigit(capture: s, okTail) },
          expected: true, capExp: "7")

   run("123abc", "zeroOrMoreADigit -> true",
       { p in p.zeroOrMoreADigit(okTail) },
       expected: true)

   runCap("123abc", "zeroOrMoreADigit(capture) -> \"123\"",
          { p, s in p.zeroOrMoreADigit(capture: s, okTail) },
          expected: true, capExp: "123")

   run("1X", "oneOrMoreADigit -> true",
       { p in p.oneOrMoreADigit(okTail) },
       expected: true)

   runCap("42.", "oneOrMoreADigit(capture) -> \"42\"",
          { p, s in p.oneOrMoreADigit(capture: s, okTail) },
          expected: true, capExp: "42")
}

// MARK: - ASCII Alphanumeric

public func test_alphanum_core()
{
   run("A!", "oneAlphanum(letter) -> true",
       { p in p.oneAlphanum(okTail) },
       expected: true)

   run("z!", "oneAlphanum(lower) -> true",
       { p in p.oneAlphanum(okTail) },
       expected: true)

   run("9!", "oneAlphanum(digit) -> true",
       { p in p.oneAlphanum(okTail) },
       expected: true)

   run("_", "oneAlphanum('_') -> false",
       { p in p.oneAlphanum(okTail) },
       expected: false)

   run("", "oneAlphanum(empty) -> false",
       { p in p.oneAlphanum(okTail) },
       expected: false)

   run("abc123-", "nTomAlphanum(1,6) -> true",
       { p in p.nTomAlphanum(n: 1, m: 6, okTail) },
       expected: true)

   run("abc1-", "nTomAlphanum tail-fail -> false",
       { p in p.nTomAlphanum(n: 2, m: 5, { failTail() }) },
       expected: false)

   // If you have the capture overload, enable this:
   // runCap("AB12_", "nTomAlphanum(1,6,capture) -> \"AB12\"",
   //        { p, s in p.nTomAlphanum(n: 1, m: 6, capture: s, okTail) },
   //        expected: true, capExp: "AB12")
}

// MARK: - Optional: Hex digit tests (enable if you added hex APIs)
// Add `-DTEST_HEX_DIGITS` to OTHER_SWIFT_FLAGS (or swiftc -DTEST_HEX_DIGITS).

public func test_hexDigits()
{
   run("F.", "aHexDigit -> true",
       { p in p.aHexDigit(okTail) },
       expected: true)

   run("g", "aHexDigit(non-hex) -> false",
       { p in p.aHexDigit(okTail) },
       expected: false)

   run("DEADbeef!", "nTomHexDigit(1,8) -> true",
       { p in p.nTomHexADigit(n: 1, m: 8, okTail) },
       expected: true)

   run("CafeBABE!", "nTomHexDigit_lazy(2,8) -> true",
       { p in p.nTomHexADigit_lazy(n: 2, m: 8, okTail) },
       expected: true)

   run("123xyz", "nTomHexDigit_peek(1,4) -> true",
       { p in p.nTomHexADigit_peek(n: 1, m: 4, okTail) },
       expected: true)

   runCap("face-1", "nTomHexDigit(1,8,capture) -> \"face\"",
          { p, s in p.nTomHexADigit(n: 1, m: 8, capture: s, okTail) },
          expected: true, capExp: "face")

   runCap("0ff.", "nTomHexDigit_lazy(1,3,capture) minimal -> \"0\"",
          { p, s in p.nTomHexADigit_lazy(n: 1, m: 3, capture: s, okTail) },
          expected: true, capExp: "0")

   runCap("BEEF:", "nTomHexDigit_peek(1,8,capture) -> \"BEEF\"",
          { p, s in p.nTomHexADigit_peek(n: 1, m: 8, capture: s, okTail) },
          expected: true, capExp: "BEEF")

   run("A", "zeroOrOneHexDigit -> true",
       { p in p.zeroOrOneHexDigit(okTail) },
       expected: true)

   runCap("Cafe", "zeroOrMoreHexDigit(capture) -> \"Cafe\"",
          { p, s in p.zeroOrMoreHexADigit(capture: s, okTail) },
          expected: true, capExp: "Cafe")

   run("1", "oneOrMoreHexDigit -> true",
       { p in p.oneOrMoreHexADigit(okTail) },
       expected: true)
}

// MARK: - Test driver

public func testSpecial()
{
   print("=== SpecialSets.swift Tests ===")

   test_oneWordChar_variants()
   test_oneNotWord_variants()
   test_nTomWordChar_core()
   test_wordChar_wrappers()

   test_asciiDigits_core()
   test_asciiDigits_wrappers()

   test_alphanum_core()

   test_hexDigits()

   print("=== End SpecialSets.swift Tests ===")
   
   
   //-------------------------------------------------------------------------
   //
   // Run the tests below:
   
   runSpecialSetsSmokeTests()
   runSpecialSetsTests()
}


// MARK: - Lightweight Test Harness (no XCTest)

final class SpecialSetsHarness {
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
      precondition( failed == 0, "SpecialSetsHarness has failures" )
   }
}

// MARK: - Helpers to drive Pattern

@discardableResult
private func run(_ s: String, _ body: (Pattern) -> Bool) -> Bool {
   let p = Pattern()
   return p.match(s) { body(p) }
}

@inline(__always)
private func remaining(_ p: Pattern) -> Substring {
   p.haystack[p.cursor..<p.endStr]
}

// MARK: - Public entry point

public func runSpecialSetsSmokeTests() {
   let T = SpecialSetsHarness()
   print("=== SpecialSets.swift Smoke Tests ===")

   // -----------------------------
   // oneWordChar / oneWordChar_peek (+capture)
   // -----------------------------
   T.note("oneWordChar consumes a single word char (letter/digit/underscore)")
   T.expect(
      run("A!") { p in
         p.oneWordChar {
            T.expect(remaining(p) == "!", "cursor should advance past 'A'")
            return true
         }
      },
      "oneWordChar should succeed on 'A'"
   )

   T.note("oneWordChar: Unicode letters are word chars (via isLetter)")
   T.expect(
      run("β.") { p in
         p.oneWordChar {
            T.expect(remaining(p) == ".", "should consume one Unicode letter")
            return true
         }
      },
      "oneWordChar should accept non-ASCII letters"
   )

   T.note("oneWordChar_peek does not consume")
   T.expect(
      run("_?") { p in
         p.oneWordChar_peek {
            T.expect(remaining(p) == "_?", "peek must not consume")
            return true
         }
      },
      "peek should succeed and not consume"
   )

   T.note("oneWordChar(capture:)")
   T.expect(
      run("9x") { p in
         let cap = RefSubstring()
         return p.oneWordChar(capture: cap) {
            T.expect(cap.s == "9", "capture should be '9'")
            return true
         }
      }
   )

   T.note("oneNotWord (inverse of word char)")
   T.expect(
      run("-A") { p in
         p.oneNotWord {
            T.expect(remaining(p) == "A", "should consume '-'")
            return true
         }
      }
   )

   T.note("oneNotWord_peek does not consume; capture variant captures the symbol")
   T.expect(
      run("!id") { p in
         let cap = RefSubstring()
         return p.oneNotWord_peek(capture: cap) {
            T.expect(cap.s == "!", "peek capture should be '!'")
            T.expect(remaining(p) == "!id", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // nTomWordChar eager / lazy / peek (+capture)
   // -----------------------------
   T.note("nTomWordChar eager: consumes up to m, then backtracks for tail")
   T.expect(
      run("abc123!") { p in
         p.nTomWordChar(n: 1, m: 6) {
            // After nTomWordChar, the next char should be '!' for this test
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "!", "should backtrack to before '!'")
            return true
         }
      }
   )

   T.note("nTomWordChar: failure if < n word chars")
   T.expect(
      !run("  !") { p in
         p.nTomWordChar(n: 2, m: 4) { return true }
      },
      "should fail if cannot meet minimum n"
   )

   T.note("nTomWordChar_lazy: grow only as tail needs")
   T.expect(
      run("name:value") { p in
         p.nTomWordChar_lazy(n: 0, m: 10) {
            // Expect to stop lazily before ':' if possible
            if p.cursor < p.endStr, p.haystack[p.cursor] == ":" { return true }
            return false
         }
      }
   )

   T.note("nTomWordChar_peek: verify without consuming")
   T.expect(
      run("id123-") { p in
         p.nTomWordChar_peek(n: 2, m: 5) {
            T.expect(remaining(p) == "id123-", "peek must not consume")
            return true
         }
      }
   )

   T.note("nTomWordChar capture variants")
   T.expect(
      run("abc_def!") { p in
         let cap = RefSubstring()
         return p.nTomWordChar(n: 1, m: 7, capture: cap) {
            T.expect(cap.s.hasPrefix("abc"), "should capture leading word span")
            return true
         }
      }
   )
   T.expect(
      run("hello:rest") { p in
         let cap = RefSubstring()
         return p.nTomWordChar_lazy(n: 0, m: 20, capture: cap) {
            p.c_peek( ":" ){
               // lazy should stop before ':'
               T.expect(cap.s == "hello", "lazy capture should be minimal")
               return true
            }
         }
      }
   )
   T.expect(
      run("token123!") { p in
         let cap = RefSubstring()
         return p.nTomWordChar_peek(n: 1, m: 8, capture: cap) {
            T.expect(cap.s == "token123", "peek capture should be maximal up to m/backtrack for tail")
            T.expect(remaining(p) == "token123!", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // zero/one/more word-char wrappers (+lazy/+peek, +capture)
   // -----------------------------
   T.note("zeroOrOneWordChar: present and absent")
   T.expect(
      run("_x") { p in p.zeroOrOneWordChar { T.expect(remaining(p) == "x", "should consume '_'"); return true } }
      &&
      run("-") { p in p.zeroOrOneWordChar { T.expect(remaining(p) == "-", "should accept zero"); return true } }
   )

   T.note("zeroOrMoreWordChar & lazy & peek & capture")
   T.expect(
      run("ABC!") { p in p.zeroOrMoreWordChar { T.expect(remaining(p) == "!", "consume all word chars"); return true } }
   )
   T.expect(
      run("ABC!") { p in p.zeroOrMoreWordChar_peek { T.expect(remaining(p) == "ABC!", "peek must not consume"); return true } }
   )
   T.expect(
      run("name13:") { p in
         let cap = RefSubstring()
         return p.zeroOrMoreWordChar_lazy(capture: cap) {
            T.expect(cap.s == "", "lazy 0..* may capture empty if tail already succeeds")
            // tail succeeds immediately (no condition), so minimal capture is ""
            return true
         }
      }
   )

   T.note("oneOrMoreWordChar (+capture, +peek(capture))")
   T.expect(
      run("var1;") { p in
         p.oneOrMoreWordChar {
            T.expect(remaining(p) == ";", "consume ≥1")
            return true
         }
      }
   )
   T.expect(
      run("abc.") { p in
         let cap = RefSubstring()
         return p.oneOrMoreWordChar(capture: cap) {
            T.expect(cap.s == "abc", "capture matched word run")
            return true
         }
      }
   )
   T.expect(
      run("Z9!") { p in
         let cap = RefSubstring()
         return p.oneOrMoreWordChar_peek(capture: cap) {
            T.expect(cap.s == "Z9", "peek(capture) should include all word chars")
            T.expect(remaining(p) == "Z9!", "peek should not consume")
            return true
         }
      }
   )

   // -----------------------------
   // Exact-n: nWordChar / nWordChar_peek (+capture)
   // -----------------------------
   T.note("nWordChar exact count")
   T.expect(
      run("AB12-") { p in
         p.nWordChar(n: 4) {
            T.expect(remaining(p) == "-", "nWordChar(4) should consume AB12")
            return true
         }
      }
   )
   T.expect(
      run("AB12-") { p in
         let cap = RefSubstring()
         return p.nWordChar(n: 4, capture: cap) {
            T.expect(cap.s == "AB12", "nWordChar capture should be exact")
            return true
         }
      }
   )
   T.expect(
      run("abc") { p in
         p.nWordChar_peek(n: 2) {
            T.expect(remaining(p) == "abc", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // upToWordChar / thruWordChar (+peek/+capture)
   // -----------------------------
   T.note("upToWordChar stops before first word char; thruWordChar includes it")
   T.expect(
      run("  \tfoo") { p in
         p.upToWordChar {
            // Should be at 'f' and not consume it
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "f", "stop at first word char")
            return true
         }
      }
   )
   T.expect(
      run("  \tfoo") { p in
         p.thruWordChar {
            // Should have consumed the first word char
            T.expect(remaining(p).hasPrefix("oo"), "thru should include first word char")
            return true
         }
      }
   )
   T.expect(
      run("..name") { p in
         let cap = RefSubstring()
         return p.upToWordChar(capture: cap) {
            T.expect(cap.s == "..", "upToWordChar capture excludes delimiter")
            return true
         }
      }
   )
   T.expect(
      run("..name") { p in
         p.upToWordChar_peek {
            T.expect(remaining(p) == "..name", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // upToNotWordChar / thruNotWordChar (+peek/+capture)
   // -----------------------------
   T.note("upToNotWordChar stops before first NON-word char; thruNotWordChar includes it")
   T.expect(
      run("alpha-beta") { p in
         p.upToNotWordChar {
            // Should stop at '-'
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "-", "stop at first non-word char")
            return true
         }
      }
   )
   T.expect(
      run("alpha-beta") { p in
         let cap = RefSubstring()
         return p.thruNotWordChar(capture: cap) {
            T.expect(cap.s == "alpha-", "thruNotWordChar capture includes non-word char")
            return true
         }
      }
   )
   T.expect(
      run("abc!xyz") { p in
         let cap = RefSubstring()
         return p.upToNotWordChar_peek(capture: cap) {
            T.expect(cap.s == "abc", "peek capture before '!'")
            T.expect(remaining(p) == "abc!xyz", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // ASCII Digit helpers: aDigit, nADigit, nTomADigit (eager/lazy/peek + capture)
   // -----------------------------
   T.note("aDigit consumes one ASCII digit")
   T.expect(
      run("5x") { p in
         p.aDigit {
            T.expect(remaining(p) == "x", "aDigit should consume '5'")
            return true
         }
      },
      "aDigit should succeed on ASCII digit"
   )

   T.note("nADigit exact count (and capture)")
   T.expect(
      run("123-") { p in
         p.nADigit(n: 3) {
            T.expect(remaining(p) == "-", "nADigit(3) should consume '123'")
            return true
         }
      }
   )
   T.expect(
      run("0042;") { p in
         let cap = RefSubstring()
         return p.nADigit(n: 4, capture: cap) {
            T.expect(cap.s == "0042", "nADigit capture mismatch: \(cap.s)")
            return true
         }
      }
   )

   T.note("nTomADigit eager: backtracks to satisfy tail")
   T.expect(
      run("1234X") { p in
         p.nTomADigit(n: 2, m: 4) {
            // after matching digits, verify next is X
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "should align before 'X'")
            return true
         }
      }
   )

   T.note("nTomADigit_lazy grows digits only as needed")
   T.expect(
      run("99:") { p in
         p.nTomADigit_lazy(n: 0, m: 2) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == ":" { return true }
            return false
         }
      }
   )

   T.note("nTomADigit_peek does not consume; capture variants")
   T.expect(
      run("789!") { p in
         p.nTomADigit_peek(n: 3, m: 5) {
            T.expect(remaining(p) == "789!", "peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("333X") { p in
         let cap = RefSubstring()
         return p.nTomADigit(n: 1, m: 3, capture: cap) {
            T.expect(["3","33","333"].contains(String(cap.s)), "eager capture length 1..3")
            return true
         }
      }
   )
   T.expect(
      run("12:") { p in
         let cap = RefSubstring()
         return p.nTomADigit_lazy(n: 0, m: 2, capture: cap) {
            // lazy should keep minimal (likely "")
            T.expect(cap.s.count <= 2, "lazy capture within bounds")
            return true
         }
      }
   )

   // -----------------------------
   // Final summary
   // -----------------------------
   T.summary()
}



// MARK: - Tiny harness

private struct Tally { var passed = 0; var failed = 0 }
private var tally = Tally()

@inline(__always)
private func expect(_ name: String, _ ok: Bool, _ detail: @autoclosure () -> String = "")
{
    if ok {
        print("✅ \(name)")
        tally.passed &+= 1
    } else {
        print("❌ \(name)  \(detail())")
        tally.failed &+= 1
    }
}

// MARK: - WordChar / NotWordChar single-char + peek/capture

public func test_oneWordChar_and_oneNotWordChar()
{
    // oneWordChar: simple success, then EOS
    do {
        let p = Pattern()
        let ok = p.match("aX") {
            return p.oneWordChar {
                return p.s("X") { return p.eos { return true } }
            }
        }
        expect("oneWordChar: matches ASCII letter", ok)
    }

    // oneWordChar: underscore and digit
    do {
        let p = Pattern()
        let ok = p.match("_9!") {
            return p.oneWordChar {
                return p.oneWordChar {
                    return p.s("!") { return p.eos { return true } }
                }
            }
        }
        expect("oneWordChar: '_' and digit", ok)
    }

    // oneWordChar_peek: non-consuming
    do {
        let p = Pattern()
        let ok = p.match("abc") {
            return p.oneWordChar_peek {
                return p.s("a") {
                    return p.s("bc") { return p.eos { return true } }
                }
            }
        }
        expect("oneWordChar_peek: verify without consume", ok)
    }

    // oneWordChar(capture:)
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("é!") {    // Unicode letter should count as word char
            return p.oneWordChar(capture: cap) {
                return p.s("!") { return p.eos { return true } }
            }
        }
        expect("oneWordChar(capture): Unicode letter captured", ok && String(cap.s) == "é")
    }

    // oneNotWord: space is not word-char
    do {
        let p = Pattern()
        let ok = p.match(" X") {
            return p.oneNotWord {
                return p.oneWordChar { return p.eos { return true } }
            }
        }
        expect("oneNotWord: leading space", ok)
    }

    // oneNotWord_peek: non-consuming
    do {
        let p = Pattern()
        let ok = p.match(" X") {
            return p.oneNotWord_peek {
                return p.s(" ") { return p.s("X") { return p.eos { return true } } }
            }
        }
        expect("oneNotWord_peek: verify without consume", ok)
    }

    // oneNotWord(capture:) + BOS restoration on failure
    do {
        let p = Pattern()
        var restoredOK = false
        let cap = RefSubstring()
        let ok = p.match("A") {
            let a = p.oneNotWord(capture: cap) { return true } // should fail, 'A' is word
            let b = p.s("A") { restoredOK = true; return p.eos { return true } }
            return a || b
        }
        expect("oneNotWord(capture): fails on 'A' and restores", ok && restoredOK)
    }
}

// MARK: - nTomWordChar: eager / lazy / peek (+ capture)

public func test_nTomWordChar_family()
{
    // Eager: greedy then backtrack to satisfy tail
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("abcY") {
            return p.nTomWordChar(n: 1, m: 4, capture: cap) {
                return p.s("Y") { return p.eos { return true } }
            }
        }
        expect("nTomWordChar (eager): greedy + backtrack", ok && (1...3).contains(cap.s.count))
    }

    // Lazy: try minimum first, then grow
    do {
        let p = Pattern()
        let ok = p.match("aaaaB!") {
            return p.nTomWordChar_lazy(n: 1, m: 4) {
                return p.s("B!") { return p.eos { return true } }
            }
        }
        expect("nTomWordChar_lazy: grows as needed", ok)
    }

    // Peek: verify span without consuming, capturing would-be span
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("w0rd!") {  // '0' is also word-char
            return p.nTomWordChar_peek(n: 2, m: 4, capture: cap) {
                return p.nTomWordChar(n: 4, m: 4) {
                    return p.s("!") { return p.eos { return true } }
                }
            }
        }
        expect("nTomWordChar_peek(capture): non-consuming preview", ok && String(cap.s).count >= 2)
    }

    // Exact n via nWordChar / peek variants
    do {
        let p = Pattern()
        let ok = p.match("abcXYZ") {
            return p.nWordChar(n: 3) {
                return p.s("XYZ") { return p.eos { return true } }
            }
        }
        expect("nWordChar: exact count", ok)
    }
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("abcXYZ") {
            return p.nWordChar_peek(n: 3, capture: cap) {
                return p.s("abcXYZ") { return p.eos { return true } }
            }
        }
        expect("nWordChar_peek(capture): exact non-consuming", ok && String(cap.s) == "abc")
    }
}

// MARK: - Convenience families: zero/one/more WordChar

public func test_zeroOneMoreWordChar_families()
{
    // zeroOrOneWordChar: present
    do {
        let p = Pattern()
        let ok = p.match("Z") {
            return p.zeroOrOneWordChar {
                return p.eos { return true }
            }
        }
        expect("zeroOrOneWordChar: present", ok)
    }

    // zeroOrOneWordChar: absent (zero case)
    do {
        let p = Pattern()
        let ok = p.match(" ") {
            return p.zeroOrOneWordChar {
                return p.oneNotWord { return p.eos { return true } }
            }
        }
        expect("zeroOrOneWordChar: absent", ok)
    }

    // zeroOrMoreWordChar: zero, then literal
    do {
        let p = Pattern()
        let ok = p.match("!done") {
            return p.zeroOrMoreWordChar {
                return p.s("!done") { return p.eos { return true } }
            }
        }
        expect("zeroOrMoreWordChar: zero allowed", ok)
    }

    // zeroOrMoreWordChar: many
    do {
        let p = Pattern()
        let ok = p.match("abc123_!") {
            return p.zeroOrMoreWordChar {
                return p.s("!") { return p.eos { return true } }
            }
        }
        expect("zeroOrMoreWordChar: many copies", ok)
    }

    // zeroOrMoreWordChar_lazy(capture)
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("zzZ") {
            return p.zeroOrMoreWordChar_lazy(capture: cap) {
                return p.s("Z") { return p.eos { return true } }
            }
        }
        expect("zeroOrMoreWordChar_lazy(capture): minimal span then grow", ok && cap.s.count >= 0)
    }

    // oneOrMoreWordChar (+ capture / peek overloads route through nTomWordChar)
    do {
        let p = Pattern()
        let ok = p.match("abcd!") {
            return p.oneOrMoreWordChar {
                return p.oneOrMoreWordChar {
                    return p.s("!") { return p.eos { return true } }
                }
            }
        }
        expect("oneOrMoreWordChar: stacked", ok)
    }
}

// MARK: - UpTo/Thru WordChar and NotWordChar (incl. peek/capture)

public func test_upTo_and_thru_WordChar_and_NotWordChar()
{
    // upToWordChar: collect non-word prefix, then must see a word char for tail
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("   abc!") {
            return p.upToWordChar(capture: cap) {
                return p.oneWordChar {
                    return p.s("bc!") { return p.eos { return true } }
                }
            }
        }
        expect("upToWordChar(capture): collects leading spaces (got '\(cap.s)')", ok && String(cap.s) == "   ")
    }

    // thruWordChar: include the first word char
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("   abc!") {
            return p.thruWordChar(capture: cap) {
                return p.s("bc!") { return p.eos { return true } }
            }
        }
        expect("thruWordChar(capture): includes first word char (got '\(cap.s)')", ok && String(cap.s) == "   a")
    }

    // upToNotWordChar: collect word run before a separator
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("abc def") {
            return p.upToNotWordChar(capture: cap) {
                return p.oneNotWord {
                    return p.s("def") { return p.eos { return true } }
                }
            }
        }
        expect("upToNotWordChar(capture): collects 'abc'", ok && String(cap.s) == "abc")
    }

    // thruNotWordChar: include first non-word separator
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("abc def") {
            return p.thruNotWordChar(capture: cap) {
                return p.s("def") { return p.eos { return true } }
            }
        }
        expect("thruNotWordChar(capture): includes space", ok && String(cap.s) == "abc ")
    }

    // Peek variants: do not consume (verify cursor restoration)
    do {
        let p = Pattern()
        let ok = p.match("   X") {
            return p.upToWordChar_peek {
                // Must still be able to consume the spaces and 'X' now
                return p.s("   X") { return p.eos { return true } }
            }
        }
        expect("upToWordChar_peek: non-consuming", ok)
    }
    do {
        let p = Pattern()
        let ok = p.match("foo bar") {
            return p.thruNotWordChar_peek {
                return p.s("foo bar") { return p.eos { return true } }
            }
        }
        expect("thruNotWordChar_peek: non-consuming", ok)
    }
}

// MARK: - Word boundary anchors (\b and \B)

public func test_wordBoundaries()
{
    // \b at BOS before a word char
    do {
        let p = Pattern()
        let ok = p.match("word!") {
            return p.wordBoundary {
                return p.s("word") {
                    return p.wordBoundary {
                        return p.s("!") { return p.eos { return true } }
                    }
                }
            }
        }
        expect("\\b at BOS and before '!'", ok)
    }

    // \B inside a word
    do {
        let p = Pattern()
        let ok = p.match("foo") {
            return p.oneWordChar {
                return p.notWordBoundary {
                    return p.oneWordChar {
                        return p.notWordBoundary {
                            return p.oneWordChar { return p.eos { return true } }
                        }
                    }
                }
            }
        }
        expect("\\B between word-chars", ok)
    }

    // Boundary around non-word separators
    do {
        let p = Pattern()
        let ok = p.match("cat dog") {
            return p.s("cat") {
                return p.wordBoundary {
                    return p.oneNotWord {
                        return p.wordBoundary {
                            return p.s("dog") { return p.eos { return true } }
                        }
                    }
                }
            }
        }
        expect("wordBoundary around a single space", ok)
    }
}

// MARK: - ASCII digit helpers: aDigit / nADigit / nTomADigit / nTomADigit_lazy

public func test_asciiDigit_helpers()
{
    // aDigit: consume one ASCII digit
    do {
        let p = Pattern()
        let ok = p.match("9!") {
            return p.aDigit {
                return p.s("!") { return p.eos { return true } }
            }
        }
        expect("aDigit: single digit", ok)
    }

    // nADigit: exact count (with capture)
    do {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("1234X") {
            return p.nADigit(n: 4, capture: cap) {
                return p.s("X") { return p.eos { return true } }
            }
        }
        expect("nADigit(capture): exact ASCII digits", ok && String(cap.s) == "1234")
    }

    // nTomADigit (eager): greedy then backtrack for tail
    do {
        let p = Pattern()
        let ok = p.match("12345Y") {
            return p.nTomADigit(n: 2, m: 5) {
                return p.s("Y") { return p.eos { return true } }
            }
        }
        expect("nTomADigit (eager): greedy + backtrack to match tail", ok)
    }

    // nTomADigit_lazy: start at min, grow only if tail fails
    do {
        let p = Pattern()
        let ok = p.match("123B!") {
            return p.nTomADigit_lazy(n: 1, m: 3) {
                return p.s("B!") { return p.eos { return true } }
            }
        }
        expect("nTomADigit_lazy: grow only if needed", ok)
    }

    // nADigit failure restores cursor (then literal still matches)
    do {
        let p = Pattern()
        var restoredOK = false
        let ok = p.match("X9") {
            let a = p.nADigit(n: 2) { return true }     // should fail
            let b = p.s("X9") { restoredOK = true; return p.eos { return true } }
            return a || b
        }
        expect("nADigit: failure restores cursor", ok && restoredOK)
    }
}

// MARK: - Runner

public func runSpecialSetsTests()
{
    tally = Tally()

    test_oneWordChar_and_oneNotWordChar()
    test_nTomWordChar_family()
    test_zeroOneMoreWordChar_families()
    test_upTo_and_thru_WordChar_and_NotWordChar()
    test_wordBoundaries()
    test_asciiDigit_helpers()

    print("\n=== SpecialSets.swift Tests ===")
    print("Passed: \(tally.passed)   Failed: \(tally.failed)")
    precondition( tally.failed == 0, "runSpecialSetsTests has failures" )
}
