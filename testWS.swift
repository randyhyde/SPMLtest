//
//  testWS.swift
//  SPMLtest

import Foundation
import SPML



func testWS()
{

   let s1      = RefSubstring("")
   let s2      = RefSubstring("")
   let s3      = RefSubstring("")
   let s4      = RefSubstring("")

   var name    = ""
   var test    = ""
   
   var p       = Pattern()


   // whitespace_tests.swift
   // Print-driven, nested-closure tests:
   //   ws, ws_peek, zeroOrOneWS, zeroOrOneWS_lazy, zeroOrMoreWS, zeroOrMoreWS_lazy,
   //   zeroOrMoreWS_peek, oneOrMoreWS, oneOrMoreWS_lazy, oneOrMoreWS_peek,
   //   nWS, nWS_peek, nTomWS, nTomWS_lazy, nTomWS_peek,
   //   upToWS, upToWS_peek, thruWS, thruWS_peek,
   //   wsThenEOS, peekwsThenEOS, wsOrEOS, wsOrEOS_peek, peekWSOrEOS,
   //   s(_:, capture:_, _ tail), eos()

   // ------------------------------------------------------------
   // 1) ws ×3 on " \t\na", then s("a"), eos  (happy path, ASCII trio)
   // ------------------------------------------------------------
   do
   {
      name = "ws"
      test = " #1 triple-ws then 'a' then eos"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      s4.s = "*"
      p = Pattern()  // Clean up memory

      print()
      let pResult =
         p.match(" \t\na")
         {
            print("\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
                  terminator:"")

            let result1 =
            p.ws(capture:s1)
            {
               print("\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"")

               let result2 =
               p.ws(capture:s2)
               {
                  print("\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"")

                  let result3 =
                  p.ws(capture:s3)
                  {
                     print("p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"")
                     let result4 = p.s("a", capture:s4, { p.eos() })
                     return result4
                  } // ws #3
                  return result3
               } // ws #2
               return result2
            } // ws #1

            return result1
         } // match

      print()
      precondition(pResult, "\(name)\(test) failed to match string")
      precondition(s1.s == " ",   "\(name)\(test) failed, s1='\(s1.s)', expected space")
      precondition(s2.s == "\t",  "\(name)\(test) failed, s2='\(s2.s)', expected tab")
      precondition(s3.s == "\n",  "\(name)\(test) failed, s3='\(s3.s)', expected newline")
      precondition(s4.s == "a",   "\(name)\(test) failed, s4='\(s4.s)', expected 'a'")
      print("\(name)\(test) passed, s1='␠', s2='\\t', s3='\\n', s4='\(s4.s)'")
   }

   // ------------------------------------------------------------
   // 2) ws should fail at start of non-whitespace ("X")
   // ------------------------------------------------------------
   do
   {
      name = "ws"
      test = " #2 ws should fail on non-ws"
      s1.s = "*"
      p = Pattern()

      print()
      let pResult =
         p.match("X")
         {
            print("\(name)\(test) start: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.ws(capture:s1) { true }
            return r
         }

      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded")
      precondition(s1.s == "*", "\(name)\(test) capture should be unchanged, got '\(s1.s)'")
      print("\(name)\(test) passed (ws correctly failed on 'X')")
   }

   // ------------------------------------------------------------
   // 3) Unicode whitespace coverage: NBSP (U+00A0) and IDEOGRAPHIC SPACE (U+3000)
   // ------------------------------------------------------------
   do
   {
      name = "ws"
      test = " #3 unicode ws NBSP/IDEOGRAPHIC"
      s1.s = "*"
      s2.s = "*"
      let nbsp = "\u{00A0}"
      let ideographic = "\u{3000}"
      p = Pattern()

      print()
      let pResult =
         p.match(nbsp + "a")
         {
            print("\(name)\(test) NBSP: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.ws(capture:s1)
            {
               print("\(name)(NBSP ok, rest '\(p.haystack[p.cursor..<p.endStr])'), ",
                     terminator:"")
               let r2 = p.s("a", capture:s2) { p.eos() }
               return r2
            }
            return r1
         }

      print()
      precondition(pResult, "\(name)\(test) failed on NBSP")
      precondition(s1.s == nbsp, "\(name)\(test) s1 '\(s1.s)' expected NBSP")
      precondition(s2.s == "a", "\(name)\(test) s2 '\(s2.s)' expected 'a'")
      print("\(name)\(test) NBSP passed")

      s1.s = "*"; s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match(ideographic + "b")
         {
            print("\(name)\(test) IDEOGRAPHIC: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.ws(capture:s1)
            {
               print("\(name)(IDEOGRAPHIC ok, rest '\(p.haystack[p.cursor..<p.endStr])'), ",
                     terminator:"")
               let r2 = p.s("b", capture:s2) { p.eos() }
               return r2
            }
            return r1
         }

      print()
      precondition(pResult2, "\(name)\(test) failed on IDEOGRAPHIC SPACE")
      precondition(s1.s == ideographic, "\(name)\(test) s1 '\(s1.s)' expected IDEOGRAPHIC SPACE")
      precondition(s2.s == "b", "\(name)\(test) s2 '\(s2.s)' expected 'b'")
      print("\(name)\(test) IDEOGRAPHIC passed")
   }

   // ------------------------------------------------------------
   // 4) zeroOrOneWS present, absent, and capture
   // ------------------------------------------------------------
   do
   {
      name = "zeroOrOneWS"
      test = " #4 present/absent/capture"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p = Pattern()

      print()
      let pResult =
         p.match(" a")
         {
            print("\(name)\(test) present: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.zeroOrOneWS(capture:s1)
            {
               print("\(name)(present ok, '\(p.haystack[p.cursor..<p.endStr])'), ",
                     terminator:"")
               let r2 = p.s("a", capture:s2) { p.eos() }
               return r2
            }
            return r1
         }

      print()
      precondition(pResult, "\(name)\(test) failed when whitespace present")
      precondition(s1.s == " ", "\(name)\(test) expected s1 space, got '\(s1.s)'")
      precondition(s2.s == "a", "\(name)\(test) expected s2 'a', got '\(s2.s)'")
      print("\(name)\(test) present passed")

      // Absent: should still succeed, capture should remain unchanged or empty
      s1.s = "*"; s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match("a")
         {
            print("\(name)\(test) absent: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.zeroOrOneWS(capture:s1)
            {
               print("\(name)(absent ok, '\(p.haystack[p.cursor..<p.endStr])'), ",
                     terminator:"")
               let r2 = p.s("a", capture:s2) { p.eos() }
               return r2
            }
            return r1
         }

      print()
      precondition(pResult2, "\(name)\(test) failed when whitespace absent")
      precondition(s1.s == "*" || s1.s == "", "\(name)\(test) s1 '\(s1.s)' should be unchanged/empty")
      precondition(s2.s == "a", "\(name)\(test) s2 '\(s2.s)' expected 'a'")
      print("\(name)\(test) absent passed")

      // Lazy variant sanity check
      s3.s = "*"; p = Pattern()
      print()
      let pResult3 =
         p.match("  a")
         {
            print("\(name)\(test) lazy: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r =
            p.zeroOrOneWS_lazy(capture:s3)
            {
               return p.s("  a") { p.eos() } // ensure it didn’t consume the second space
            }
            print(
               "\(name)(lazy took '\(s3.s)', rest '\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            )
            return r
         }

      print()
      precondition(pResult3, "\(name)\(test) lazy failed")
      precondition(s3.s == " " || s3.s == "", "\(name)\(test) lazy s3 '\(s3.s)' should be '' or ' '")
      print("\(name)\(test) lazy passed")
   }

   // ------------------------------------------------------------
   // 5) zeroOrMoreWS: none/many + capture + peek (non-consuming)
   // ------------------------------------------------------------
   do
   {
      name = "zeroOrMoreWS"
      test = " #5 none/many/capture/peek"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p = Pattern()

      // none
      print()
      let pResult =
         p.match("A")
         {
            print("\(name)\(test) none: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.zeroOrMoreWS(capture:s1) { p.s("A") { p.eos() } }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) none failed")
      precondition(s1.s == "" || s1.s == "*", "\(name)\(test) s1 '\(s1.s)' should be '' or '*'")
      print("\(name)\(test) none passed")

      // many
      s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match(" \t\nZ")
         {
            print("\(name)\(test) many: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.zeroOrMoreWS(capture:s2) { p.s("Z") { p.eos() } }
            return r
         }
      print()
      precondition(pResult2, "\(name)\(test) many failed")
      precondition(s2.s == " \t\n", "\(name)\(test) s2 '\(s2.s)' expected ' \\t\\n'")
      print("\(name)\(test) many passed")

      // peek (ensure non-consuming by following with ws)
      s3.s = "*"; p = Pattern()
      print()
      let pResult3 =
         p.match("   X")
         {
            print(
               "\(name)\(test) peek: '\(p.haystack[p.cursor..<p.endStr])', ",
               terminator:""
            )
            let r1 =
            p.zeroOrMoreWS_peek(capture:s3)
            {
               // If peek didn’t consume, ws should still be present:
               
               return p.oneOrMoreWS() { p.s("X") { p.eos() } }
            }
            print(
               "\(name)(peek r1=\(r1), saw '\(s3.s)', rest '\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            )
            return r1
         }
      print()
      precondition(pResult3, "\(name)\(test) peek failed")
      precondition(s3.s == "   " || s3.s == "", "\(name)\(test) peek s3 '\(s3.s)' expected '   ' or ''")
      print("\(name)\(test) peek passed")
   }

   // ------------------------------------------------------------
   // 6) oneOrMoreWS: success/failure + lazy + peek
   // ------------------------------------------------------------
   do
   {
      name = "oneOrMoreWS"
      test = " #6 basic/lazy/peek"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      s4.s = "*"
      p = Pattern()

      // success
      print()
      let pResult =
         p.match("  Q")
         {
            print("\(name)\(test) success: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.oneOrMoreWS(capture:s1) { p.s("Q") { p.eos() } }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) success failed")
      precondition(s1.s == "  ", "\(name)\(test) s1 '\(s1.s)' expected two spaces")
      print("\(name)\(test) success passed")

      // failure when none
      s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match("Q")
         {
            print("\(name)\(test) fail-none: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.oneOrMoreWS(capture:s2) { true }
            return r
         }
      print()
      precondition(pResult2 == false, "\(name)\(test) unexpectedly succeeded with none")
      precondition(s2.s == "*", "\(name)\(test) s2 '\(s2.s)' should be unchanged")
      print("\(name)\(test) fail-none passed")

      // lazy: prefer shortest that lets tail pass
      s3.s = "*"; p = Pattern()
      print()
      let pResult3 =
         p.match("   Z")
         {
            print("\(name)\(test) lazy: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r =
            p.oneOrMoreWS_lazy(capture:s3)
            {
               return p.s("Z") { p.eos() }
            }
            print("\(name)(lazy took '\(s3.s)'), ", terminator:"")
            return r
         }
      print()
      precondition(pResult3, "\(name)\(test) lazy failed")
      precondition(s3.s.count >= 1, "\(name)\(test) lazy must capture ≥1 ws, got '\(s3.s)'")
      print("\(name)\(test) lazy passed")

      // peek: ensure non-consuming
      
      s4.s = "*"
      p = Pattern()
      print()
      let pResult4 =
         p.match("  Y")
         {
            print("\(name)\(test) peek: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.oneOrMoreWS_peek(capture:s4)
            {
               // Now actually consume them:
               return p.oneOrMoreWS() { p.s("Y") { p.eos() } }
            }
            print(
               "\(name)(peek saw '\(s4.s)', rest '\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            )
            return r1
         }
      print()
      precondition(pResult4, "\(name)\(test) peek failed")
      precondition(s4.s.count >= 1, "\(name)\(test) peek must see ≥1 ws, got '\(s4.s)'")
      print("\(name)\(test) peek passed")
   }

   // ------------------------------------------------------------
   // 7) nWS exact: success, failure, capture, and peek (non-consuming)
   // ------------------------------------------------------------
   do
   {
      name = "nWS"
      test = " #7 exact + peek"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p = Pattern()

      // exact success
      print()
      let pResult =
         p.match("   A")
         {
            print("\(name)\(test) exact 3: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.nWS(n:3, capture:s1) { p.s("A") { p.eos() } }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) exact 3 failed")
      precondition(s1.s == "   ", "\(name)\(test) s1 '\(s1.s)' expected three spaces")
      print("\(name)\(test) exact 3 passed")

      // exact fail
      s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match("  B")
         {
            print("\(name)\(test) exact 3 should fail: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.nWS(n:3, capture:s2) { true }
            return r
         }
      print()
      precondition(pResult2 == false, "\(name)\(test) exact 3 unexpectedly succeeded")
      precondition(s2.s == "*", "\(name)\(test) s2 '\(s2.s)' should be unchanged")
      print("\(name)\(test) exact fail passed")

      // peek (non-consuming)
      s3.s = "*"; p = Pattern()
      print()
      let pResult3 =
         p.match("  C")
         {
            print("\(name)\(test) peek 2: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.nWS_peek(n:2, capture:s3)
            {
               // Now consume them to prove peek was non-consuming
               return p.nWS(n:2) { p.s("C") { p.eos() } }
            }
            print(
               "\(name)(peek saw '\(s3.s)', rest '\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            )
            return r1
         }
      print()
      precondition(pResult3, "\(name)\(test) peek 2 failed")
      precondition(s3.s == "  ", "\(name)\(test) s3 '\(s3.s)' expected two spaces")
      print("\(name)\(test) peek 2 passed")
   }

   // ------------------------------------------------------------
   // 8) nTomWS eager: min/max bounds, success/fail + capture
   // ------------------------------------------------------------
   do
   {
      name = "nTomWS"
      test = " #8 eager bounds"
      s1.s = "*"
      s2.s = "*"
      p = Pattern()

      // success with n=2, m=4 on " \t\nX" -> consumes 3, tail true
      print()
      let pResult =
         p.match(" \t\nX")
         {
            print("\(name)\(test) eager ok: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.nTomWS(n:2, m:4, capture:s1) { true }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) eager success failed")
      precondition(s1.s.count >= 2 && s1.s.count <= 4,
                   "\(name)\(test) s1 '\(s1.s)' should be length 2..4")
      print("\(name)\(test) eager ok passed")

      // fail when fewer than n available
      s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match(" \n")
         {
            print("\(name)\(test) eager fail: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.nTomWS(n:3, m:5, capture:s2) { true }
            return r
         }
      print()
      precondition(pResult2 == false, "\(name)\(test) eager fail unexpectedly succeeded")
      precondition(s2.s == "*", "\(name)\(test) s2 '\(s2.s)' should be unchanged")
      print("\(name)\(test) eager fail passed")
   }

   // ------------------------------------------------------------
   // 9) nTomWS lazy: minimal consumption to satisfy tail
   // ------------------------------------------------------------
   do
   {
      name = "nTomWS_lazy"
      test = " #9 minimal consumption"
      s1.s = "*"
      p = Pattern()

      // "  A" with n=0,m=Int.max; tail wants "A" next. Lazy should capture "".
      print()
      let pResult =
         p.match("  A")
         {
            print("\(name)\(test) input: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r =
            p.nTomWS_lazy(n:0, m:Int.max, capture:s1)
            {
               return p.s("  A") { p.eos() } // if none consumed, full literal remains
            }
            print("\(name)(took '\(s1.s)'), ", terminator:"")
           return r
         }
      print()
      precondition(pResult, "\(name)\(test) failed")
      precondition(s1.s == "" || s1.s == "*",
                   "\(name)\(test) lazy should capture empty, got '\(s1.s)'")
      print("\(name)\(test) minimal consumption passed")
   }

   // ------------------------------------------------------------
   // 10) nTomWS_peek: range peek, then real consumption shows non-consuming
   // ------------------------------------------------------------
   do
   {
      name = "nTomWS_peek"
      test = " #10 peek range"
      s1.s = "*"
      p = Pattern()

      print()
      let pResult =
         p.match("   X")
         {
            print("\(name)\(test) peek: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.nTomWS_peek(n:2, m:3, capture:s1)
            {
               // Now consume them to prove peek was non-consuming:
               return p.nWS(n:3) { p.s("X") { p.eos() } }
            }
            print(
               "\(name)(peek saw '\(s1.s)', rest '\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            )
            return r1
         }
      print()
      precondition(pResult, "\(name)\(test) peek failed")
      precondition(s1.s.count >= 2 && s1.s.count <= 3, "\(name)\(test) s1 length must be 2..3")
      print("\(name)\(test) peek passed")
   }

   // ------------------------------------------------------------
   // 11) upToWS: capture before first ws; fail when no ws; peek variant
   // ------------------------------------------------------------
   do
   {
      name = "upToWS"
      test = " #11 capture/fail/peek"
      s1.s = "*"
      s2.s = "*"
      p = Pattern()

      // capture before first ws
      print()
      let pResult =
         p.match("hello world")
         {
            print("\(name)\(test) cap: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.upToWS(capture:s1) { p.ws() { p.s("world") { p.eos() } } }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) capture failed")
      precondition(s1.s == "hello", "\(name)\(test) s1 '\(s1.s)' expected 'hello'")
      print("\(name)\(test) capture passed")

      // fail when no ws
      s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match("nospaces")
         {
            print("\(name)\(test) fail: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.upToWS(capture:s2) { true }
            return r
         }
      print()
      precondition(pResult2 == false, "\(name)\(test) unexpectedly succeeded without ws")
      precondition(s2.s == "*", "\(name)\(test) s2 '\(s2.s)' should be unchanged")
      print("\(name)\(test) fail passed")

      // peek: confirm non-consuming by consuming after
      s3.s = "*"
      p = Pattern()
      print()
      let pResult3 =
         p.match("foo\tbar")
         {
            print("\(name)\(test) peek: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.upToWS_peek(capture:s3)
            {
               // Now actually thruWS to consume:
               return p.thruWS(capture:s1) { p.s("bar") { p.eos() } }
            }
            print("\(name)(peek cap '\(s3.s)'), ", terminator:"")
            return r1
         }
      print()
      precondition(pResult3, "\(name)\(test) peek failed")
      precondition(s3.s == "foo", "\(name)\(test) s3 '\(s3.s)' expected 'foo'")
      precondition(s1.s == "foo\t", "\(name)\(test) s1 '\(s1.s)' expected 'foo\\t'")
      print("\(name)\(test) peek passed")
   }

   // ------------------------------------------------------------
   // 12) thruWS: capture includes first ws; fail when no ws; peek variant
   // ------------------------------------------------------------
   do
   {
      name = "thruWS"
      test = " #12 capture/fail/peek"
      s1.s = "*"
      s2.s = "*"
      p = Pattern()

      // capture through first ws
      print()
      let pResult =
         p.match("abc def")
         {
            print("\(name)\(test) cap: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.thruWS(capture:s1) { p.s("def") { p.eos() } }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) capture failed")
      precondition(s1.s == "abc ", "\(name)\(test) s1 '\(s1.s)' expected 'abc '")
      print("\(name)\(test) capture passed")

      // fail when no ws
      s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match("abcdef")
         {
            print("\(name)\(test) fail: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.thruWS(capture:s2) { true }
            return r
         }
      print()
      precondition(pResult2 == false, "\(name)\(test) unexpectedly succeeded without ws")
      precondition(s2.s == "*", "\(name)\(test) s2 '\(s2.s)' should be unchanged")
      print("\(name)\(test) fail passed")

      // peek variant: non-consuming
      s3.s = "*"
      p = Pattern()
      print()
      let pResult3 =
         p.match("xy z")
         {
            print("\(name)\(test) peek: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r1 =
            p.thruWS_peek(capture:s3)
            {
               // consume now:
               return p.thruWS() { p.s("z") { p.eos() } }
            }
            print("\(name)(peek cap '\(s3.s)'), ", terminator:"")
            return r1
         }
      print()
      precondition(pResult3, "\(name)\(test) peek failed")
      precondition(s3.s == "xy ", "\(name)\(test) s3 '\(s3.s)' expected 'xy '")
      print("\(name)\(test) peek passed")
   }

   // ------------------------------------------------------------
   // 13) wsThenEOS / peekwsThenEOS: succeed with only ws→EOS, fail if trailing non-ws
   // ------------------------------------------------------------
   do
   {
      name = "wsThenEOS"
      test = " #13 eos-only"
      s1.s = "*"
      p = Pattern()

      // succeed: whitespace to EOS
      print()
      let pResult =
         p.match(" \t\n")
         {
            print("\(name)\(test) ok: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.wsThenEOS(capture:s1) { true }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) ok failed")
      precondition(s1.s == " \t\n", "\(name)\(test) s1 '\(s1.s)' expected ' \\t\\n'")
      print("\(name)\(test) ok passed")

      // peek version
      p = Pattern()
      print()
      let pResult2 =
         p.match("  ")
         {
            print("\(name)\(test) peek ok: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.peekwsThenEOS() { true }
            return r
         }
      print()
      precondition(pResult2, "\(name)\(test) peek ok failed")
      print("\(name)\(test) peek ok passed")

      // fail when trailing non-ws remains
      p = Pattern()
      print()
      let pResult3 =
         p.match("  X")
         {
            print("\(name)\(test) fail: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.wsThenEOS() { true }
            return r
         }
      print()
      precondition(pResult3 == false, "\(name)\(test) unexpectedly succeeded with trailing non-ws")
      print("\(name)\(test) fail passed")
   }

   // ------------------------------------------------------------
   // 14) wsOrEOS / peekWSOrEOS: EOS and WS succeed; non-WS fails; capture branches
   // ------------------------------------------------------------
   do
   {
      name = "wsOrEOS"
      test = " #14 branches"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p = Pattern()

      // EOS branch
      print()
      let pResult =
         p.match("")
         {
            print("\(name)\(test) eos: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.wsOrEOS(capture:s1) { true }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) eos failed")
      precondition(s1.s == "" || s1.s == "*", "\(name)\(test) s1 '\(s1.s)' should be ''/'*' at eos")
      print("\(name)\(test) eos passed")

      // WS branch
      s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match(" ")
         {
            print("\(name)\(test) ws: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.wsOrEOS(capture:s2) { p.eos() }
            return r
         }
      print()
      precondition(pResult2, "\(name)\(test) ws failed")
      precondition(s2.s == " ", "\(name)\(test) s2 '\(s2.s)' expected space")
      print("\(name)\(test) ws passed")

      // Non-WS should fail
      p = Pattern()
      print()
      let pResult3 =
         p.match("X")
         {
            print("\(name)\(test) non-ws: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.wsOrEOS() { true }
            return r
         }
      print()
      precondition(pResult3 == false, "\(name)\(test) non-ws unexpectedly succeeded")
      print("\(name)\(test) non-ws fail passed")

      // Peek version: EOS + WS + non-WS
      s4.s = "*"
      p = Pattern()
      print()
      let pResult4 =
         p.match("")
         {
            print("\(name)\(test) peek eos: (empty), ", terminator:"")
            let r = p.wsOrEOS_peek(capture:s4) { true }
            return r
         }
      print()
      precondition(pResult4, "\(name)\(test) peek eos failed")
      precondition(s4.s == "" || s4.s == "*", "\(name)\(test) s4 '\(s4.s)' should be ''/'*' at eos")
      print("\(name)\(test) peek eos passed")

      s4.s = "*"; p = Pattern()
      print()
      let pResult5 =
         p.match(" ")
         {
            print("\(name)\(test) peek ws: ' '", terminator:"")
            let r1 =
            p.peekWSOrEOS()
            {
               // now consume the space to prove it didn’t move:
               return p.ws() { p.eos() }
            }
            return r1
         }
      print()
      precondition(pResult5, "\(name)\(test) peek ws failed")
      print("\(name)\(test) peek ws passed")

      p = Pattern()
      print()
      let pResult6 =
         p.match("X")
         {
            print("\(name)\(test) peek non-ws: 'X'", terminator:"")
            let r = p.peekWSOrEOS() { true }
            return r
         }
      print()
      precondition(pResult6 == false, "\(name)\(test) peek non-ws unexpectedly succeeded")
      print("\(name)\(test) peek non-ws fail passed")
   }

   // ------------------------------------------------------------
   // 15) ws on empty input should fail; zeroOrMoreWS on empty should succeed
   // ------------------------------------------------------------
   do
   {
      name = "boundary-empty"
      test = " #15 ws vs zeroOrMoreWS on empty"
      s1.s = "*"
      s2.s = "*"
      p = Pattern()

      // ws should fail on empty
      print()
      let pResult =
         p.match("")
         {
            print("\(name)\(test) ws-empty: (empty), ", terminator:"")
            let r = p.ws(capture:s1) { true }
            return r
         }
      print()
      precondition(pResult == false, "\(name)\(test) ws on empty unexpectedly succeeded")
      precondition(s1.s == "*", "\(name)\(test) s1 '\(s1.s)' should be unchanged")
      print("\(name)\(test) ws-empty passed")

      // zeroOrMoreWS should succeed and capture empty
      s2.s = "*"; p = Pattern()
      print()
      let pResult2 =
         p.match("")
         {
            print("\(name)\(test) z* empty: (empty), ", terminator:"")
            let r = p.zeroOrMoreWS(capture:s2) { p.eos() }
            return r
         }
      print()
      precondition(pResult2, "\(name)\(test) zeroOrMoreWS on empty failed")
      precondition(s2.s == "" || s2.s == "*",
                   "\(name)\(test) s2 '\(s2.s)' should be ''/'*' at empty")
      print("\(name)\(test) z* empty passed")
   }


   // ------------------------------------------------------------
   // ASCII-only whitespace tests (using ws_ascii, wsOrEOS_ascii, etc.)
   // ------------------------------------------------------------

   // 1) ws_ascii: must match a space
   do
   {
      name = "ws_ascii"
      test = " #A1 single space"
      s1.s = "*"
      p = Pattern()

      print()
      let pResult =
         p.match(" a")
         {
            print("\(name)\(test) input: '\(p.haystack[p.cursor..<p.endStr])', ",
                  terminator:"")
            let r = p.ws_ascii { p.s("a") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 2) wsOrEOS_ascii: matches whitespace
   do
   {
      name = "wsOrEOS_ascii"
      test = " #A2 space before eos"
      p = Pattern()

      print()
      let pResult =
         p.match(" ")
         {
            print("\(name)\(test) input: ' ', ", terminator:"")
            let r = p.wsOrEOS_ascii { p.eos() }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 3) wsOrEOS_ascii: matches eos (empty string)
   do
   {
      name = "wsOrEOS_ascii"
      test = " #A3 empty string"
      p = Pattern()

      print()
      let pResult =
         p.match("")
         {
            print("\(name)\(test) input: '', ", terminator:"")
            let r = p.wsOrEOS_ascii { true }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 4) wsThenEOS_ascii: only whitespace to eos
   do
   {
      name = "wsThenEOS_ascii"
      test = " #A4 ws only"
      p = Pattern()

      print()
      let pResult =
         p.match("   ")
         {
            print("\(name)\(test) input: '   ', ", terminator:"")
            let r = p.wsThenEOS_ascii { true }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 5) peekwsThenEOS_ascii: checks but does not consume
   do
   {
      name = "peekwsThenEOS_ascii"
      test = " #A5 peek ws+eos"
      p = Pattern()

      print()
      let pResult =
         p.match(" \t")
         {
            print("\(name)\(test) input: ' \\t', ", terminator:"")
            let r = p.wsThenEOS_ascii_peek { true }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 6) peekWS_ascii: whitespace present, but cursor not advanced
   do
   {
      name = "peekWS_ascii"
      test = " #A6 peek space"
      p = Pattern()

      print()
      let pResult =
         p.match(" X")
         {
            print("\(name)\(test) input: ' X', ", terminator:"")
            let r = p.ws_ascii_peek { p.s(" X") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 7) upToWS_ascii: skips non-ws until first ws
   do
   {
      name = "upToWS_ascii"
      test = " #A7 skip to space"
      p = Pattern()

      print()
      let pResult =
         p.match("abc def")
         {
            print("\(name)\(test) input: 'abc def', ", terminator:"")
            let r = p.upToWS_ascii { p.ws_ascii { p.s("def") { p.eos() } } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 8) thruWS_ascii: consumes through first ws
   do
   {
      name = "thruWS_ascii"
      test = " #A8 thru space"
      p = Pattern()

      print()
      let pResult =
         p.match("abc def")
         {
            print("\(name)\(test) input: 'abc def', ", terminator:"")
            let r = p.thruWS_ascii { p.s("def") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 9) zeroOrOneWS_ascii: optional whitespace
   do
   {
      name = "zeroOrOneWS_ascii"
      test = " #A9 optional"
      p = Pattern()

      print()
      let pResult =
         p.match("a")
         {
            print("\(name)\(test) input: 'a', ", terminator:"")
            let r = p.zeroOrOneWS_ascii { p.s("a") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed on no ws")

      let pResult2 =
         p.match(" a")
         {
            print("\(name)\(test) input: ' a', ", terminator:"")
            let r = p.zeroOrOneWS_ascii { p.s("a") { p.eos() } }
            return r
         }

      precondition(pResult2, "\(name)\(test) failed on ws present")
      print("\(name)\(test) passed both")
   }

   // 10) zeroOrMoreWS_ascii: any amount
   do
   {
      name = "zeroOrMoreWS_ascii"
      test = " #A10 many"
      p = Pattern()

      print()
      let pResult =
         p.match("   z")
         {
            print("\(name)\(test) input: '   z', ", terminator:"")
            let r = p.zeroOrMoreWS_ascii { p.s("z") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed")
      print("\(name)\(test) passed")
   }

   // 11) oneOrMoreWS_ascii: must consume at least one
   do
   {
      name = "oneOrMoreWS_ascii"
      test = " #A11 one+"
      p = Pattern()

      print()
      let pResult =
         p.match("   z")
         {
            print("\(name)\(test) input: '   z', ", terminator:"")
            let r = p.oneOrMoreWS_ascii { p.s("z") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed when ws present")

      let pResult2 =
         p.match("z")
         {
            print("\(name)\(test) input: 'z', ", terminator:"")
            let r = p.oneOrMoreWS_ascii { p.s("z") { p.eos() } }
            return r
         }

      precondition(pResult2 == false, "\(name)\(test) unexpectedly succeeded on no ws")
      print("\(name)\(test) passed")
   }

   // 12) nWS_ascii: exact count
   do
   {
      name = "nWS_ascii"
      test = " #A12 exact"
      p = Pattern()

      print()
      let pResult =
         p.match("   q")
         {
            print("\(name)\(test) input: '   q', ", terminator:"")
            let r = p.nWS_ascii(n: 3) { p.s("q") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed for 3 ws")
      print("\(name)\(test) passed")
   }

   // 13) nTomWS_ascii: between bounds
   do
   {
      name = "nTomWS_ascii"
      test = " #A13 range"
      p = Pattern()

      print()
      let pResult =
         p.match("   q")
         {
            print("\(name)\(test) input: '   q', ", terminator:"")
            let r = p.nTomWS_ascii(n: 2, m: 4) { p.s("q") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed between 2..4 ws")
      print("\(name)\(test) passed")
   }

   // ------------------------------------------------------------
   // Additional ASCII-only negative/edge tests
   // ------------------------------------------------------------

   // A14) ws_ascii: fail on non-whitespace
   do
   {
      name = "ws_ascii"
      test = " #A14 fail non-ws"
      p = Pattern()

      print()
      let pResult =
         p.match("X")
         {
            print("\(name)\(test) input: 'X', ", terminator:"")
            let r = p.ws_ascii { true }
            return r
         }

      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded on 'X'")
      print("\(name)\(test) passed")
   }

   // A15) wsOrEOS_ascii: fail when not EOS and not ws
   do
   {
      name = "wsOrEOS_ascii"
      test = " #A15 fail non-ws non-eos"
      p = Pattern()

      print()
      let pResult =
         p.match("A")
         {
            print("\(name)\(test) input: 'A', ", terminator:"")
            let r = p.wsOrEOS_ascii { true }
            return r
         }

      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded on 'A'")
      print("\(name)\(test) passed")
   }

   // A16) wsThenEOS_ascii: fail when trailing non-ws exists
   do
   {
      name = "wsThenEOS_ascii"
      test = " #A16 fail trailing non-ws"
      p = Pattern()

      print()
      let pResult =
         p.match("   X")
         {
            print("\(name)\(test) input: '   X', ", terminator:"")
            let r = p.wsThenEOS_ascii { true }
            return r
         }

      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded with trailing 'X'")
      print("\(name)\(test) passed")
   }

   // A17) peekwsThenEOS_ascii: fail if any non-ws remains
   do
   {
      name = "peekwsThenEOS_ascii"
      test = " #A17 fail non-ws before eos"
      p = Pattern()

      print()
      let pResult =
         p.match("  Y")
         {
            print("\(name)\(test) input: '  Y', ", terminator:"")
            let r = p.wsThenEOS_ascii_peek { true }
            return r
         }

      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded when 'Y' remains")
      print("\(name)\(test) passed")
   }

   // A18) peekWS_ascii: fail at EOS and on non-ws
   do
   {
      name = "peekWS_ascii"
      test = " #A18 fail eos and non-ws"
      p = Pattern()

      // EOS
      print()
      let pResult =
         p.match("")
         {
            print("\(name)\(test) input: '', ", terminator:"")
            let r = p.ws_ascii_peek { true }
            return r
         }
      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded at EOS")

      // Non-ws
      let pResult2 =
         p.match("Z")
         {
            print("\(name)\(test) input: 'Z', ", terminator:"")
            let r = p.ws_ascii_peek { true }
            return r
         }
      precondition(pResult2 == false, "\(name)\(test) unexpectedly succeeded on 'Z'")
      print("\(name)\(test) passed")
   }

   // A19) upToWS_ascii: fail when no whitespace exists
   do
   {
      name = "upToWS_ascii"
      test = " #A19 fail no-ws"
      p = Pattern()

      print()
      let pResult =
         p.match("nospacehere")
         {
            print("\(name)\(test) input: 'nospacehere', ", terminator:"")
            let r = p.upToWS_ascii { true }
            return r
         }

      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded")
      print("\(name)\(test) passed")
   }

   // A20) thruWS_ascii: fail when no whitespace exists
   do
   {
      name = "thruWS_ascii"
      test = " #A20 fail no-ws"
      p = Pattern()

      print()
      let pResult =
         p.match("abcdef")
         {
            print("\(name)\(test) input: 'abcdef', ", terminator:"")
            let r = p.thruWS_ascii { true }
            return r
         }

      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded without ws")
      print("\(name)\(test) passed")
   }

   // A21) zeroOrOneWS_ascii: verify non-consuming when no ws
   do
   {
      name = "zeroOrOneWS_ascii"
      test = " #A21 no-ws non-consuming"
      p = Pattern()

      print()
      let pResult =
         p.match("Z")
         {
            print("\(name)\(test) input: 'Z', ", terminator:"")
            let r = p.zeroOrOneWS_ascii { p.s("Z") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed (should succeed with zero)")
      print("\(name)\(test) passed")
   }

   // A22) zeroOrMoreWS_ascii: verify it does not consume non-ws and still succeeds
   do
   {
      name = "zeroOrMoreWS_ascii"
      test = " #A22 no-ws non-consuming"
      p = Pattern()

      print()
      let pResult =
         p.match("K")
         {
            print("\(name)\(test) input: 'K', ", terminator:"")
            let r = p.zeroOrMoreWS_ascii { p.s("K") { p.eos() } }
            return r
         }

      print()
      precondition(pResult, "\(name)\(test) failed (should succeed with zero)")
      print("\(name)\(test) passed")
   }

   // A23) oneOrMoreWS_ascii: already covered success/fail; add tab-only and CRLF edge
   do
   {
      name = "oneOrMoreWS_ascii"
      test = " #A23 tabs/newlines"
      p = Pattern()

      // Single tab success
      print()
      let pResult =
         p.match("\tQ")
         {
            print("\(name)\(test) input: '\\tQ', ", terminator:"")
            let r = p.oneOrMoreWS_ascii { p.s("Q") { p.eos() } }
            return r
         }
      print()
      precondition(pResult, "\(name)\(test) failed on single tab")

      // CR then 'R' success (consumes CR only)
      let pResult2 =
         p.match("\rR")
         {
            print("\(name)\(test) input: '\\rR', ", terminator:"")
            let r = p.oneOrMoreWS_ascii { p.s("R") { p.eos() } }
            return r
         }
      precondition(pResult2, "\(name)\(test) failed on CR")
      print("\(name)\(test) passed")
   }

   // A24) nWS_ascii: fail when fewer than n ws are available
   do
   {
      name = "nWS_ascii"
      test = " #A24 fail fewer-than-n"
      p = Pattern()

      print()
      let pResult =
         p.match("  q") // only 2 spaces
         {
            print("\(name)\(test) input: '  q', ", terminator:"")
            let r = p.nWS_ascii(n: 3) { p.s("q") { p.eos() } }
            return r
         }

      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded with only 2 ws")
      print("\(name)\(test) passed")
   }

   // A25) nTomWS_ascii: fail when fewer than n; and fail if tail fails
   do
   {
      name = "nTomWS_ascii"
      test = " #A25 failures"
      p = Pattern()

      // Fewer than n (need 3, only 2 present)
      print()
      let pResult =
         p.match("  X")
         {
            print("\(name)\(test) input: '  X', ", terminator:"")
            let r = p.nTomWS_ascii(n: 3, m: 5) { true }
            return r
         }
      print()
      precondition(pResult == false, "\(name)\(test) unexpectedly succeeded with only 2 ws")

      // Enough ws but tail fails deliberately
      let pResult2 =
         p.match("   Y")
         {
            print("\(name)\(test) input: '   Y' (tail fails), ", terminator:"")
            let r = p.nTomWS_ascii(n: 1, m: 3) { false }
            return r
         }
      precondition(pResult2 == false, "\(name)\(test) should fail when tail fails")
      print("\(name)\(test) passed")
   }

   //========================================================================
   
   runWhitespaceSmokeTests()

}

// MARK: - Lightweight Test Harness

final class WSHarness {
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
      precondition( failed == 0, "WSHarness has failures" )
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

public func runWhitespaceSmokeTests() {
   let T = WSHarness()
   print("=== whitespace.swift Smoke Tests ===")

   // -----------------------------
   // Single-char whitespace: ws / ws_peek (+capture)
   // -----------------------------
   T.note("ws: match single whitespace and consume")
   T.expect(
      run(" \tX") { p in
         p.ws {
            T.expect(remaining(p) == "\tX", "ws should consume one whitespace")
            return true
         }
      },
      "ws should succeed on leading space"
   )

   T.note("ws: boundary — empty input fails")
   T.expect(
      !run("") { p in p.ws { true } },
      "ws should fail on empty haystack"
   )

   T.note("ws_peek: no consumption")
   T.expect(
      run("\nZ") { p in
         p.ws_peek {
            T.expect(remaining(p) == "\nZ", "ws_peek must not consume")
            return true
         }
      }
   )

   T.note("ws(capture:) stores exactly the matched char")
   T.expect(
      run(" \n") { p in
         let cap = RefSubstring()
         return p.ws(capture: cap) {
            T.expect(cap.s == " ", "ws capture mismatch: '\(cap.s)'")
            return true
         }
      }
   )

   T.note("ws_peek(capture:) captures but restores cursor")
   T.expect(
      run("\tX") { p in
         let cap = RefSubstring()
         return p.ws_peek(capture: cap) {
            T.expect(cap.s == "\t", "peek cap mismatch: '\(cap.s)'")
            T.expect(remaining(p) == "\tX", "ws_peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // nTomWS (eager), nTomWS_lazy, nTomWS_peek (+capture)
   // -----------------------------
   T.note("nTomWS eager: greedy, then backtrack for tail")
   T.expect(
      run(" \t \nX") { p in
         p.nTomWS(n: 1, m: 4) {
            // Tail requires next to be 'X'
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X" { return true }
            return false
         }
      },
      "nTomWS should align so next is 'X'"
   )

   T.note("nTomWS eager: boundary — cannot meet minimum")
   T.expect(
      !run("X") { p in p.nTomWS(n: 1, m: 3) { true } },
      "nTomWS should fail when no whitespace available"
   )

   T.note("nTomWS_lazy: grows only if tail fails")
   T.expect(
      run("   X") { p in
         p.nTomWS_lazy(n: 0, m: 3) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == " " { return true } // keep lazy-growing on spaces
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
            return true
         }
      }
   )

   T.note("nTomWS_peek: verifies without consumption")
   T.expect(
      run(" \n\t.") { p in
         p.nTomWS_peek(n: 2, m: 3) {
            T.expect(remaining(p) == " \n\t.", "peek must not consume")
            return true
         }
      }
   )

   T.note("nTomWS(capture:) captures the greedy span")
   T.expect(
      run(" \t \n!") { p in
         let cap = RefSubstring()
         return p.nTomWS(n: 1, m: 4, capture: cap) {
            T.expect(!cap.s.isEmpty && cap.s.allSatisfy { $0.isWhitespace }, "capture should be all whitespace")
            return true
         }
      }
   )

   T.note("nTomWS_lazy(capture:) minimal span that satisfies tail")
   T.expect(
      run("  X") { p in
         let cap = RefSubstring()
         return p.nTomWS_lazy(n: 0, m: 2, capture: cap) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X" {
               T.expect(cap.s.count <= 2, "lazy capture within bounds")
               return true
            }
            return false
         }
      }
   )

   T.note("nTomWS_peek(capture:) captures but does not consume")
   T.expect(
      run("  .") { p in
         let cap = RefSubstring()
         return p.nTomWS_peek(n: 1, m: 2, capture: cap) {
            T.expect(cap.s.allSatisfy { $0.isWhitespace }, "peek capture should be whitespace")
            T.expect(remaining(p) == "  .", "peek must restore cursor")
            return true
         }
      }
   )

   // -----------------------------
   // Convenience wrappers: zero/one/more (+lazy/+peek, +capture)
   // -----------------------------
   T.note("zeroOrOneWS: present and absent paths")
   T.expect(
      run(" x") { p in
         p.zeroOrOneWS {
            T.expect(remaining(p) == "x", "zeroOrOneWS should consume one when present")
            return true
         }
      }
   )
   T.expect(
      run("x") { p in
         p.zeroOrOneWS {
            T.expect(remaining(p) == "x", "zeroOrOneWS should accept zero")
            return true
         }
      }
   )

   T.note("zeroOrMoreWS and zeroOrMoreWS_peek")
   T.expect(
      run(" \t\n.") { p in
         p.zeroOrMoreWS {
            T.expect(remaining(p) == ".", "zeroOrMoreWS should consume all leading whitespace")
            return true
         }
      }
   )
   T.expect(
      run(" \n.") { p in
         p.zeroOrMoreWS_peek {
            T.expect(remaining(p) == " \n.", "peek must not consume")
            return true
         }
      }
   )

   T.note("oneOrMoreWS and oneOrMoreWS_peek")
   T.expect(
      run(" \tX") { p in
         p.oneOrMoreWS {
            T.expect(remaining(p) == "X", "oneOrMoreWS should consume ≥1 whitespace")
            return true
         }
      }
   )
   T.expect(
      run(" \tX") { p in
         p.oneOrMoreWS_peek {
            T.expect(remaining(p) == " \tX", "oneOrMoreWS_peek must not consume")
            return true
         }
      }
   )

   T.note("capture versions for zeroOrMoreWS / oneOrMoreWS")
   T.expect(
      run("   !") { p in
         let cap = RefSubstring()
         return p.zeroOrMoreWS(capture: cap) {
            T.expect(cap.s == "   ", "zeroOrMoreWS capture mismatch: '\(cap.s)'")
            return true
         }
      }
   )
   T.expect(
      run("\n\n.") { p in
         let cap = RefSubstring()
         return p.oneOrMoreWS(capture: cap) {
            T.expect(cap.s == "\n\n", "oneOrMoreWS capture mismatch: '\(cap.s)'")
            return true
         }
      }
   )

   // -----------------------------
   // Exactly-n wrappers: nWS / nWS_peek (+capture)
   // -----------------------------
   T.note("nWS: exact count and peek")
   T.expect(
      run("  .") { p in
         p.nWS(n: 2) {
            T.expect(remaining(p) == ".", "nWS should consume exactly 2 spaces")
            return true
         }
      }
   )
   T.expect(
      run("  .") { p in
         p.nWS_peek(n: 2) {
            T.expect(remaining(p) == "  .", "nWS_peek must not consume")
            return true
         }
      }
   )
   T.note("nWS(capture:) exact capture")
   T.expect(
      run("\t \t!") { p in
         let cap = RefSubstring()
         return p.nWS(n: 3, capture: cap) {
            T.expect(cap.s.count == 3 && cap.s.allSatisfy { $0.isWhitespace }, "nWS capture incorrect")
            return true
         }
      }
   )

   // -----------------------------
   // upToWS / thruWS (+peek, +capture)
   // -----------------------------
   T.note("upToWS stops before first whitespace; thruWS consumes it")
   T.expect(
      run("abc def") { p in
         p.upToWS {
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor].isWhitespace, "upToWS must stop at whitespace")
            return true
         }
      }
   )
   T.expect(
      run("abc def") { p in
         p.thruWS {
            T.expect(remaining(p) == "def", "thruWS should consume 'abc '")
            return true
         }
      }
   )

   T.note("upToWS_peek and thruWS_peek do not consume")
   T.expect(
      run("abc def") { p in
         p.upToWS_peek {
            T.expect(remaining(p) == "abc def", "upToWS_peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("x y") { p in
         p.thruWS_peek {
            T.expect(remaining(p) == "x y", "thruWS_peek must not consume")
            return true
         }
      }
   )

   T.note("upToWS(capture:) and thruWS(capture:)")
   T.expect(
      run("abc def") { p in
         let cap = RefSubstring()
         return p.upToWS(capture: cap) {
            T.expect(cap.s == "abc", "upToWS capture mismatch: '\(cap.s)'")
            return true
         }
      }
   )
   T.expect(
      run("abc def") { p in
         let cap = RefSubstring()
         return p.thruWS(capture: cap) {
            T.expect(cap.s == "abc ", "thruWS capture should include the whitespace")
            return true
         }
      }
   )

   // -----------------------------
   // wsThenEOS / peekwsThenEOS (+capture)
   // -----------------------------
   T.note("wsThenEOS: trailing whitespace to end of string")
   T.expect(
      run(" \t\n") { p in
         p.wsThenEOS {
            T.expect(remaining(p).isEmpty, "wsThenEOS must end at EOS")
            return true
         }
      }
   )

   T.note("peekwsThenEOS: verifies trailing whitespace + EOS without consuming")
   T.expect(
      run("  ") { p in
         p.peekwsThenEOS {
            T.expect(remaining(p) == "  ", "peekwsThenEOS must not consume")
            return true
         }
      }
   )

   T.note("wsThenEOS(capture:) grabs whole tail segment")
   T.expect(
      run("  ") { p in
         let cap = RefSubstring()
         return p.wsThenEOS(capture: cap) {
            T.expect(cap.s == "  ", "wsThenEOS capture mismatch: '\(cap.s)'")
            return true
         }
      }
   )

   // -----------------------------
   // wsOrEOS / peekWSOrEOS (+capture)
   // -----------------------------
   T.note("wsOrEOS succeeds at EOS or single leading whitespace")
   T.expect(
      run("") { p in p.wsOrEOS { true } },
      "wsOrEOS should succeed at EOS"
   )
   T.expect(
      run(" X") { p in
         p.wsOrEOS {
            T.expect(remaining(p) == "X", "wsOrEOS should consume one whitespace")
            return true
         }
      }
   )

   T.note("peekWSOrEOS: non-consuming")
   T.expect(
      run(" \n") { p in
         p.peekWSOrEOS {
            T.expect(remaining(p) == " \n", "peekWSOrEOS must not consume")
            return true
         }
      }
   )

   T.note("wsOrEOS(capture:) and wsOrEOS_peek(capture:)")
   T.expect(
      run(" Z") { p in
         let cap = RefSubstring()
         return p.wsOrEOS(capture: cap) {
            T.expect(cap.s == " ", "wsOrEOS capture should be single space")
            return true
         }
      }
   )
   T.expect(
      run("") { p in
         let cap = RefSubstring()
         return p.wsOrEOS_peek(capture: cap) {
            T.expect(cap.s.isEmpty, "peek capture at EOS should be empty slice")
            T.expect(remaining(p).isEmpty, "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // ASCII-fast-path variants
   // -----------------------------
   T.note("ws_ascii and ws_ascii_peek")
   T.expect(
      run("\tX") { p in
         p.ws_ascii {
            T.expect(remaining(p) == "X", "ws_ascii should consume ASCII whitespace")
            return true
         }
      }
   )
   T.expect(
      run(" Y") { p in
         p.ws_ascii_peek {
            T.expect(remaining(p) == " Y", "ws_ascii_peek must not consume")
            return true
         }
      }
   )

   T.note("wsOrEOS_ascii and wsThenEOS_ascii (+peek)")
   T.expect(
      run("") { p in p.wsOrEOS_ascii { true } },
      "wsOrEOS_ascii should succeed at EOS"
   )
   T.expect(
      run("  ") { p in
         p.wsThenEOS_ascii {
            T.expect(remaining(p).isEmpty, "wsThenEOS_ascii must end at EOS")
            return true
         }
      }
   )
   T.expect(
      run("   ") { p in
         p.wsThenEOS_ascii_peek {
            T.expect(remaining(p) == "   ", "wsThenEOS_ascii_peek must not consume")
            return true
         }
      }
   )

   T.note("upToWS_ascii and thruWS_ascii")
   T.expect(
      run("abc def") { p in
         p.upToWS_ascii {
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor].isWhitespace, "upToWS_ascii stop at space")
            return true
         }
      }
   )
   T.expect(
      run("abc def") { p in
         p.thruWS_ascii {
            T.expect(remaining(p) == "def", "thruWS_ascii should consume 'abc '")
            return true
         }
      }
   )

   T.note("zeroOrOneWS_ascii / zeroOrMoreWS_ascii / oneOrMoreWS_ascii")
   T.expect(
      run(" x") { p in
         p.zeroOrOneWS_ascii {
            T.expect(remaining(p) == "x", "zeroOrOneWS_ascii should consume when present")
            return true
         }
      }
   )
   T.expect(
      run("   .") { p in
         p.zeroOrMoreWS_ascii {
            T.expect(remaining(p) == ".", "zeroOrMoreWS_ascii should consume all ASCII ws")
            return true
         }
      }
   )
   T.expect(
      run(" \t!") { p in
         p.oneOrMoreWS_ascii {
            T.expect(remaining(p) == "!", "oneOrMoreWS_ascii should consume ≥1 ASCII ws")
            return true
         }
      }
   )

   T.note("nTomWS_ascii and nWS_ascii")
   T.expect(
      run(" \t \nX") { p in
         p.nTomWS_ascii(n: 2, m: 4) {
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "nTomWS_ascii tail alignment")
            return true
         }
      }
   )

   // Done
   T.summary()
}

