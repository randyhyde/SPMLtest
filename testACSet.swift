//
//  testACSet.swift
//  SPMLtest

import Foundation
import SPML

func testACSet()
{
   let s1      = RefSubstring( "" )
   let s2      = RefSubstring( "" )
   let s3      = RefSubstring( "" )
   let s4      = RefSubstring( "" )
   let s5      = RefSubstring( "" )

   let a       = ACSet( "a"  )
   let aA      = ACSet( "aA" )
   let bB      = ACSet( "bB" )
   let c       = ACSet( "c"  )
   let cC      = ACSet( "cC" )
   let eE      = ACSet( "eE" )
   let empty   = ACSet()
   
   var name    = ""
   var i       = " "
   var test    = ""
   var pResult = false
   
   var p       = Pattern()
   
   //---------------------------------------------
   //
   // Test oneACSet


   name     = "oneACSet"
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
         p.oneACSet( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneACSet #2
               return result3
            } // p.oneACSet #1
            return result2
         } // p.oneACSet
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   name = "oneACSet"
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
         p.oneACSet( aA, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet( aA, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet( aA, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneACSet #3
               return result3
            } // p.oneACSet #2
            return result2
         } // p.oneACSet #1
         return result1
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "A", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'A'" )
   precondition( s3.s == "A", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'A'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )


   name = "oneACSet"
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
         p.oneACSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneACSet( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneACSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneACSet #3
                  } // p.s
               } // p.oneACSet #2
            } // p.s
         } // p.oneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   
   
   name = "oneACSet"
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
         p.oneACSet( aA, capture:s1 )
         {
            print( "\(name)(0, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.oneACSet( aA, capture:s2 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneACSet( aA, capture:s3 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneACSet( a, capture:s4 )
                  {
                        print( "\(name)(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneACSet( aA, capture:s5 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "aa", {p.eos()} )
                        } // p.oneACSet #3
                  } // p.oneACSet #2
               } // p.oneACSet #1
            } // p.oneACSet #0
         } // p.oneACSet
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)', s5.s ='\(s5.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "A", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'A'" )
   precondition( s3.s == "A", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'A'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'a'" )
   precondition( s5.s == "a", "\(name)\(test) failed, s5.s ='\(s5.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)', s5.s ='\(s5.s)'" )


   


   name = "oneACSet"
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
         p.oneACSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneACSet( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "ba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneACSet( aA, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneACSet #2
                  } // p.s
               } // p.oneACSet #1
            } // p.s
         } // p.oneACSet
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "b", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'b'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   name = "oneACSet"
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
         p.oneACSet( aA, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "AA" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneACSet( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "BA" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneACSet( bB, capture:s3 )
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
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "A", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'A'" )
   precondition( s2.s == "B", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'B'" )
   precondition( s3.s == "B", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'B'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )


   // Non-consuming versions:
   
   name = "oneACSet"
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
         p.oneACSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneACSet #3
               return result3
            } // p.oneACSet #2
            return result2
            
         } // p.oneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )




   name = "oneACSet"
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
         p.oneACSet_peek( aA, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet_peek( aA, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet_peek( aA, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "AAA", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneACSet #3
               return result3
            } // p.oneACSet #2
            return result2
         } // p.oneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "A", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'A'" )
   precondition( s2.s == "A", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'A'" )
   precondition( s3.s == "A", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'A'" )
   precondition( s4.s == "AAA", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'AAA'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )





   // non-capture + consuming
   
   name = "oneACSet"
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
         p.oneACSet( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneACSet #3
               return result3
            } // p.oneACSet #2
            return result2
         } // p.oneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   name = "oneACSet"
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
         p.oneACSet( aA )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet( aA )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet( aA )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "A", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneACSet #3
               return result3
            } // p.oneACSet #2
            return result2
            
         } // p.oneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "A", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'A'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




   // non-capture + not consuming
   
   name = "oneACSet"
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
         p.oneACSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet_peek( a )
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
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   name = "oneACSet"
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
         p.oneACSet_peek( aA )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet_peek( aA )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet_peek( aA )
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
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "AaA", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'AaA'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )





   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "oneACSet #2"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaA" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneACSet( aA, capture:s1 )
         {
            print( "p.\(test)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneACSet( aA, capture:s2 )
            {
               print( "p.\(test)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneACSet( aA, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.oneACSet #3
               return result3
            } // p.oneACSet #2
            return result2
            
         } // p.oneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "s \(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "A", "s \(test) failed, s3.s ='\(s3.s)', expected 'A'" )
   print( "\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   test  = "oneACSet #3"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet( aA, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneACSet #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet( aA )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneACSet #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet_peek( aA, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneACSet #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet_peek( aA )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneACSet #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet_peek( empty )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneACSet #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet_peek( empty )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneACSet #8c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet_peek( a, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1.s ='\(s1.s)'" )



   s1.s  = "*"
   test  = "oneACSet #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet( eE )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneACSet #10"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneACSet #11"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet_peek( eE )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneACSet #12"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet_peek( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneACSet #12c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneACSet_peek( a, capture:s1 ){
            p.s("aa" )
         } // oneACSet_peek
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1.s ='\(s1.s)'" )

  //-----------------------------------------------------------------------------------------------
  //
  // nTomACSet
  
   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   test     =  " #1 cc"
   p        = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomACSet\(test) sequence: p.CSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomACSet( a, n:2, m:4 , capture:s1)
         {
            print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nTomACSet( bB, n:2, m:3, capture:s2 )
            {
               print( "p.nTomACSet(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
                  p.nTomACSet( c, n:1, m:3, capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.eos()
                     return result4
                  } // p.nTomACSet #3
               return result3
            } // p.nTomACSet #2
            return result2
         } //p.nTomACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1.s ='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomStr\(test) failed, s2.s ='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "ccc", "nTomStr\(test) failed, s3.s ='\(s3.s)', expected 'ccc'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )

   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   test =  " #1 Lazy cc"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomACSet_lazy( a, n:2, m:4, capture:s1 )
         {
            print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nTomACSet_lazy( bB, n:2, m:3, capture:s2 )
            {
               print( "p.nTomACSet(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
                  p.nTomACSet_lazy( c, n:1, m:3, capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.eos()
                     return result4
                  } // p.nTomACSet #3
               return result3
            } // p.nTomACSet #2
            return result2
         } //p.nTomACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "ccc", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'ccc'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  " #1 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomACSet_peek( a, n:2, m:4, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaaa" )
            {
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_peek( bB, n:2, m:3, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("bbb", capture:s3 )
                  {
                    print( "p.nTomACSet(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomACSet_peek( c, n:1, m:3, capture:s4 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "ccc", capture:s5 )
                        {
                           print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.eos()
                        }
                        return result4
                     } // p.nTomACSet #3
                  } // p.s #2
               } // p.nTomACSet #2
            } // p.s
         } //p.nTomACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), , s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)', s5.s ='\(s5.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "bbb", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'bbb'" )
   precondition( s4.s == "ccc", "nTomACSet\(test) failed, s4.s ='\(s4.s)', expected 'ccc'" )
   precondition( s5.s == "ccc", "nTomACSet\(test) failed, s5.s ='\(s5.s)', expected 'ccc'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)', s5.s ='\(s5.s)'" )




   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  " #1 Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomStr\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomACSet_lazy( a, n:2, m:4, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa" )
            {
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( bB, n:2, m:3, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("b", capture:s3 )
                  {
                    print( "p.nTomACSet(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomACSet_lazy( c, n:1, m:3, capture:s4 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "cc", capture:s5, {p.eos()} )
                        return result4
                     } // p.nTomACSet #3
                  } // p.s #2
               } // p.nTomACSet #2
            } // p.s
         } //p.nTomACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)', s5.s ='\(s5.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bb", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "b",  "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'b'" )
   precondition( s4.s == "c",  "nTomACSet\(test) failed, s4.s ='\(s4.s)', expected 'c'" )
   precondition( s5.s == "cc", "nTomACSet\(test) failed, s5.s ='\(s5.s)', expected 'cc'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)', s5.s ='\(s5.s)'" )





   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  " #1 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomACSet( a, n:2, m:4 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet( bB, n:2, m:3 )
            { // This is the tail
              print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
              p.nTomACSet( c, n:1, m:3 )
               {
                  let result4 = p.eos()
                  return result4
               } // p.nTomACSet #2
             } // p.nTomACSet #1
         } //p.nTomACSet
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )




   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  " #1 Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomACSet_lazy( a, n:2, m:4 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_lazy( bB, n:2, m:3 )
            { // This is the tail
              print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
              p.nTomACSet_lazy( c, n:1, m:3 )
               {
                  let result4 = p.eos()
                  return result4
               } // p.nTomACSet #2
             } // p.nTomACSet #1
         } //p.nTomACSet
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )


   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  "#1 __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbcCc" ){
         print(
            "p.nTomACSet \(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomACSet_peek( aA, n:2, m:4 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaaa", capture:s1 )
            {
               print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_peek( bB, n:2, m:3 )
               { // This is the tail
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("bbb", capture:s2 )
                  {
                    print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomACSet_peek( cC, n:1, m:3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "cCc", capture:s3, {p.eos()} )
                        return result4
                     } // p.nTomACSet #2
                  } // p.s #2
               } // p.nTomACSet #1
            } // p.s
         } //p.nTomACSet
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomACSet \(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomACSet \(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "bbb", "nTomACSet \(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "cCc", "nTomACSet \(test) failed, s3.s ='\(s3.s)', expected 'cCc'" )
   print( "nTomACSet \(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )



   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  "#1 Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbcCc" ){
         print(
            "p.nTomACSet \(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomACSet_lazy( a, n:2, m:4 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa", capture:s1 )
            {
               print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( bB, n:2, m:3 )
               { // This is the tail
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("b", capture:s2 )
                  {
                    print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomACSet_lazy( cC, n:1, m:3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "Cc", capture:s3, {p.eos()} )
                        return result4
                     } // p.nTomACSet #2
                  } // p.s #2
               } // p.nTomACSet #1
            } // p.s
         } //p.nTomACSet
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "nTomACSet \(test) failed to match string" )
   precondition( s1.s == "aa", "nTomACSet \(test) failed, s1.s ='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "b", "nTomACSet \(test) failed, s2.s ='\(s2.s)', expected 'b'" )
   precondition( s3.s == "Cc", "nTomACSet \(test) failed, s3.s ='\(s3.s)', expected 'Cc'" )
   print( "nTomACSet \(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )



   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet \(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:4, m:6, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet( a, n:3, m:4, capture:s2 )
            { // This is the tail
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet( a, n:1, m:3, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaaaa'" )
   precondition( s2.s == "aaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aa", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'aa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_lazy( a, n:4, m:6, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_lazy( a, n:3, m:4, capture:s2 )
            {
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( a, n:1, m:3, capture:s3, {p.eos()} )
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "aaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaa", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( a, n:4, m:6, capture:s1 )
         {
            p.s( "aaaaaa" )
            {
               print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_peek( a, n:3, m:4, capture:s2 )
               {
                  p.s("aaaa" )
                  {
                     print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.nTomACSet_peek( a, n:1, m:3, capture:s3 )
                     {
                        p.s("aa", {p.eos()} )
                     } // p.nTomACSet
                  } // p.s
               } // p.nTomACSet
            } // p.s
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaaaa'" )
   precondition( s2.s == "aaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aa", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'aa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_lazy( a, n:4, m:6, capture:s1 )
         {
               print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( a, n:3, m:4, capture:s2 )
               {
                     print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.nTomACSet_lazy( a, n:1, m:3, capture:s3 )
                     {
                        p.s("aaaa", {p.eos()} )
                     } // p.nTomACSet
               } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "a", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:4, m:6 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet( a, n:3, m:4 )
            {
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet( a, n:1, m:3, {p.eos()} )
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_lazy( a, n:4, m:6 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_lazy( a, n:3, m:4 )
            {
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( a, n:1, m:3, {p.eos()} )
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( a, n:4, m:6 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_peek( a, n:3, m:4 )
            {
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_peek( a, n:1, m:3 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.nTomACSet
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_lazy( a, n:4, m:6 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_lazy( a, n:3, m:4 )
            {
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( a, n:1, m:3 )
               {
                  p.s("aaaa", {p.eos()} )
               } // p.nTomACSet
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )


   // Test #3-backtracking:

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet( a, n:3, m:4, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   print("xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "aaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaa", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_lazy( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_lazy( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( a, n:3, m:4, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaaa", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'aaaa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_peek( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_peek( a, n:3, m:4, capture:s3 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.s
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "aaaaaaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaaaaaa'" )
   precondition( s3.s == "aaaa", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'aaaa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_lazy( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_lazy( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( a, n:3, m:4, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.eos()
               } // p.nTomACSet_peek
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaaa", "nTomACSet\(test) failed, s3.s ='\(s3.s)', expected 'aaaa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:4, m:12 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet( a, n:3, m:4, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_lazy( a, n:4, m:12 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_lazy( a, n:4, m:8, capture:s2 )
            {
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_lazy( a, n:3, m:4, {p.eos()} )
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( a, n:4, m:12 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_peek( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet_peek( a, n:3, m:4 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.s
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_lazy( a, n:4, m:12 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_lazy( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomACSet( a, n:3, m:4 )
               {
                  p.s("a", {p.eos()} )
               } // p.s
            } // p.nTomACSet
         } //p.nTomACSet
      } // match
   print()
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )





   s1.s  = "*"
   test  = "nTomACSet #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( aA, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomACSet #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( aA, n:1, m:1, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomACSet #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( aA, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomACSet #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( empty, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomACSet #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( empty, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomACSet #8c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( a, n:1, m:1, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1.s ='\(s1.s)'" )



   s1.s  = "*"
   test  = "nTomACSet #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( eE, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomACSet #10"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:1, m:1, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomACSet #11"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( eE, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomACSet #12"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( a, n:1, m:1, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomACSet #12c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( a, n:1, m:1, capture:s1 ){
            p.s("aa" )
         } // oneACSet_peek
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1.s ='\(s1.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #13"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet( a, n:4, m:8, capture:s2, {p.eos()} )
         } //p.nTomACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaaaaaa'" )
   precondition( s2.s == "aaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #14"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet_peek( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet_peek( a, n:4, m:12, capture:s2, {p.s("aaaaaaaaaaaa")} )
         } //p.nTomACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "aaaaaaaaaaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaaaaaaaaaa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #15"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:0, m:12, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet( a, n:12, m:12, capture:s2, {p.eos()} )
         } //p.nTomACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "aaaaaaaaaaaa", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected 'aaaaaaaaaaaa'" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #16"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:0, m:12, capture:s1 )
         {
            print( "p.nTomACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomACSet( a, n:0, m:12, capture:s2 )
            {
               print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.eos()
            }
         } //p.nTomACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "", "nTomACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #17"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.nTomACSet\(test) sequence: p.nTomACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomACSet( a, n:0, m:12, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "nTomACSet\(test) failed to match string" )
   precondition( s1.s == "", "nTomACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   print( "nTomACSet\(test) passed, s1.s ='\(s1.s)'" )
   
   
   //--------------------------------------------------------------------------------------------------------
   //
   // zeroOrOneACSet
   
   

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
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


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
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a, capture:s3)
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.s("a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )

   // no capture + consuming:
   
   test  = " #1_111 _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )


  s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a)
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a)
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )


   // no capture and not consuming

   
   test  = " #1_111-000 __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_peek( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )


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
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_lazy( a, capture:s1)
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "a", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


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
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s("a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )

   



   // no capture + consuming:
   
   test  = " #1_111 _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )



   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a)
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )


   
   test  = " #1_111 Lazy _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_lazy( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_lazy( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )

 

   // no capture and not consuming

   
   test  = " #1_111-000 __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_peek( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )

   
   test  = " #1_111-000 Lazy __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet_peek( a )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet_peek( a )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   print( "zeroOrOneACSet\(test) passed" )




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
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'")
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )


   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-100 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'")
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-110 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'")
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )




   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-111 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneACSet( a, capture:s2 )
            {
               print( "p.zeroOrOneACSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneACSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneACSet #3
               return result3
            } // p.zeroOrOneACSet #2
            return result2
            
         } // p.zeroOrOneACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'")
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "aaa", "zeroOrOneACSet\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   s1.s  = "*"
   test  = "zeroOrOneACSet #2"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet_peek( empty )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed" )


   s1.s  = "*"
   test  = "zeroOrOneACSet #3"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet_peek( empty )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed" )



   s1.s  = "*"
   test  = "zeroOrOneACSet #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet_peek( a, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1.s ='\(s1.s)'" )



   s1.s  = "*"
   test  = "zeroOrOneACSet #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet( eE )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed, by matching zero items" )



   s1.s  = "*"
   test  = "zeroOrOneACSet #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "zeroOrOneACSet #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet_peek( eE )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed, by matching empty" )



   s1.s  = "*"
   test  = "zeroOrOneACSet #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet_peek( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "zeroOrOneACSet #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet_peek( a, capture:s1 ){
            p.s("a" )
         } // oneACSet_peek
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1.s ='\(s1.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #10"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneACSet( a, capture:s2, {p.eos()} )
         } //p.zeroOrOneACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #11"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneACSet_peek( a, capture:s2, {p.s("aaaaaaaaaaaa")} )
         } //p.zeroOrOneACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #12"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneACSet( a, capture:s2, {p.eos()} )
         } //p.zeroOrOneACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneACSet\(test) failed, s2.s ='\(s2.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #13"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneACSet_lazy\(test) sequence: p.zeroOrOneACSet_lazy('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneACSet_lazy(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneACSet_lazy( a, capture:s2 )
            {
               print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.eos()
            }
         } //p.zeroOrOneACSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   precondition( pResult, "zeroOrOneACSet_lazy\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneACSet_lazy\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "a", "zeroOrOneACSet_lazy\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   print( "zeroOrOneACSet_lazy\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #14"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneACSet\(test) sequence: p.zeroOrOneACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneACSet( a, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "zeroOrOneACSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneACSet\(test) failed, s1.s ='\(s1.s)', expected ''" )
   print( "zeroOrOneACSet\(test) passed, s1.s ='\(s1.s)'" )




   //--------------------------------------------------------------------------------------------
   //
   // zeroOrMoreACSet
   
  
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
         p.zeroOrMoreACSet( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreACSet( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreACSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreACSet #3
               return result3
            } // p.zeroOrMoreACSet #2
            return result2
            
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "", "\(name)\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "\(name)\(test) failed, s3.s ='\(s3.s)', expected ''" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )







   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "", "\(name)\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "", "\(name)\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "\(name)\(test) failed, s3.s ='\(s3.s)', expected ''" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )



  




   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )






   // Non-consuming versions:
   
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreACSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreACSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreACSet #3
               return result3
            } // p.zeroOrMoreACSet #2
            return result2
            
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aaa", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aa", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'aa'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



 
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ab", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'ab'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )



  
   // non-capture + consuming
   
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreACSet( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreACSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreACSet #3
               return result3
            } // p.zeroOrMoreACSet #2
            return result2
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



  


   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



 

   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



  

   // non-capture + not consuming
   
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreACSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreACSet #3
               return result3
            } // p.zeroOrMoreACSet #2
            return result2
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



  
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )






   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_peek( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



 

   // Lazy variants:
   
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_lazy( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreACSet_lazy( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreACSet_lazy( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreACSet #3
               return result3
            } // p.zeroOrMoreACSet #2
            return result2
            
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "", "\(name)\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "", "\(name)\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "aa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aa'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )


   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_lazy( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "", "\(name)\(test) failed, s1.s ='\(s1.s)', expected ''" )
   precondition( s2.s == "", "\(name)\(test) failed, s2.s ='\(s2.s)', expected ''" )
   precondition( s3.s == "", "\(name)\(test) failed, s3.s ='\(s3.s)', expected ''" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )




   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_lazy( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )



   // Non-consuming versions:
   
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreACSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreACSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreACSet #3
               return result3
            } // p.zeroOrMoreACSet #2
            return result2
            
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aaa", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aa", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'aa'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )





   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_peek( a, capture:s3)
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ab", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'ab'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   // non-capture + consuming
   
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_lazy( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreACSet_lazy( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreACSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreACSet #3
               return result3
            } // p.zeroOrMoreACSet #2
            return result2
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )





   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_lazy( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreACSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreACSet #3
               return result3
            } // p.zeroOrMoreACSet #2
            return result2
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a)
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




    i    = ""
   name = "zeroOrMoreACSet\(i)"
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
         p.zeroOrMoreACSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreACSet_peek( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreACSet #3
                  } // p.s
               } // p.zeroOrMoreACSet #2
            } // p.s
         } // p.zeroOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




   //-----------------------------------------------------------------------------------------------
   //
   // oneOrMoreACSet
   
   
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
         p.oneOrMoreACSet( a, capture:s1)
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreACSet( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreACSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreACSet #3
               return result3
            } // p.oneOrMoreACSet #2
            return result2
            
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )






   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )





   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )




   // Non-consuming versions:
   
   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreACSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreACSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreACSet #3
               return result3
            } // p.oneOrMoreACSet #2
            return result2
            
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aaa", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( a, capture:s2)
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aa", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'aa'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )






   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a, capture:s1)
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ab", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'ab'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )



 

   // non-capture + consuming
   
   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreACSet( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreACSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreACSet #3
               return result3
            } // p.oneOrMoreACSet #2
            return result2
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



  




   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreACSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreACSet #3
               return result3
            } // p.oneOrMoreACSet #2
            return result2
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )


   // Lazy variants:
   
   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_lazy( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreACSet_lazy( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreACSet_lazy( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreACSet #3
               return result3
            } // p.oneOrMoreACSet #2
            return result2
            
         } // p.oneOrMoreACSet #1
         return result1

      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "aa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aa'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_lazy( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "aa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )





   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_lazy( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "b", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )



   // Non-consuming versions:
   
   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreACSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreACSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreACSet #3
               return result3
            } // p.oneOrMoreACSet #2
            return result2
            
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aaa", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   precondition( s4.s == "aaa", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "aa", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'aa'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )






   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   precondition( s2.s == "bb", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ab", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'ab'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )



   // non-capture + consuming
   
   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_lazy( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreACSet_lazy( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreACSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreACSet #3
               return result3
            } // p.oneOrMoreACSet #2
            return result2
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )





   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_lazy( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreACSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreACSet #3
               return result3
            } // p.oneOrMoreACSet #2
            return result2
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   i    = "i"
   name = "oneOrMoreACSet\(i)"
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
         p.oneOrMoreACSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreACSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreACSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreACSet #3
                  } // p.s
               } // p.oneOrMoreACSet #2
            } // p.s
         } // p.oneOrMoreACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )



   //---------------------------------------------------------------------------------------
   //
   // nCSet
   
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "#1"
   print()
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaA" ){
         print(
            "p.nACSet \(test) sequence: p.nACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nACSet( a, capture:s1, n:1 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nACSet( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nACSet( aA, capture:s3, n:1 )
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
   precondition( pResult, "nCSet \(test) failed to match string" )
   precondition( s1.s == "a", "nCSet \(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "nCSet \(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "A", "nCSet \(test) failed, s3.s ='\(s3.s)', expected 'A'" )
   print( "nCSet \(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "#2"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaAAAA" ){
         print(
            "p.nACSet \(test) sequence: p.nACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nACSet( a, capture:s1, n:4 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nACSet( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nACSet( aA, capture:s3, n:3 )
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
   precondition( pResult, "nCSet \(test) failed to match string" )
   precondition( s1.s == "aaaa", "nCSet \(test) failed, s1.s ='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "A", "nCSet \(test) failed, s2.s ='\(s2.s)', expected 'A'" )
   precondition( s3.s == "AAA", "nCSet \(test) failed, s3.s ='\(s3.s)', expected 'AAA'" )
   print( "nCSet \(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "#3"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaAAA" ){
         print(
            "p.nACSet \(test) sequence: p.nACSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nACSet( a, capture:s1, n:4 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nACSet( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nACSet( aA, capture:s3, n:3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.nACSet #3
               return result3
            } // p.nACSet #2
            return result2
            
         } // p.nACSet #1
         return result1
         
      } // match
   print()
   precondition( !pResult, "nCSet \(test) should have returned failure" )
   print( "nCSet \(test) passed" )





//---------------------------------------------
//
// Test upToACSet


   name 	   = "upToACSet"
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
         p.upToACSet( bB, capture:s1 )
         {
            print( "p.s(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s("b" )
            {
            
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.upToACSet( bB, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "b" )
                  {
                     print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.upToACSet( bB, capture:s3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        return p.s( "ba", capture:s4, {p.eos()} )
                     } // p.upToACSet #3
                  } // end p.s #2
               } // p.upToACSet #2
            } // end p.s #1
         } // p.upToACSet #1
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ba", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'ba'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   // Non-consuming versions:
   
   name = "upToACSet_peek"
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
         p.upToACSet_peek( bB, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.upToACSet_peek( bB, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.upToACSet_peek( bB, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "ababab", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.upToACSet #3
            } // p.upToACSet #2
         } // p.upToACSet #1
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'a'" )
   precondition( s4.s == "ababab", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'ababab'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   // non-capture + consuming
   
   name = "upToACSet"
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
         p.upToACSet( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.upToACSet( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.upToACSet( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "baba", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.upToACSet #3
               return result3
            } // p.upToACSet #2
            return result2
         } // p.upToACSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "baba", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'baba'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )

   
   name = "upToACSet"
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
         p.upToACSet( bB, {p.eos()} )
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( !pResult, "\(name)\(test) should have failed to match string" )
   print( "\(name)\(test) passed, by failing" )

   
   name = "upToACSet"
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
         p.upToACSet( empty, {p.eos()} )
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( !pResult, "\(name)\(test) should have failed to match string" )
   print( "\(name)\(test) passed, by failing" )






//---------------------------------------------
//
// Test thruStr/thruStri.




   name 	   = "thruACSet"
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
         p.thruACSet( bB, capture:s1 )
         {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.thruACSet( bB, capture:s2 )
               {
                     print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.thruACSet( bB, capture:s3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        return p.s( "a", capture:s4, {p.eos()} )
                     } // p.thruACSet #3
               } // p.thruACSet #2
         } // p.thruACSet #1
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "ab", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'ab'" )
   precondition( s2.s == "ab", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'ab'" )
   precondition( s3.s == "ab", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'ab'" )
   precondition( s4.s == "a", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   // Non-consuming versions:
   
   name = "thruACSet"
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
         p.thruACSet_peek( bB, capture:s1)
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruACSet_peek( bB, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruACSet_peek( bB, capture:s3 )
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
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "ab", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'ab'" )
   precondition( s2.s == "ab", "\(name)\(test) failed, s2.s ='\(s2.s)', expected 'ab'" )
   precondition( s3.s == "ab", "\(name)\(test) failed, s3.s ='\(s3.s)', expected 'ab'" )
   precondition( s4.s == "ababab", "\(name)\(test) failed, s4.s ='\(s4.s)', expected 'ababab'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)', s2.s ='\(s2.s)', s3.s ='\(s3.s)', s4.s ='\(s4.s)'" )



   // non-capture + consuming
   
   name = "thruACSet"
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
         p.thruACSet( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruACSet( bB )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruACSet( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.thruACSet #3
               return result3
            } // p.thruACSet #2
            return result2
         } // p.thruACSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )


   // non-capture + not consuming
   
   name = "thruACSet"
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
         p.thruACSet_peek( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruACSet_peek( bB )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruACSet_peek( bB )
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
   //print( "xxxx pResult=\(pResult), s1.s ='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "abaa", "\(name)\(test) failed, s1.s ='\(s1.s)', expected 'abaa'" )
   print( "\(name)\(test) passed, s1.s ='\(s1.s)'" )

   //========================================================================
   
   runACSetSmokeTests()

}



// MARK: - Lightweight Test Harness (no XCTest)

final class ACSetHarness {
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
      precondition( failed == 0, "ACSetHarness has failures" )
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

public func runACSetSmokeTests() {
   let T = ACSetHarness()
   print("=== ACSet.swift Smoke Tests ===")

   // -----------------------------
   // ACSet struct basics
   // -----------------------------
   T.note("ACSet: unionStr / contains ASCII only")
   do {
      var s = ACSet("abcé")     // 'é' ignored (non-ASCII)
      T.expect(s.contains("a"), "should contain 'a'")
      T.expect(!s.contains("é"), "must ignore non-ASCII 'é'")
      T.expect(!s.contains("z"), "should not contain 'z' yet")

      s.unionStr("z0")
      T.expect(s.contains("z") && s.contains("0"), "unionStr should add 'z' and '0'")

      var t = ACSet("_")
      t.unionChar("A")
      T.expect(t.contains("_") && t.contains("A"), "unionChar should add '_' and 'A'")

      var u = s
      u.union(acset: t)
      T.expect(u.contains("_") && u.contains("A") && u.contains("z"), "union(acset:) should OR bits")

      var v = u
      v.subtract(acset: s)
      T.expect(v.contains("_") && v.contains("A") && !v.contains("z"), "subtract removes s' bits")

      var w = u
      w.intersection(acset: t)
      T.expect(w.contains("_") && w.contains("A") && !w.contains("z"), "intersection keeps common bits")

      var x = ACSet("Az")
      x.complement() // flips entire 0..127 domain; membership test is defined only for ASCII
      T.expect(!x.contains("A") && !x.contains("z"), "complement flips bits; spot-check")
   }

   // Quick handy sets used below
   let digits  = Pattern.decimalDigitsACSet
   let letters = Pattern.alphaACSet
   let alnum   = Pattern.alphaNumACSet

   // -----------------------------
   // oneACSet / peek / capture
   // -----------------------------
   T.note("oneACSet consumes a single matching char")
   T.expect(
      run("9x") { p in
         p.oneACSet(digits) {
            T.expect(remaining(p) == "x", "oneACSet should consume '9'")
            return true
         }
      },
      "oneACSet should succeed on digit"
   )

   T.note("oneACSet boundary: fails on non-member or empty")
   T.expect(!run("") { p in p.oneACSet(digits) { true } },
            "oneACSet should fail on empty")
   T.expect(!run("A") { p in p.oneACSet(digits) { true } },
            "oneACSet should fail on letter for digits set")

   T.note("oneACSet_peek: non-consuming success")
   T.expect(
      run("A!") { p in
         p.oneACSet_peek(letters) {
            T.expect(remaining(p) == "A!", "peek must not consume")
            return true
         }
      }
   )

   T.note("oneACSet(capture:) captures exactly one")
   T.expect(
      run("_-") { p in
         let cap = RefSubstring()
         return p.oneACSet(Pattern.identifierACSet, capture: cap) {
            T.expect(cap.s == "_", "capture should be '_'")
            return true
         }
      }
   )

   T.note("oneACSet_peek(capture:) captures but restores cursor")
   T.expect(
      run("A!") { p in
         let cap = RefSubstring()
         return p.oneACSet_peek(letters, capture: cap) {
            T.expect(cap.s == "A", "peek cap mismatch: \(cap.s)")
            T.expect(remaining(p) == "A!", "peek should not consume")
            return true
         }
      }
   )

   // -----------------------------
   // nTomACSet (eager): min/max, greedy + backtrack
   // -----------------------------
   T.note("nTomACSet eager: greedy then backtrack to satisfy tail")
   T.expect(
      run("1234X") { p in
         p.nTomACSet(digits, n: 1, m: 5) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X" { return true }
            return false
         }
      },
      "nTomACSet should align so next is 'X'"
   )

   T.note("nTomACSet eager: boundary — cannot reach minimum")
   T.expect(
      !run("abc") { p in p.nTomACSet(digits, n: 1, m: 3) { true } },
      "nTomACSet should fail when min not met"
   )

   T.note("nTomACSet(capture:) captures greedy span")
   T.expect(
      run("abc123!") { p in
         let cap = RefSubstring()
         return p.nTomACSet(alnum, n: 3, m: 6, capture: cap) {
            T.expect(cap.s.hasPrefix("abc"), "capture should begin at start")
            return true
         }
      }
   )

   // -----------------------------
   // nTomACSet_lazy: grows only as needed
   // -----------------------------
   T.note("nTomACSet_lazy prefers fewer chars; grows until tail ok")
   T.expect(
      run("aaaX") { p in
         p.nTomACSet_lazy(letters, n: 0, m: 3) {
            p.c_peek( "X" ){
               if p.cursor < p.endStr, p.haystack[p.cursor] != "X" { return true }
               T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
               return true
            }
         }
      }
   )

   T.note("nTomACSet_lazy(capture:) minimal span satisfying tail")
   T.expect(
      run("999X") { p in
         let cap = RefSubstring()
         return p.nTomACSet_lazy(digits, n: 0, m: 3, capture: cap) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X" {
               T.expect(cap.s.count <= 3, "lazy cap within bounds")
               return true
            }
            return false
         }
      }
   )

   // -----------------------------
   // nTomACSet_peek: verify without consuming (+capture)
   // -----------------------------
   T.note("nTomACSet_peek does not consume")
   T.expect(
      run("12ab") { p in
         p.nTomACSet_peek(digits, n: 2, m: 3) {
            T.expect(remaining(p) == "12ab", "peek must not consume")
            return true
         }
      }
   )

   T.note("nTomACSet_peek(capture:) captures inspected span, no consume")
   T.expect(
      run("12ab") { p in
         let cap = RefSubstring()
         return p.nTomACSet_peek(digits, n: 1, m: 2, capture: cap) {
            T.expect(cap.s == "12" || cap.s == "1", "peek capture should be 1..2 digits; got \(cap.s)")
            T.expect(remaining(p) == "12ab", "peek must leave cursor")
            return true
         }
      }
   )

   // -----------------------------
   // zeroOrOne / zeroOrMore / oneOrMore (incl. lazy/peek, capture)
   // -----------------------------
   T.note("zeroOrOneACSet: present and absent paths")
   T.expect(
      run("Z") { p in p.zeroOrOneACSet(letters) { remaining(p).isEmpty } },
      "zeroOrOne should consume when present"
   )
   T.expect(
      run("1") { p in p.zeroOrOneACSet(letters) { remaining(p) == "1" } },
      "zeroOrOne should accept zero"
   )

   T.note("zeroOrMoreACSet consumes run; peek variant non-consuming")
   T.expect(
      run("ABC!") { p in
         p.zeroOrMoreACSet(letters) {
            T.expect(remaining(p) == "!", "zeroOrMore should consume letters")
            return true
         }
      }
   )
   T.expect(
      run("ABC!") { p in
         p.zeroOrMoreACSet_peek(letters) {
            T.expect(remaining(p) == "ABC!", "peek must not consume")
            return true
         }
      }
   )

   T.note("oneOrMoreACSet requires ≥1; lazy variant grows minimally")
   T.expect(
      run("aa.") { p in
         p.oneOrMoreACSet(letters) {
            T.expect(remaining(p) == ".", "oneOrMore should consume letters")
            return true
         }
      }
   )
   T.expect(
      run("aaX") { p in
         let cap = RefSubstring()
         return p.oneOrMoreACSet_lazy(letters, capture: cap) {
            p.c_peek( "X" ){
               T.expect(!cap.s.isEmpty, "lazy still needs ≥1")
               T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
               return true
            }
         }
      }
   )

   // -----------------------------
   // nACSet (exact count) + peek + capture
   // -----------------------------
   T.note("nACSet exact count and peek")
   T.expect(
      run("123!") { p in
         p.nACSet(digits, n: 3) {
            T.expect(remaining(p) == "!", "nACSet(3) should consume exactly '123'")
            return true
         }
      }
   )
   T.expect(
      run("123!") { p in
         p.nACSet_peek(digits, n: 3) {
            T.expect(remaining(p) == "123!", "nACSet_peek(3) must not consume")
            return true
         }
      }
   )

   T.note("nACSet(capture:) exact span")
   T.expect(
      run("AB12-") { p in
         let cap = RefSubstring()
         return p.nACSet(alnum, capture: cap, n: 4) {
            T.expect(cap.s == "AB12", "nACSet capture mismatch: \(cap.s)")
            return true
         }
      }
   )

   // -----------------------------
   // upToACSet / thruACSet (+peek, +capture)
   // -----------------------------
   T.note("upToACSet stops before first member; thruACSet consumes it")
   T.expect(
      run("abc1rest") { p in
         p.upToACSet(digits) {
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "1",
                     "upToACSet must stop at first digit")
            return true
         }
      }
   )
   T.expect(
      run("abc1rest") { p in
         p.thruACSet(digits) {
            T.expect(remaining(p) == "rest", "thruACSet should consume 'abc1'")
            return true
         }
      }
   )

   T.note("upToACSet_peek and thruACSet_peek do not consume")
   T.expect(
      run("abc1rest") { p in
         p.upToACSet_peek(digits) {
            T.expect(remaining(p) == "abc1rest", "upToACSet_peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("abc1rest") { p in
         p.thruACSet_peek(digits) {
            T.expect(remaining(p) == "abc1rest", "thruACSet_peek must not consume")
            return true
         }
      }
   )

   T.note("upToACSet(capture:) excludes match; thruACSet(capture:) includes match")
   T.expect(
      run("foo-bar") { p in
         let cap = RefSubstring()
         return p.upToACSet(ACSet("-"), capture: cap) {
            T.expect(cap.s == "foo", "upTo cap mismatch: \(cap.s)")
            return true
         }
      }
   )
   T.expect(
      run("foo-bar") { p in
         let cap = RefSubstring()
         return p.thruACSet(ACSet("-"), capture: cap) {
            T.expect(cap.s == "foo-", "thru cap should include '-'")
            return true
         }
      }
   )

   T.note("thruACSet_peek(capture:) includes matched char in capture, restores cursor")
   T.expect(
      run("pre:post") { p in
         let cap = RefSubstring()
         return p.thruACSet_peek(ACSet(":"), capture: cap) {
            T.expect(cap.s == "pre:", "peek capture should include ':' per implementation")
            T.expect(remaining(p) == "pre:post", "peek must restore cursor")
            return true
         }
      }
   )

   // -----------------------------
   // Final summary
   // -----------------------------
   T.summary()
}
