//
//  testSetC.swift
//  SPMLtest

import Foundation
import SPML

func testSetC()
{
   let s1      = RefSubstring("")
   let s2      = RefSubstring("")
   let s3      = RefSubstring("")
   let s4      = RefSubstring("")
   let s5      = RefSubstring("")

   let a       = SetC( "a"  )
   let aA      = SetC( "aA" )
   let bB      = SetC( "bB" )
   let c       = SetC( "c"  )
   let cC      = SetC( "cC" )
   let eE      = SetC( "eE" )
   let empty   = SetC()
   
   var name    = ""
   var i       = " "
   var test    = ""
   var pResult = false
   
   var p       = Pattern()
   
   //---------------------------------------------
   //
   // Test oneSetC


   name     = "oneSetC"
   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
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
         p.oneSetC( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneSetC #2
               return result3
            } // p.oneSetC #1
            return result2
         } // p.oneSetC
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   name = "oneSetC"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 cc"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aAAa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC( aA, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC( aA, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC( aA, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneSetC #3
               return result3
            } // p.oneSetC #2
            return result2
         } // p.oneSetC #1
         return result1
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "A", "\(name)\(test) failed, s2='\(s2.s)', expected 'A'" )
   precondition( s3.s == "A", "\(name)\(test) failed, s3='\(s3.s)', expected 'A'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


   name = "oneSetC"
   test = " #1-000 cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneSetC( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneSetC( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneSetC #3
                  } // p.s
               } // p.oneSetC #2
            } // p.s
         } // p.oneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   
   name = "oneSetC"
   test = " #1-000 cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   s5.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aAAaaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC( aA, capture:s1 )
         {
            print( "\(name)(0, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.oneSetC( aA, capture:s2 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneSetC( aA, capture:s3 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneSetC( a, capture:s4 )
                  {
                        print( "\(name)(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneSetC( aA, capture:s5 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "aa", {p.eos()} )
                        } // p.oneSetC #3
                  } // p.oneSetC #2
               } // p.oneSetC #1
            } // p.oneSetC #0
         } // p.oneSetC
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "A", "\(name)\(test) failed, s2='\(s2.s)', expected 'A'" )
   precondition( s3.s == "A", "\(name)\(test) failed, s3='\(s3.s)', expected 'A'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
   precondition( s5.s == "a", "\(name)\(test) failed, s5='\(s5.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )


   


   name = "oneSetC"
   test = " #1-111 cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneSetC( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "ba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneSetC( aA, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneSetC #2
                  } // p.s
               } // p.oneSetC #1
            } // p.s
         } // p.oneSetC
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "b", "\(name)\(test) failed, s2='\(s2.s)', expected 'b'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   name = "oneSetC"
   test = " #1-111 cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "AAABBABb" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC( aA, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "AA" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneSetC( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "BA" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneSetC( bB, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.s #3
                  } // p.s
               } // p.s #2
            } // p.s
         } // p.s #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "A", "\(name)\(test) failed, s1='\(s1.s)', expected 'A'" )
   precondition( s2.s == "B", "\(name)\(test) failed, s2='\(s2.s)', expected 'B'" )
   precondition( s3.s == "B", "\(name)\(test) failed, s3='\(s3.s)', expected 'B'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


   // Non-consuming versions:
   
   name = "oneSetC"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 c_"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneSetC #3
               return result3
            } // p.oneSetC #2
            return result2
            
         } // p.oneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )




   name = "oneSetC"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 c_"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "AAA" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC_peek( aA, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC_peek( aA, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC_peek( aA, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "AAA", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneSetC #3
               return result3
            } // p.oneSetC #2
            return result2
         } // p.oneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "A", "\(name)\(test) failed, s1='\(s1.s)', expected 'A'" )
   precondition( s2.s == "A", "\(name)\(test) failed, s2='\(s2.s)', expected 'A'" )
   precondition( s3.s == "A", "\(name)\(test) failed, s3='\(s3.s)', expected 'A'" )
   precondition( s4.s == "AAA", "\(name)\(test) failed, s3='\(s3.s)', expected 'AAA'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )





   // non-capture + consuming
   
   name = "oneSetC"
   test = " #1-111 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneSetC #3
               return result3
            } // p.oneSetC #2
            return result2
         } // p.oneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   name = "oneSetC"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 _c"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "AAAA" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC( aA )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC( aA )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC( aA )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "A", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneSetC #3
               return result3
            } // p.oneSetC #2
            return result2
            
         } // p.oneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "A", "\(name)\(test) failed, s1='\(s1.s)', expected 'A'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   // non-capture + not consuming
   
   name = "oneSetC"
   test = " #1 __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.s #3
               return result3
            } // p.s #2
            return result2
         } // p.s #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   name = "oneSetC"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1i __"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "AaA" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC_peek( aA )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC_peek( aA )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC_peek( aA )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "AaA", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.si #3
               return result3
            } // p.si #2
            return result2
            
         } // p.si #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "AaA", "\(name)\(test) failed, s1='\(s1.s)', expected 'AaA'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )





   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "oneSetC #2"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaA" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneSetC( aA, capture:s1 )
         {
            print( "p.\(test)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneSetC( aA, capture:s2 )
            {
               print( "p.\(test)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneSetC( aA, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.oneSetC #3
               return result3
            } // p.oneSetC #2
            return result2
            
         } // p.oneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "s \(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "A", "s \(test) failed, s3='\(s3.s)', expected 'A'" )
   print( "\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   test  = "oneSetC #3"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC( aA, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneSetC #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC( aA )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneSetC #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC_peek( aA, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneSetC #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC_peek( aA )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneSetC #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC_peek( empty )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneSetC #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC_peek( empty )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneSetC #8c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC_peek( a, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )



   s1.s  = "*"
   test  = "oneSetC #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC( eE )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneSetC #10"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneSetC #11"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC_peek( eE )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneSetC #12"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC_peek( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneSetC #12c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneSetC_peek( a, capture:s1 ){
            p.s("aa" )
         } // oneSetC_peek
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )

  //-----------------------------------------------------------------------------------------------
  //
  // nTomSetC
  
   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   test     =  " #1 cc"
   p        = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomSetC\(test) sequence: p.SetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomSetC( a, n:2, m:4 , capture:s1)
         {
            print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nTomSetC( bB, n:2, m:3, capture:s2 )
            {
               print( "p.nTomSetC(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
                  p.nTomSetC( c, n:1, m:3, capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.eos()
                     return result4
                  } // p.nTomSetC #3
               return result3
            } // p.nTomSetC #2
            return result2
         } //p.nTomSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "ccc", "nTomStr\(test) failed, s3='\(s3.s)', expected 'ccc'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   test =  " #1 Lazy cc"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomSetC_lazy( a, n:2, m:4, capture:s1 )
         {
            print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nTomSetC_lazy( bB, n:2, m:3, capture:s2 )
            {
               print( "p.nTomSetC(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
                  p.nTomSetC_lazy( c, n:1, m:3, capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.eos()
                     return result4
                  } // p.nTomSetC #3
               return result3
            } // p.nTomSetC #2
            return result2
         } //p.nTomSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "ccc", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'ccc'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  " #1 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomSetC_peek( a, n:2, m:4, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaaa" )
            {
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_peek( bB, n:2, m:3, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("bbb", capture:s3 )
                  {
                    print( "p.nTomSetC(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomSetC_peek( c, n:1, m:3, capture:s4 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "ccc", capture:s5 )
                        {
                           print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.eos()
                        }
                        return result4
                     } // p.nTomSetC #3
                  } // p.s #2
               } // p.nTomSetC #2
            } // p.s
         } //p.nTomSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), , s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "bbb", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'bbb'" )
   precondition( s4.s == "ccc", "nTomSetC\(test) failed, s4='\(s4.s)', expected 'ccc'" )
   precondition( s5.s == "ccc", "nTomSetC\(test) failed, s5='\(s5.s)', expected 'ccc'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )




   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  " #1 Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomStr\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomSetC_lazy( a, n:2, m:4, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa" )
            {
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( bB, n:2, m:3, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("b", capture:s3 )
                  {
                    print( "p.nTomSetC(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomSetC_lazy( c, n:1, m:3, capture:s4 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "cc", capture:s5, {p.eos()} )
                        return result4
                     } // p.nTomSetC #3
                  } // p.s #2
               } // p.nTomSetC #2
            } // p.s
         } //p.nTomSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bb", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "b",  "nTomSetC\(test) failed, s3='\(s3.s)', expected 'b'" )
   precondition( s4.s == "c",  "nTomSetC\(test) failed, s4='\(s4.s)', expected 'c'" )
   precondition( s5.s == "cc", "nTomSetC\(test) failed, s5='\(s5.s)', expected 'cc'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )





   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  " #1 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomSetC( a, n:2, m:4 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC( bB, n:2, m:3 )
            { // This is the tail
              print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
              p.nTomSetC( c, n:1, m:3 )
               {
                  let result4 = p.eos()
                  return result4
               } // p.nTomSetC #2
             } // p.nTomSetC #1
         } //p.nTomSetC
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )




   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  " #1 Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomSetC_lazy( a, n:2, m:4 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_lazy( bB, n:2, m:3 )
            { // This is the tail
              print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
              p.nTomSetC_lazy( c, n:1, m:3 )
               {
                  let result4 = p.eos()
                  return result4
               } // p.nTomSetC #2
             } // p.nTomSetC #1
         } //p.nTomSetC
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )


   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  "#1 __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbcCc" ){
         print(
            "p.nTomSetC \(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomSetC_peek( aA, n:2, m:4 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaaa", capture:s1 )
            {
               print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_peek( bB, n:2, m:3 )
               { // This is the tail
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("bbb", capture:s2 )
                  {
                    print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomSetC_peek( cC, n:1, m:3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "cCc", capture:s3, {p.eos()} )
                        return result4
                     } // p.nTomSetC #2
                  } // p.s #2
               } // p.nTomSetC #1
            } // p.s
         } //p.nTomSetC
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomSetC \(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomSetC \(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "bbb", "nTomSetC \(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "cCc", "nTomSetC \(test) failed, s3='\(s3.s)', expected 'cCc'" )
   print( "nTomSetC \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  "#1 Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbcCc" ){
         print(
            "p.nTomSetC \(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomSetC_lazy( a, n:2, m:4 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa", capture:s1 )
            {
               print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( bB, n:2, m:3 )
               { // This is the tail
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("b", capture:s2 )
                  {
                    print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomSetC_lazy( cC, n:1, m:3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "Cc", capture:s3, {p.eos()} )
                        return result4
                     } // p.nTomSetC #2
                  } // p.s #2
               } // p.nTomSetC #1
            } // p.s
         } //p.nTomSetC
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomSetC \(test) failed to match string" )
   precondition( s1.s == "aa", "nTomSetC \(test) failed, s1='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "b", "nTomSetC \(test) failed, s2='\(s2.s)', expected 'b'" )
   precondition( s3.s == "Cc", "nTomSetC \(test) failed, s3='\(s3.s)', expected 'Cc'" )
   print( "nTomSetC \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC \(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:4, m:6, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC( a, n:3, m:4, capture:s2 )
            { // This is the tail
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC( a, n:1, m:3, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
   precondition( s2.s == "aaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aa", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'aa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_lazy( a, n:4, m:6, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_lazy( a, n:3, m:4, capture:s2 )
            {
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( a, n:1, m:3, capture:s3, {p.eos()} )
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "aaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaa", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( a, n:4, m:6, capture:s1 )
         {
            p.s( "aaaaaa" )
            {
               print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_peek( a, n:3, m:4, capture:s2 )
               {
                  p.s("aaaa" )
                  {
                     print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.nTomSetC_peek( a, n:1, m:3, capture:s3 )
                     {
                        p.s("aa", {p.eos()} )
                     } // p.nTomSetC
                  } // p.s
               } // p.nTomSetC
            } // p.s
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
   precondition( s2.s == "aaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aa", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'aa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_lazy( a, n:4, m:6, capture:s1 )
         {
               print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( a, n:3, m:4, capture:s2 )
               {
                     print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.nTomSetC_lazy( a, n:1, m:3, capture:s3 )
                     {
                        p.s("aaaa", {p.eos()} )
                     } // p.nTomSetC
               } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "a", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:4, m:6 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC( a, n:3, m:4 )
            {
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC( a, n:1, m:3, {p.eos()} )
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_lazy( a, n:4, m:6 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_lazy( a, n:3, m:4 )
            {
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( a, n:1, m:3, {p.eos()} )
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( a, n:4, m:6 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_peek( a, n:3, m:4 )
            {
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_peek( a, n:1, m:3 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.nTomSetC
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_lazy( a, n:4, m:6 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_lazy( a, n:3, m:4 )
            {
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( a, n:1, m:3 )
               {
                  p.s("aaaa", {p.eos()} )
               } // p.nTomSetC
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )


   // Test #3-backtracking:

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC( a, n:3, m:4, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   print("xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "aaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaa", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_lazy( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_lazy( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( a, n:3, m:4, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaaa", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_peek( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_peek( a, n:3, m:4, capture:s3 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.s
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "aaaaaaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaaaaaa'" )
   precondition( s3.s == "aaaa", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_lazy( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_lazy( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( a, n:3, m:4, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.eos()
               } // p.nTomSetC_peek
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaaa", "nTomSetC\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:4, m:12 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC( a, n:3, m:4, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_lazy( a, n:4, m:12 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_lazy( a, n:4, m:8, capture:s2 )
            {
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_lazy( a, n:3, m:4, {p.eos()} )
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( a, n:4, m:12 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_peek( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC_peek( a, n:3, m:4 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.s
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_lazy( a, n:4, m:12 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_lazy( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomSetC( a, n:3, m:4 )
               {
                  p.s("a", {p.eos()} )
               } // p.s
            } // p.nTomSetC
         } //p.nTomSetC
      } // match
   print()
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )





   s1.s  = "*"
   test  = "nTomSetC #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( aA, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomSetC #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( aA, n:1, m:1, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomSetC #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( aA, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomSetC #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( empty, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomSetC #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( empty, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomSetC #8c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( a, n:1, m:1, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )



   s1.s  = "*"
   test  = "nTomSetC #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( eE, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomSetC #10"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:1, m:1, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomSetC #11"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( eE, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomSetC #12"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( a, n:1, m:1, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomSetC #12c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( a, n:1, m:1, capture:s1 ){
            p.s("aa" )
         } // oneSetC_peek
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #13"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC( a, n:4, m:8, capture:s2, {p.eos()} )
         } //p.nTomSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaaaaaa'" )
   precondition( s2.s == "aaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #14"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC_peek( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC_peek( a, n:4, m:12, capture:s2, {p.s("aaaaaaaaaaaa")} )
         } //p.nTomSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "aaaaaaaaaaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaaaaaaaaaa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #15"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:0, m:12, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC( a, n:12, m:12, capture:s2, {p.eos()} )
         } //p.nTomSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "", "nTomSetC\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "aaaaaaaaaaaa", "nTomSetC\(test) failed, s2='\(s2.s)', expected 'aaaaaaaaaaaa'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #16"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:0, m:12, capture:s1 )
         {
            print( "p.nTomSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomSetC( a, n:0, m:12, capture:s2 )
            {
               print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.eos()
            }
         } //p.nTomSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomSetC\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "", "nTomSetC\(test) failed, s2='\(s2.s)', expected ''" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #17"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( a, n:0, m:12, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "", "nTomSetC\(test) failed, s1='\(s1.s)', expected ''" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)'" )
   

   let thumb = SetC( "\u{1F44D}" ) // 👍
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #18"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "👍🏽" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( thumb, n:0, m:12, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( !pResult, "nTomSetC\(test) should have failed to match string" )
   print( "nTomSetC\(test) passed, by failing" )
 
   

   let thumbDarker = SetC( "👍🏽" ) // 👍🏽
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #19"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "👍🏽" ){
         print(
            "p.nTomSetC\(test) sequence: p.nTomSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomSetC( thumbDarker, n:0, m:12, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "nTomSetC\(test) failed to match string" )
   precondition( s1.s == "👍🏽", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected '👍🏽'" )
   print( "nTomSetC\(test) passed, s1='\(s1.s)'" )
 
   
   //--------------------------------------------------------------------------------------------------------
   //
   // zeroOrOneSetC
   
   

   // capture + consuming:
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_111 cc"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   // Capture, no consuming:
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_111 c_"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a, capture:s3)
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.s("a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   // no capture + consuming:
   
   test  = " #1_111 _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )


  s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a)
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a)
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )


   // no capture and not consuming

   
   test  = " #1_111-000 __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_peek( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )


   // Lazy capture + consuming:
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_111 Lazy cc"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_lazy( a, capture:s1)
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "a", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   // Lazy: Capture, not consuming.
   // Note: lazy + not consuming = eager/not consuming.
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_111 Lazy c_"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s("a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   



   // no capture + consuming:
   
   test  = " #1_111 _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )



   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a)
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )


   
   test  = " #1_111 Lazy _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_lazy( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_lazy( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )

 

   // no capture and not consuming

   
   test  = " #1_111-000 __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_peek( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )

   
   test  = " #1_111-000 Lazy __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC_peek( a )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC_peek( a )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   print( "zeroOrOneSetC\(test) passed" )




   // zeroOrOne capture + consuming + backtracking:
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-000 (bt) cc"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-100 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-110 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )




   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-111 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneSetC( a, capture:s2 )
            {
               print( "p.zeroOrOneSetC(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneSetC( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneSetC #3
               return result3
            } // p.zeroOrOneSetC #2
            return result2
            
         } // p.zeroOrOneSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "aaa", "zeroOrOneSetC\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   s1.s  = "*"
   test  = "zeroOrOneSetC #2"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC_peek( empty )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed" )


   s1.s  = "*"
   test  = "zeroOrOneSetC #3"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC_peek( empty )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed" )



   s1.s  = "*"
   test  = "zeroOrOneSetC #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC_peek( a, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )



   s1.s  = "*"
   test  = "zeroOrOneSetC #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC( eE )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed, by matching zero items" )



   s1.s  = "*"
   test  = "zeroOrOneSetC #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "zeroOrOneSetC #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC_peek( eE )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed, by matching empty" )



   s1.s  = "*"
   test  = "zeroOrOneSetC #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC_peek( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "zeroOrOneSetC #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC_peek( a, capture:s1 ){
            p.s("a" )
         } // oneSetC_peek
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #10"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneSetC( a, capture:s2, {p.eos()} )
         } //p.zeroOrOneSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #11"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneSetC_peek( a, capture:s2, {p.s("aaaaaaaaaaaa")} )
         } //p.zeroOrOneSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected 'a'" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #12"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneSetC( a, capture:s2, {p.eos()} )
         } //p.zeroOrOneSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneSetC\(test) failed, s2='\(s2.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #13"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneSetC_lazy\(test) sequence: p.zeroOrOneSetC_lazy('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneSetC_lazy(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneSetC_lazy( a, capture:s2 )
            {
               print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.eos()
            }
         } //p.zeroOrOneSetC
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOneSetC_lazy\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneSetC_lazy\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "a", "zeroOrOneSetC_lazy\(test) failed, s2='\(s2.s)', expected 'a'" )
   print( "zeroOrOneSetC_lazy\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #14"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneSetC\(test) sequence: p.zeroOrOneSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneSetC( a, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "zeroOrOneSetC\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneSetC\(test) failed, s1='\(s1.s)', expected ''" )
   print( "zeroOrOneSetC\(test) passed, s1='\(s1.s)'" )




   //--------------------------------------------------------------------------------------------
   //
   // zeroOrMoreSetC
   
  
   name     = "zeroOrMoreChar"
   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   test     = " #1 cc"
   p        = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreSetC( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreSetC( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreSetC #3
               return result3
            } // p.zeroOrMoreSetC #2
            return result2
            
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )







   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-000 cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



  




   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )






   // Non-consuming versions:
   
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 c_"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreSetC_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreSetC_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreSetC #3
               return result3
            } // p.zeroOrMoreSetC #2
            return result2
            
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aaa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-000 c_"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



 
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 c_"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ab", "\(name)\(test) failed, s4='\(s4.s)', expected 'ab'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



  
   // non-capture + consuming
   
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreSetC( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreSetC( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreSetC #3
               return result3
            } // p.zeroOrMoreSetC #2
            return result2
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



  


   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-000 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



 

   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



  

   // non-capture + not consuming
   
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreSetC_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreSetC #3
               return result3
            } // p.zeroOrMoreSetC #2
            return result2
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



  
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-000 __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )






   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_peek( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



 

   // Lazy variants:
   
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 Lazy cc"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_lazy( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreSetC_lazy( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreSetC_lazy( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreSetC #3
               return result3
            } // p.zeroOrMoreSetC #2
            return result2
            
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-000 Lazy cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_lazy( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 Lazy cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_lazy( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



   // Non-consuming versions:
   
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 Lazy c_"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreSetC_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreSetC_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreSetC #3
               return result3
            } // p.zeroOrMoreSetC #2
            return result2
            
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aaa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-000 Lazy c_"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )





   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 Lazy c_"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_peek( a, capture:s3)
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ab", "\(name)\(test) failed, s4='\(s4.s)', expected 'ab'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   // non-capture + consuming
   
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 Lazy _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_lazy( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreSetC_lazy( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreSetC_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreSetC #3
               return result3
            } // p.zeroOrMoreSetC #2
            return result2
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-000 Lazy _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )





   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 Lazy _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_lazy( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 Lazy __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreSetC_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreSetC #3
               return result3
            } // p.zeroOrMoreSetC #2
            return result2
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-000 Lazy __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a)
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




    i    = ""
   name = "zeroOrMoreSetC\(i)"
   test = " #1-111 Lazy __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrMoreSetC_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreSetC_peek( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreSetC #3
                  } // p.s
               } // p.zeroOrMoreSetC #2
            } // p.s
         } // p.zeroOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   //-----------------------------------------------------------------------------------------------
   //
   // oneOrMoreSetC
   
   
   i    = ""
   name = "oneOrMoreChar\(i)"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 cc"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC( a, capture:s1)
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreSetC( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreSetC( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreSetC #3
               return result3
            } // p.oneOrMoreSetC #2
            return result2
            
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )






   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-000 cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )





   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




   // Non-consuming versions:
   
   i    = ""
   name = "oneOrMoreSetC\(i)"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 c_"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreSetC_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreSetC_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreSetC #3
               return result3
            } // p.oneOrMoreSetC #2
            return result2
            
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aaa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-000 c_"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( a, capture:s2)
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )






   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 c_"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a, capture:s1)
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ab", "\(name)\(test) failed, s4='\(s4.s)', expected 'ab'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



 

   // non-capture + consuming
   
   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreSetC( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreSetC( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreSetC #3
               return result3
            } // p.oneOrMoreSetC #2
            return result2
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-000 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



  




   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreSetC_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreSetC #3
               return result3
            } // p.oneOrMoreSetC #2
            return result2
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-000 __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )


   // Lazy variants:
   
   i    = ""
   name = "oneOrMoreSetC\(i)"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 Lazy cc"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_lazy( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreSetC_lazy( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreSetC_lazy( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreSetC #3
               return result3
            } // p.oneOrMoreSetC #2
            return result2
            
         } // p.oneOrMoreSetC #1
         return result1

      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-000 Lazy cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaaaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_lazy( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )





   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 Lazy cc"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_lazy( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



   // Non-consuming versions:
   
   i    = ""
   name = "oneOrMoreSetC\(i)"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 Lazy c_"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreSetC_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreSetC_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreSetC #3
               return result3
            } // p.oneOrMoreSetC #2
            return result2
            
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aaa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-000 Lazy c_"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )






   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 Lazy c_"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   s4.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ab", "\(name)\(test) failed, s4='\(s4.s)', expected 'ab'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



   // non-capture + consuming
   
   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 Lazy _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_lazy( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreSetC_lazy( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreSetC_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreSetC #3
               return result3
            } // p.oneOrMoreSetC #2
            return result2
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-000 Lazy _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaaaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )





   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 Lazy _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaabbaab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_lazy( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 Lazy __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreSetC_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreSetC #3
               return result3
            } // p.oneOrMoreSetC #2
            return result2
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-000 Lazy __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 Lazy __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = "i"
   name = "oneOrMoreSetC\(i)"
   test = " #1-111 Lazy __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneOrMoreSetC_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreSetC_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreSetC_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreSetC #3
                  } // p.s
               } // p.oneOrMoreSetC #2
            } // p.s
         } // p.oneOrMoreSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   //---------------------------------------------------------------------------------------
   //
   // nSetC
   
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "#1"
   print()
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaA" ){
         print(
            "p.nSetC \(test) sequence: p.nSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nSetC( a, capture:s1, n:1 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nSetC( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nSetC( aA, capture:s3, n:1 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.nStr #3
               return result3
            } // p.nStr #2
            return result2
            
         } // p.nStr #1
         return result1
         
      } // match
   print()
   precondition( pResult, "nSetC \(test) failed to match string" )
   precondition( s1.s == "a", "nSetC \(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "nSetC \(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "A", "nSetC \(test) failed, s3='\(s3.s)', expected 'A'" )
   print( "nSetC \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "#2"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaAAAA" ){
         print(
            "p.nSetC \(test) sequence: p.nSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nSetC( a, capture:s1, n:4 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nSetC( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nSetC( aA, capture:s3, n:3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.oneOrMoreChari #3
               return result3
            } // p.oneOrMoreChari #2
            return result2
            
         } // p.oneOrMoreChar #1
         return result1
         
      } // match
   print()
   precondition( pResult, "nSetC \(test) failed to match string" )
   precondition( s1.s == "aaaa", "nSetC \(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "A", "nSetC \(test) failed, s2='\(s2.s)', expected 'A'" )
   precondition( s3.s == "AAA", "nSetC \(test) failed, s3='\(s3.s)', expected 'AAA'" )
   print( "nSetC \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "#3"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaAAA" ){
         print(
            "p.nSetC \(test) sequence: p.nSetC('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nSetC( a, capture:s1, n:4 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nSetC( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nSetC( aA, capture:s3, n:3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.nSetC #3
               return result3
            } // p.nSetC #2
            return result2
            
         } // p.nSetC #1
         return result1
         
      } // match
   print()
   precondition( !pResult, "nSetC \(test) should have returned failure" )
   print( "nSetC \(test) passed" )





//---------------------------------------------
//
// Test upToSetC


   name 	   = "upToSetC"
   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test 	   = " #1 cc"
   p    	   = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "abababa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.upToSetC( bB, capture:s1 )
         {
            print( "p.s(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s("b" )
            {
            
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.upToSetC( bB, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "b" )
                  {
                     print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.upToSetC( bB, capture:s3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        return p.s( "ba", capture:s4, {p.eos()} )
                     } // p.upToSetC #3
                  } // end p.s #2
               } // p.upToSetC #2
            } // end p.s #1
         } // p.upToSetC #1
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ba", "\(name)\(test) failed, s4='\(s4.s)', expected 'ba'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   // Non-consuming versions:
   
   name = "upToSetC_peek"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 c_"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "ababab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.upToSetC_peek( bB, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.upToSetC_peek( bB, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.upToSetC_peek( bB, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "ababab", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.upToSetC #3
            } // p.upToSetC #2
         } // p.upToSetC #1
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ababab", "\(name)\(test) failed, s4='\(s4.s)', expected 'ababab'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   // non-capture + consuming
   
   name = "upToSetC"
   test = " #1 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "abababa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.upToSetC( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.upToSetC( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.upToSetC( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "baba", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.upToSetC #3
               return result3
            } // p.upToSetC #2
            return result2
         } // p.upToSetC #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "baba", "\(name)\(test) failed, s1='\(s1.s)', expected 'baba'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )

   
   name = "upToSetC"
   test = " #2"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.upToSetC( bB, {p.eos()} )
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( !pResult, "\(name)\(test) should have failed to match string" )
   print( "\(name)\(test) passed, by failing" )

   
   name = "upToSetC"
   test = " #3"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.upToSetC( empty, {p.eos()} )
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( !pResult, "\(name)\(test) should have failed to match string" )
   print( "\(name)\(test) passed, by failing" )






//---------------------------------------------
//
// Test thruStr/thruStri.




   name 	   = "thruSetC"
   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test 	   = " #1 cc"
   p    	   = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "abababa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.thruSetC( bB, capture:s1 )
         {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.thruSetC( bB, capture:s2 )
               {
                     print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.thruSetC( bB, capture:s3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        return p.s( "a", capture:s4, {p.eos()} )
                     } // p.thruSetC #3
               } // p.thruSetC #2
         } // p.thruSetC #1
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "ab", "\(name)\(test) failed, s1='\(s1.s)', expected 'ab'" )
   precondition( s2.s == "ab", "\(name)\(test) failed, s2='\(s2.s)', expected 'ab'" )
   precondition( s3.s == "ab", "\(name)\(test) failed, s3='\(s3.s)', expected 'ab'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   // Non-consuming versions:
   
   name = "thruSetC"
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   test = " #1 c_"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "ababab" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.thruSetC_peek( bB, capture:s1)
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruSetC_peek( bB, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruSetC_peek( bB, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "ababab", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.thruStr #3
               return result3
            } // p.thruStr #2
            return result2
            
         } // p.thruStr #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "ab", "\(name)\(test) failed, s1='\(s1.s)', expected 'ab'" )
   precondition( s2.s == "ab", "\(name)\(test) failed, s2='\(s2.s)', expected 'ab'" )
   precondition( s3.s == "ab", "\(name)\(test) failed, s3='\(s3.s)', expected 'ab'" )
   precondition( s4.s == "ababab", "\(name)\(test) failed, s4='\(s4.s)', expected 'ababab'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   // non-capture + consuming
   
   name = "thruSetC"
   test = " #1 _c"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "abababa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.thruSetC( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruSetC( bB )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruSetC( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.thruSetC #3
               return result3
            } // p.thruSetC #2
            return result2
         } // p.thruSetC #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )


   // non-capture + not consuming
   
   name = "thruSetC"
   test = " #1 __"
   s1.s = "*"
   p    = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "abaa" ){
         print(
            "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.thruSetC_peek( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruSetC_peek( bB )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruSetC_peek( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "abaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.thruStr #3
               return result3
            } // p.thruStr #2
            return result2
         } // p.thruStr #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "abaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'abaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )


   //=========================================================================
   
   runSetCSmokeTests()
}


// MARK: - Lightweight Test Harness (no XCTest)

final class SetCHarness {
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
      precondition( failed == 0, "SetCHarness has failures" )
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

public func runSetCSmokeTests() {
   let T = SetCHarness()
   print("=== SetC.swift Smoke Tests ===")

   // -----------------------------
   // SetC initializers & basics
   // -----------------------------
   T.note("SetC(ch:) and SetC(str:) construct expected sets")
   do {
      let s1 = SetC(ch: "A")
      T.expect(s1.contains("A"), "SetC(ch:) should contain 'A'")
      T.expect(!s1.contains("Z"), "SetC(ch:) should not contain 'Z'")

      let s2 = SetC(str: "Ab_")
      T.expect(s2.contains("A") && s2.contains("b") && s2.contains("_"),
               "SetC(str:) should contain all characters from input")
   }

   // Handy sets for tests
   let letters = SetC(str: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
   let digits  = SetC(str: "0123456789")
   let wordish = SetC(str: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_")
   let dashSet = SetC(ch: "-")
   let colon   = SetC(ch: ":")

   // -----------------------------
   // oneSetC / peek (+capture)
   // -----------------------------
   T.note("oneSetC consumes a single matching character")
   T.expect(
      run("9x") { p in
         p.oneSetC(digits) {
            T.expect(remaining(p) == "x", "oneSetC should consume '9'")
            return true
         }
      },
      "oneSetC should succeed on digit"
   )

   T.note("oneSetC boundary: fails on empty or non-member")
   T.expect(!run("") { p in p.oneSetC(digits) { true } }, "oneSetC should fail on empty")
   T.expect(!run("A") { p in p.oneSetC(digits) { true } }, "oneSetC should fail on non-digit")

   T.note("oneSetC_peek: non-consuming")
   T.expect(
      run("A!") { p in
         p.oneSetC_peek(letters) {
            T.expect(remaining(p) == "A!", "peek must not consume")
            return true
         }
      },
      "oneSetC_peek should succeed and not consume"
   )

   T.note("oneSetC(capture:) / oneSetC_peek(capture:)")
   T.expect(
      run("_-") { p in
         let cap = RefSubstring()
         return p.oneSetC(wordish, capture: cap) {
            T.expect(cap.s == "_", "capture should be '_'")
            return true
         }
      }
   )
   T.expect(
      run("B?") { p in
         let cap = RefSubstring()
         return p.oneSetC_peek(letters, capture: cap) {
            T.expect(cap.s == "B", "peek capture should be 'B'")
            T.expect(remaining(p) == "B?", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // nTomSetC (eager) / lazy / peek (+capture)
   // -----------------------------
   T.note("nTomSetC eager: greedy, then backtrack to satisfy tail")
   T.expect(
      run("1234X") { p in
         p.nTomSetC(digits, n: 1, m: 5) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X" { return true }
            return false
         }
      },
      "nTomSetC should align so next is 'X'"
   )

   T.note("nTomSetC: cannot meet minimum (boundary)")
   T.expect(
      !run("abc") { p in p.nTomSetC(digits, n: 2, m: 3) { true } },
      "nTomSetC should fail if < n members available"
   )

   T.note("nTomSetC_lazy: grows only as needed")
   T.expect(
      run("aaX") { p in
         p.nTomSetC_lazy(letters, n: 0, m: 3) {
            p.c_peek( "X" ){
               if p.cursor < p.endStr, letters.contains(p.haystack[p.cursor]) { return true }
               T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
               return true
            }
         }
      }
   )

   T.note("nTomSetC_peek: verify without consuming")
   T.expect(
      run("12ab") { p in
         p.nTomSetC_peek(digits, n: 2, m: 3) {
            T.expect(remaining(p) == "12ab", "peek must not consume")
            return true
         }
      }
   )

   T.note("nTomSetC capture variants (eager/lazy/peek)")
   T.expect(
      run("abc123!") { p in
         let cap = RefSubstring()
         return p.nTomSetC(wordish, n: 3, m: 6, capture: cap) {
            T.expect(!cap.s.isEmpty && cap.s.hasPrefix("abc"), "capture should begin with 'abc'")
            return true
         }
      }
   )
   T.expect(
      run("999X") { p in
         let cap = RefSubstring()
         return p.nTomSetC_lazy(digits, n: 0, m: 3, capture: cap) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X" {
               T.expect(cap.s.count <= 3, "lazy capture within m")
               return true
            }
            return false
         }
      }
   )
   T.expect(
      run("123-") { p in
         let cap = RefSubstring()
         return p.nTomSetC_peek(digits, n: 1, m: 3, capture: cap) {
            T.expect(["1","12","123"].contains(String(cap.s)), "peek capture should be 1..3 digits")
            T.expect(remaining(p) == "123-", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // zero/one/more wrappers (+lazy/+peek, +capture)
   // -----------------------------
   T.note("zeroOrOneSetC: present and absent")
   T.expect(
      run("Z") { p in p.zeroOrOneSetC(letters) { remaining(p).isEmpty } },
      "zeroOrOneSetC should consume when present"
   )
   T.expect(
      run("1") { p in p.zeroOrOneSetC(letters) { remaining(p) == "1" } },
      "zeroOrOneSetC should accept zero"
   )

   T.note("zeroOrMoreSetC & peek & capture")
   T.expect(
      run("ABC!") { p in
         p.zeroOrMoreSetC(letters) {
            T.expect(remaining(p) == "!", "zeroOrMoreSetC should consume letters")
            return true
         }
      }
   )
   T.expect(
      run("ABC!") { p in
         p.zeroOrMoreSetC_peek(letters) {
            T.expect(remaining(p) == "ABC!", "peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("__-") { p in
         let cap = RefSubstring()
         return p.zeroOrMoreSetC(wordish, capture: cap) {
            T.expect(cap.s == "__", "zeroOrMoreSetC capture mismatch: \(cap.s)")
            return true
         }
      }
   )

   T.note("oneOrMoreSetC / oneOrMoreSetC_lazy (incl. capture)")
   T.expect(
      run("aa.") { p in
         p.oneOrMoreSetC(letters) {
            T.expect(remaining(p) == ".", "oneOrMoreSetC should consume ≥1")
            return true
         }
      }
   )
   T.expect(
      run("aaX") { p in
         let cap = RefSubstring()
         return p.oneOrMoreSetC_lazy(letters, capture: cap) {
            p.c_peek( "X" ){
               T.expect(!cap.s.isEmpty, "lazy oneOrMore still requires ≥1")
               T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
               return true
            }
         }
      }
   )

   // -----------------------------
   // Exact-n wrappers: nSetC / nSetC_peek (+capture)
   // -----------------------------
   T.note("nSetC exact count and peek")
   T.expect(
      run("123!") { p in
         p.nSetC(digits, n: 3) {
            T.expect(remaining(p) == "!", "nSetC(3) should consume '123'")
            return true
         }
      }
   )
   T.expect(
      run("123!") { p in
         p.nSetC_peek(digits, n: 3) {
            T.expect(remaining(p) == "123!", "nSetC_peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("AB12-") { p in
         let cap = RefSubstring()
         return p.nSetC(wordish, capture: cap, n: 4) {
            T.expect(cap.s == "AB12", "nSetC capture mismatch: \(cap.s)")
            return true
         }
      }
   )
   T.expect(
      run("abc") { p in
         let cap = RefSubstring()
         return p.nSetC_peek(letters, capture: cap, n: 2) {
            T.expect(cap.s == "ab", "nSetC_peek capture should be 'ab'")
            T.expect(remaining(p) == "abc", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // upToSetC / thruSetC (+peek, +capture)
   // -----------------------------
   T.note("upToSetC stops before delimiter; thruSetC includes it")
   T.expect(
      run("foo-bar") { p in
         p.upToSetC(dashSet) {
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "-", "upToSetC must stop at '-'")
            return true
         }
      }
   )
   T.expect(
      run("foo-bar") { p in
         p.thruSetC(dashSet) {
            T.expect(remaining(p) == "bar", "thruSetC should consume 'foo-'")
            return true
         }
      }
   )

   T.note("peek variants are non-consuming")
   T.expect(
      run("ab:rest") { p in
         p.upToSetC_peek(colon) {
            T.expect(remaining(p) == "ab:rest", "upToSetC_peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("ab:rest") { p in
         p.thruSetC_peek(colon) {
            T.expect(remaining(p) == "ab:rest", "thruSetC_peek must not consume")
            return true
         }
      }
   )

   T.note("capturing variants: upToSetC excludes delimiter; thruSetC includes it")
   T.expect(
      run("pre-post") { p in
         let cap = RefSubstring()
         return p.upToSetC(dashSet, capture: cap) {
            T.expect(cap.s == "pre", "upToSetC capture mismatch: \(cap.s)")
            return true
         }
      }
   )
   T.expect(
      run("pre:post") { p in
         let cap = RefSubstring()
         return p.thruSetC(colon, capture: cap) {
            T.expect(cap.s == "pre:", "thruSetC capture should include ':'")
            return true
         }
      }
   )
   T.expect(
      run("pre:post") { p in
         let cap = RefSubstring()
         return p.thruSetC_peek(colon, capture: cap) {
            T.expect(cap.s == "pre:", "thruSetC_peek capture should include ':'")
            T.expect(remaining(p) == "pre:post", "thruSetC_peek must restore cursor")
            return true
         }
      }
   )

   // -----------------------------
   // Final summary
   // -----------------------------
   T.summary()
}
