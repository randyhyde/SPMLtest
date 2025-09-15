//
//  testCSet.swift
//  SPMLtest

import Foundation
import SPML

func testCSet()
{
   let s1      = RefSubstring("")
   let s2      = RefSubstring("")
   let s3      = RefSubstring("")
   let s4      = RefSubstring("")
   let s5      = RefSubstring("")

   let a       = CharacterSet( charactersIn: "a"  )
   let aA      = CharacterSet( charactersIn: "aA" )
   let bB      = CharacterSet( charactersIn: "bB" )
   let c       = CharacterSet( charactersIn: "c"  )
   let cC      = CharacterSet( charactersIn: "cC" )
   let eE      = CharacterSet( charactersIn: "eE" )
   let empty   = CharacterSet()
   
   var name    = ""
   var i       = " "
   var test    = ""
   var pResult = false
   
   var p       = Pattern()
   
   //---------------------------------------------
   //
   // Test oneCSet


   name     = "oneCSet"
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
         p.oneCSet( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneCSet #2
               return result3
            } // p.oneCSet #1
            return result2
         } // p.oneCSet
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



   name = "oneCSet"
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
         p.oneCSet( aA, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet( aA, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet( aA, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneCSet #3
               return result3
            } // p.oneCSet #2
            return result2
         } // p.oneCSet #1
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


   name = "oneCSet"
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
         p.oneCSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneCSet( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneCSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneCSet #3
                  } // p.s
               } // p.oneCSet #2
            } // p.s
         } // p.oneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   
   name = "oneCSet"
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
         p.oneCSet( aA, capture:s1 )
         {
            print( "\(name)(0, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.oneCSet( aA, capture:s2 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneCSet( aA, capture:s3 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneCSet( a, capture:s4 )
                  {
                        print( "\(name)(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneCSet( aA, capture:s5 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "aa", {p.eos()} )
                        } // p.oneCSet #3
                  } // p.oneCSet #2
               } // p.oneCSet #1
            } // p.oneCSet #0
         } // p.oneCSet
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


   


   name = "oneCSet"
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
         p.oneCSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneCSet( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "ba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneCSet( aA, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneCSet #2
                  } // p.s
               } // p.oneCSet #1
            } // p.s
         } // p.oneCSet
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



   name = "oneCSet"
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
         p.oneCSet( aA, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "AA" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneCSet( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "BA" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneCSet( bB, capture:s3 )
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
   
   name = "oneCSet"
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
         p.oneCSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneCSet #3
               return result3
            } // p.oneCSet #2
            return result2
            
         } // p.oneCSet #1
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




   name = "oneCSet"
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
         p.oneCSet_peek( aA, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet_peek( aA, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet_peek( aA, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "AAA", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneCSet #3
               return result3
            } // p.oneCSet #2
            return result2
         } // p.oneCSet #1
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
   
   name = "oneCSet"
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
         p.oneCSet( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneCSet #3
               return result3
            } // p.oneCSet #2
            return result2
         } // p.oneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   name = "oneCSet"
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
         p.oneCSet( aA )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet( aA )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet( aA )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "A", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneCSet #3
               return result3
            } // p.oneCSet #2
            return result2
            
         } // p.oneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "A", "\(name)\(test) failed, s1='\(s1.s)', expected 'A'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   // non-capture + not consuming
   
   name = "oneCSet"
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
         p.oneCSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet_peek( a )
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



   name = "oneCSet"
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
         p.oneCSet_peek( aA )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet_peek( aA )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet_peek( aA )
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
   test  = "oneCSet #2"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaA" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.oneCSet( aA, capture:s1 )
         {
            print( "p.\(test)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneCSet( aA, capture:s2 )
            {
               print( "p.\(test)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneCSet( aA, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.oneCSet #3
               return result3
            } // p.oneCSet #2
            return result2
            
         } // p.oneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "s \(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "A", "s \(test) failed, s3='\(s3.s)', expected 'A'" )
   print( "\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   test  = "oneCSet #3"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet( aA, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneCSet #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet( aA )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneCSet #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet_peek( aA, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneCSet #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet_peek( aA )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneCSet #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet_peek( empty )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "oneCSet #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet_peek( empty )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneCSet #8c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet_peek( a, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )



   s1.s  = "*"
   test  = "oneCSet #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet( eE )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneCSet #10"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneCSet #11"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet_peek( eE )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "oneCSet #12"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet_peek( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "oneCSet #12c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.oneCSet_peek( a, capture:s1 ){
            p.s("aa" )
         } // oneCSet_peek
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )

  //-----------------------------------------------------------------------------------------------
  //
  // nTomCSet
  
   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   test     =  " #1 cc"
   p        = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomCSet\(test) sequence: p.CSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomCSet( a, n:2, m:4 , capture:s1)
         {
            print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nTomCSet( bB, n:2, m:3, capture:s2 )
            {
               print( "p.nTomCSet(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
                  p.nTomCSet( c, n:1, m:3, capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.eos()
                     return result4
                  } // p.nTomCSet #3
               return result3
            } // p.nTomCSet #2
            return result2
         } //p.nTomCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "ccc", "nTomStr\(test) failed, s3='\(s3.s)', expected 'ccc'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   test =  " #1 Lazy cc"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomCSet_lazy( a, n:2, m:4, capture:s1 )
         {
            print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nTomCSet_lazy( bB, n:2, m:3, capture:s2 )
            {
               print( "p.nTomCSet(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
                  p.nTomCSet_lazy( c, n:1, m:3, capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.eos()
                     return result4
                  } // p.nTomCSet #3
               return result3
            } // p.nTomCSet #2
            return result2
         } //p.nTomCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "ccc", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'ccc'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s  = "*"
   test =  " #1 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomCSet_peek( a, n:2, m:4, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaaa" )
            {
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_peek( bB, n:2, m:3, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("bbb", capture:s3 )
                  {
                    print( "p.nTomCSet(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomCSet_peek( c, n:1, m:3, capture:s4 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "ccc", capture:s5 )
                        {
                           print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.eos()
                        }
                        return result4
                     } // p.nTomCSet #3
                  } // p.s #2
               } // p.nTomCSet #2
            } // p.s
         } //p.nTomCSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), , s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bbb", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'bbb'" )
   precondition( s3.s == "bbb", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'bbb'" )
   precondition( s4.s == "ccc", "nTomCSet\(test) failed, s4='\(s4.s)', expected 'ccc'" )
   precondition( s5.s == "ccc", "nTomCSet\(test) failed, s5='\(s5.s)', expected 'ccc'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )




   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s  = "*"
   test =  " #1 Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomStr\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomCSet_lazy( a, n:2, m:4, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa" )
            {
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( bB, n:2, m:3, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("b", capture:s3 )
                  {
                    print( "p.nTomCSet(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomCSet_lazy( c, n:1, m:3, capture:s4 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "cc", capture:s5, {p.eos()} )
                        return result4
                     } // p.nTomCSet #3
                  } // p.s #2
               } // p.nTomCSet #2
            } // p.s
         } //p.nTomCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "bb", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'bb'" )
   precondition( s3.s == "b",  "nTomCSet\(test) failed, s3='\(s3.s)', expected 'b'" )
   precondition( s4.s == "c",  "nTomCSet\(test) failed, s4='\(s4.s)', expected 'c'" )
   precondition( s5.s == "cc", "nTomCSet\(test) failed, s5='\(s5.s)', expected 'cc'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )





   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s  = "*"
   test =  " #1 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomCSet( a, n:2, m:4 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet( bB, n:2, m:3 )
            { // This is the tail
              print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
              p.nTomCSet( c, n:1, m:3 )
               {
                  let result4 = p.eos()
                  return result4
               } // p.nTomCSet #2
             } // p.nTomCSet #1
         } //p.nTomCSet
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )




   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s  = "*"
   test =  " #1 Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbccc" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomCSet_lazy( a, n:2, m:4 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_lazy( bB, n:2, m:3 )
            { // This is the tail
              print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
              p.nTomCSet_lazy( c, n:1, m:3 )
               {
                  let result4 = p.eos()
                  return result4
               } // p.nTomCSet #2
             } // p.nTomCSet #1
         } //p.nTomCSet
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )


   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s  = "*"
   test =  "#1 __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbcCc" ){
         print(
            "p.nTomCSet \(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomCSet_peek( aA, n:2, m:4 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaaa", capture:s1 )
            {
               print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_peek( bB, n:2, m:3 )
               { // This is the tail
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("bbb", capture:s2 )
                  {
                    print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomCSet_peek( cC, n:1, m:3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "cCc", capture:s3, {p.eos()} )
                        return result4
                     } // p.nTomCSet #2
                  } // p.s #2
               } // p.nTomCSet #1
            } // p.s
         } //p.nTomCSet
         return result1
         
      } // match
   print()
   precondition( pResult, "nTomCSet \(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomCSet \(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "bbb", "nTomCSet \(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "cCc", "nTomCSet \(test) failed, s3='\(s3.s)', expected 'cCc'" )
   print( "nTomCSet \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



   s1.s   = "*"
   s2.s   = "*"
   s3.s   = "*"
   s4.s   = "*"
   test =  "#1 Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaabbbcCc" ){
         print(
            "p.nTomCSet \(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nTomCSet_lazy( a, n:2, m:4 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aa", capture:s1 )
            {
               print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( bB, n:2, m:3 )
               { // This is the tail
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s("b", capture:s2 )
                  {
                    print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                    p.nTomCSet_lazy( cC, n:1, m:3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.s( "Cc", capture:s3, {p.eos()} )
                        return result4
                     } // p.nTomCSet #2
                  } // p.s #2
               } // p.nTomCSet #1
            } // p.s
         } //p.nTomCSet
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomCSet \(test) failed to match string" )
   precondition( s1.s == "aa", "nTomCSet \(test) failed, s1='\(s1.s)', expected 'aa'" )
   precondition( s2.s == "b", "nTomCSet \(test) failed, s2='\(s2.s)', expected 'b'" )
   precondition( s3.s == "Cc", "nTomCSet \(test) failed, s3='\(s3.s)', expected 'Cc'" )
   print( "nTomCSet \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet \(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:4, m:6, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet( a, n:3, m:4, capture:s2 )
            { // This is the tail
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet( a, n:1, m:3, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
   precondition( s2.s == "aaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aa", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'aa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_lazy( a, n:4, m:6, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_lazy( a, n:3, m:4, capture:s2 )
            {
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( a, n:1, m:3, capture:s3, {p.eos()} )
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "aaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaa", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( a, n:4, m:6, capture:s1 )
         {
            p.s( "aaaaaa" )
            {
               print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_peek( a, n:3, m:4, capture:s2 )
               {
                  p.s("aaaa" )
                  {
                     print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.nTomCSet_peek( a, n:1, m:3, capture:s3 )
                     {
                        p.s("aa", {p.eos()} )
                     } // p.nTomCSet
                  } // p.s
               } // p.nTomCSet
            } // p.s
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
   precondition( s2.s == "aaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aa", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'aa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_lazy( a, n:4, m:6, capture:s1 )
         {
               print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( a, n:3, m:4, capture:s2 )
               {
                     print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.nTomCSet_lazy( a, n:1, m:3, capture:s3 )
                     {
                        p.s("aaaa", {p.eos()} )
                     } // p.nTomCSet
               } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), , s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaa'" )
   precondition( s3.s == "a", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:4, m:6 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet( a, n:3, m:4 )
            {
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet( a, n:1, m:3, {p.eos()} )
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_lazy( a, n:4, m:6 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_lazy( a, n:3, m:4 )
            {
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( a, n:1, m:3, {p.eos()} )
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( a, n:4, m:6 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_peek( a, n:3, m:4 )
            {
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_peek( a, n:1, m:3 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.nTomCSet
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #2 Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_lazy( a, n:4, m:6 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_lazy( a, n:3, m:4 )
            {
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( a, n:1, m:3 )
               {
                  p.s("aaaa", {p.eos()} )
               } // p.nTomCSet
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )


   // Test #3-backtracking:

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet( a, n:3, m:4, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   print("xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "aaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaa", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'aaa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_lazy( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_lazy( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( a, n:3, m:4, capture:s3, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaaa", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_peek( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_peek( a, n:3, m:4, capture:s3 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.s
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "aaaaaaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaaaaaa'" )
   precondition( s3.s == "aaaa", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_lazy( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_lazy( a, n:4, m:8, capture:s2 )
            { // This is the tail
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( a, n:3, m:4, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.eos()
               } // p.nTomCSet_peek
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
   precondition( s2.s == "aaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   precondition( s3.s == "aaaa", "nTomCSet\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:4, m:12 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet( a, n:3, m:4, {p.eos()} )
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_lazy( a, n:4, m:12 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_lazy( a, n:4, m:8, capture:s2 )
            {
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_lazy( a, n:3, m:4, {p.eos()} )
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( a, n:4, m:12 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_peek( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet_peek( a, n:3, m:4 )
               {
                  p.s("aaaaaaaaaaaa", {p.eos()} )
               } // p.s
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #3 (bt) Lazy __"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_lazy( a, n:4, m:12 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_lazy( a, n:4, m:8 )
            { // This is the tail
               print( "p.nTomCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomCSet( a, n:3, m:4 )
               {
                  p.s("a", {p.eos()} )
               } // p.s
            } // p.nTomCSet
         } //p.nTomCSet
      } // match
   print()
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )





   s1.s  = "*"
   test  = "nTomCSet #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( aA, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomCSet #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( aA, n:1, m:1, capture:s1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomCSet #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( aA, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomCSet #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( empty, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )


   s1.s  = "*"
   test  = "nTomCSet #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( empty, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomCSet #8c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( a, n:1, m:1, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )



   s1.s  = "*"
   test  = "nTomCSet #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( eE, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomCSet #10"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:1, m:1, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomCSet #11"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( eE, n:1, m:1 )
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )



   s1.s  = "*"
   test  = "nTomCSet #12"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( a, n:1, m:1, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "nTomCSet #12c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( a, n:1, m:1, capture:s1 ){
            p.s("aa" )
         } // oneCSet_peek
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
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet( a, n:4, m:8, capture:s2, {p.eos()} )
         } //p.nTomCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaaaaaa'" )
   precondition( s2.s == "aaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #14"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet_peek( a, n:4, m:12, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet_peek( a, n:4, m:12, capture:s2, {p.s("aaaaaaaaaaaa")} )
         } //p.nTomCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "aaaaaaaaaaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaaaaaaaaaa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #15"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:0, m:12, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet( a, n:12, m:12, capture:s2, {p.eos()} )
         } //p.nTomCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "", "nTomCSet\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "aaaaaaaaaaaa", "nTomCSet\(test) failed, s2='\(s2.s)', expected 'aaaaaaaaaaaa'" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #16"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:0, m:12, capture:s1 )
         {
            print( "p.nTomCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomCSet( a, n:0, m:12, capture:s2 )
            {
               print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.eos()
            }
         } //p.nTomCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "aaaaaaaaaaaa", "nTomCSet\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
   precondition( s2.s == "", "nTomCSet\(test) failed, s2='\(s2.s)', expected ''" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #17"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( a, n:0, m:12, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "nTomCSet\(test) failed to match string" )
   precondition( s1.s == "", "nTomCSet\(test) failed, s1='\(s1.s)', expected ''" )
   print( "nTomCSet\(test) passed, s1='\(s1.s)'" )
   

   let thumb = CSet( charactersIn: "\u{1F44D}" ) // 👍
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #18"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "👍🏽" ){
         print(
            "p.nTomCSet\(test) sequence: p.nTomCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.nTomCSet( thumb, n:0, m:12, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( !pResult, "nTomCSet\(test) should have failed to match string" )
   print( "nTomCSet\(test) passed, by failing" )
   
   
   //--------------------------------------------------------------------------------------------------------
   //
   // zeroOrOneCSet
   
   

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
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


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
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a, capture:s3)
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.s("a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 c_"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   // no capture + consuming:
   
   test  = " #1_111 _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )


  s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a)
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a)
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )


   // no capture and not consuming

   
   test  = " #1_111-000 __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_peek( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )


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
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_lazy( a, capture:s1)
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "a", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 Lazy cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_lazy( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_lazy( a, capture:s3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


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
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s("a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

   



   // no capture + consuming:
   
   test  = " #1_111 _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )



   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_110 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_100 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a)
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #1_000 _c"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )


   
   test  = " #1_111 Lazy _c"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_lazy( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_lazy( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )

 

   // no capture and not consuming

   
   test  = " #1_111-000 __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_peek( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )

   
   test  = " #1_111-000 Lazy __"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet_peek( a )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet_peek( a )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   print( "zeroOrOneCSet\(test) passed" )




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
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-100 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-110 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected ''" )
   precondition( s4.s == "aaa", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )




   
   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   s4.s  = "*"
   test  = " #1-111 (bt) cc"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrOneCSet( a, capture:s2 )
            {
               print( "p.zeroOrOneCSet(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrOneCSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrOneCSet #3
               return result3
            } // p.zeroOrOneCSet #2
            return result2
            
         } // p.zeroOrOneCSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "a", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   precondition( s4.s == "aaa", "zeroOrOneCSet\(test) failed, s3='\(s3.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



   s1.s  = "*"
   test  = "zeroOrOneCSet #2"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet_peek( empty )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed" )


   s1.s  = "*"
   test  = "zeroOrOneCSet #3"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet_peek( empty )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed" )



   s1.s  = "*"
   test  = "zeroOrOneCSet #4"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet_peek( a, capture:s1  )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(test) passed, s1='\(s1.s)'" )



   s1.s  = "*"
   test  = "zeroOrOneCSet #5"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet( eE )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed, by matching zero items" )



   s1.s  = "*"
   test  = "zeroOrOneCSet #6"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aa" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "zeroOrOneCSet #7"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "\u{e9}" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet_peek( eE )
      } // match
   print()
   precondition( pResult, "s \(test) failed to match string" )
   print( "\(test) passed, by matching empty" )



   s1.s  = "*"
   test  = "zeroOrOneCSet #8"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet_peek( a, {p.eos()} ) // Fail on eos (tail)
      } // match
   print()
   precondition( !pResult, "s \(test) should have failed to match string" )
   print( "\(test) passed, by failing" )

   s1.s  = "*"
   test  = "zeroOrOneCSet #9"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "a" ){ // Non-ASCII character
         print(
            "\(test) sequence: \(test)('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet_peek( a, capture:s1 ){
            p.s("a" )
         } // oneCSet_peek
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
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneCSet( a, capture:s2, {p.eos()} )
         } //p.zeroOrOneCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #11"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaaaaaaaaa" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet_peek( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneCSet_peek( a, capture:s2, {p.s("aaaaaaaaaaaa")} )
         } //p.zeroOrOneCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected 'a'" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #12"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneCSet( a, capture:s2, {p.eos()} )
         } //p.zeroOrOneCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "a", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "", "zeroOrOneCSet\(test) failed, s2='\(s2.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #13"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "a" ){
         print(
            "p.zeroOrOneCSet_lazy\(test) sequence: p.zeroOrOneCSet_lazy('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet_lazy( a, capture:s1 )
         {
            print( "p.zeroOrOneCSet_lazy(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOneCSet_lazy( a, capture:s2 )
            {
               print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.eos()
            }
         } //p.zeroOrOneCSet
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOneCSet_lazy\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneCSet_lazy\(test) failed, s1='\(s1.s)', expected ''" )
   precondition( s2.s == "a", "zeroOrOneCSet_lazy\(test) failed, s2='\(s2.s)', expected 'a'" )
   print( "zeroOrOneCSet_lazy\(test) passed, s1='\(s1.s)', s2='\(s2.s)'" )
   

   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = " #14"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "" ){
         print(
            "p.zeroOrOneCSet\(test) sequence: p.zeroOrOneCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         ); return
         p.zeroOrOneCSet( a, capture:s1 )
         {
            print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.eos()
         }
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "zeroOrOneCSet\(test) failed to match string" )
   precondition( s1.s == "", "zeroOrOneCSet\(test) failed, s1='\(s1.s)', expected ''" )
   print( "zeroOrOneCSet\(test) passed, s1='\(s1.s)'" )




   //--------------------------------------------------------------------------------------------
   //
   // zeroOrMoreCSet
   
  
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
         p.zeroOrMoreCSet( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreCSet( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreCSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreCSet #3
               return result3
            } // p.zeroOrMoreCSet #2
            return result2
            
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreCSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreCSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreCSet #3
               return result3
            } // p.zeroOrMoreCSet #2
            return result2
            
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreCSet( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreCSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreCSet #3
               return result3
            } // p.zeroOrMoreCSet #2
            return result2
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



  


   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



 

   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



  

   // non-capture + not consuming
   
   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreCSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreCSet #3
               return result3
            } // p.zeroOrMoreCSet #2
            return result2
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



  
   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )






   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_peek( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



 

   // Lazy variants:
   
   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_lazy( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreCSet_lazy( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreCSet_lazy( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreCSet #3
               return result3
            } // p.zeroOrMoreCSet #2
            return result2
            
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_lazy( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_lazy( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreCSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreCSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreCSet #3
               return result3
            } // p.zeroOrMoreCSet #2
            return result2
            
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_peek( a, capture:s3)
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
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
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_lazy( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreCSet_lazy( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreCSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreCSet #3
               return result3
            } // p.zeroOrMoreCSet #2
            return result2
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )





   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_lazy( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.zeroOrMoreCSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.zeroOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.zeroOrMoreCSet #3
               return result3
            } // p.zeroOrMoreCSet #2
            return result2
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a)
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




    i    = ""
   name = "zeroOrMoreCSet\(i)"
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
         p.zeroOrMoreCSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.zeroOrMoreCSet_peek( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.zeroOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.zeroOrMoreCSet #3
                  } // p.s
               } // p.zeroOrMoreCSet #2
            } // p.s
         } // p.zeroOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   //-----------------------------------------------------------------------------------------------
   //
   // oneOrMoreCSet
   
   
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
         p.oneOrMoreCSet( a, capture:s1)
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreCSet( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreCSet( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreCSet #3
               return result3
            } // p.oneOrMoreCSet #2
            return result2
            
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreCSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreCSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreCSet #3
               return result3
            } // p.oneOrMoreCSet #2
            return result2
            
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( a, capture:s2)
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a, capture:s1)
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreCSet( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreCSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreCSet #3
               return result3
            } // p.oneOrMoreCSet #2
            return result2
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



  




   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreCSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreCSet #3
               return result3
            } // p.oneOrMoreCSet #2
            return result2
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )


   // Lazy variants:
   
   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_lazy( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreCSet_lazy( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreCSet_lazy( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreCSet #3
               return result3
            } // p.oneOrMoreCSet #2
            return result2
            
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_lazy( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_lazy( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_lazy( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_lazy( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s4, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreCSet_peek( a, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreCSet_peek( a, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreCSet #3
               return result3
            } // p.oneOrMoreCSet #2
            return result2
            
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( a, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a, capture:s1 )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "aaa" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( bB, capture:s2 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bba" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ab", capture:s4, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
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
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_lazy( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreCSet_lazy( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreCSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreCSet #3
               return result3
            } // p.oneOrMoreCSet #2
            return result2
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_lazy( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )





   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_lazy( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_lazy( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_lazy( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "b", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   // non-capture + not consuming
   
   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.oneOrMoreCSet_peek( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.oneOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.oneOrMoreCSet #3
               return result3
            } // p.oneOrMoreCSet #2
            return result2
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )




   i    = ""
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



   i    = "i"
   name = "oneOrMoreCSet\(i)"
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
         p.oneOrMoreCSet_peek( a )
         {
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s( "a" )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.oneOrMoreCSet_peek( a )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "a" )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.oneOrMoreCSet_peek( a )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s1, {p.eos()} )
                        } // p.oneOrMoreCSet #3
                  } // p.s
               } // p.oneOrMoreCSet #2
            } // p.s
         } // p.oneOrMoreCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )



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
            "p.nCSet \(test) sequence: p.nCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nCSet( a, capture:s1, n:1 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nCSet( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nCSet( aA, capture:s3, n:1 )
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
   precondition( s1.s == "a", "nCSet \(test) failed, s1='\(s1.s)', expected 'a'" )
   precondition( s2.s == "a", "nCSet \(test) failed, s2='\(s2.s)', expected 'a'" )
   precondition( s3.s == "A", "nCSet \(test) failed, s3='\(s3.s)', expected 'A'" )
   print( "nCSet \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "#2"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaAAAA" ){
         print(
            "p.nCSet \(test) sequence: p.nCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nCSet( a, capture:s1, n:4 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nCSet( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nCSet( aA, capture:s3, n:3 )
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
   precondition( s1.s == "aaaa", "nCSet \(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
   precondition( s2.s == "A", "nCSet \(test) failed, s2='\(s2.s)', expected 'A'" )
   precondition( s3.s == "AAA", "nCSet \(test) failed, s3='\(s3.s)', expected 'AAA'" )
   print( "nCSet \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


   s1.s  = "*"
   s2.s  = "*"
   s3.s  = "*"
   test  = "#3"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaaaAAA" ){
         print(
            "p.nCSet \(test) sequence: p.nCSet('\(p.haystack[p.cursor..<p.endStr])'), ",
            terminator:""
         );
         let result1 =
         p.nCSet( a, capture:s1, n:4 )
         {
            print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.nCSet( aA, capture:s2, n:1 )
            {
               print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.nCSet( aA, capture:s3, n:3 )
               {
                  print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                  let result4 = p.eos()
                  return result4
                  
               } // p.nCSet #3
               return result3
            } // p.nCSet #2
            return result2
            
         } // p.nCSet #1
         return result1
         
      } // match
   print()
   precondition( !pResult, "nCSet \(test) should have returned failure" )
   print( "nCSet \(test) passed" )





//---------------------------------------------
//
// Test upToCSet


   name 	   = "upToCSet"
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
         p.upToCSet( bB, capture:s1 )
         {
            print( "p.s(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.s("b" )
            {
            
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.upToCSet( bB, capture:s2 )
               {
                  print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "b" )
                  {
                     print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.upToCSet( bB, capture:s3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        return p.s( "ba", capture:s4, {p.eos()} )
                     } // p.upToCSet #3
                  } // end p.s #2
               } // p.upToCSet #2
            } // end p.s #1
         } // p.upToCSet #1
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
   
   name = "upToCSet_peek"
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
         p.upToCSet_peek( bB, capture:s1 )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.upToCSet_peek( bB, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.upToCSet_peek( bB, capture:s3 )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "ababab", capture:s4, {p.eos()} )
                  return result4
                  
               } // p.upToCSet #3
            } // p.upToCSet #2
         } // p.upToCSet #1
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
   
   name = "upToCSet"
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
         p.upToCSet( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.upToCSet( a )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.upToCSet( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "baba", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.upToCSet #3
               return result3
            } // p.upToCSet #2
            return result2
         } // p.upToCSet #1
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "baba", "\(name)\(test) failed, s1='\(s1.s)', expected 'baba'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )

   
   name = "upToCSet"
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
         p.upToCSet( bB, {p.eos()} )
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( !pResult, "\(name)\(test) should have failed to match string" )
   print( "\(name)\(test) passed, by failing" )

   
   name = "upToCSet"
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
         p.upToCSet( empty, {p.eos()} )
         return result1
         
      } // match
   print()
   //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( !pResult, "\(name)\(test) should have failed to match string" )
   print( "\(name)\(test) passed, by failing" )






//---------------------------------------------
//
// Test thruStr/thruStri.




   name 	   = "thruCSet"
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
         p.thruCSet( bB, capture:s1 )
         {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.thruCSet( bB, capture:s2 )
               {
                     print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.thruCSet( bB, capture:s3 )
                     {
                        print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        return p.s( "a", capture:s4, {p.eos()} )
                     } // p.thruCSet #3
               } // p.thruCSet #2
         } // p.thruCSet #1
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
   
   name = "thruCSet"
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
         p.thruCSet_peek( bB, capture:s1)
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruCSet_peek( bB, capture:s2 )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruCSet_peek( bB, capture:s3 )
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
   
   name = "thruCSet"
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
         p.thruCSet( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruCSet( bB )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruCSet( bB )
               {
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result4 = p.s( "a", capture:s1, {p.eos()} )
                  return result4
                  
               } // p.thruCSet #3
               return result3
            } // p.thruCSet #2
            return result2
         } // p.thruCSet #1
         return result1
         
      } // match
   print()
   print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
   precondition( pResult, "\(name)\(test) failed to match string" )
   precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
   print( "\(name)\(test) passed, s1='\(s1.s)'" )


   // non-capture + not consuming
   
   name = "thruCSet"
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
         p.thruCSet_peek( bB )
         {
            print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let result2 =
            p.thruCSet_peek( bB )
            {
               print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result3 =
               p.thruCSet_peek( bB )
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
   
   runCSetSmokeTests()
}


// MARK: - Lightweight Test Harness (no XCTest)

final class CSetHarness {
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
      precondition( failed == 0, "CSetHarness has failures" )
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

public func runCSetSmokeTests() {
   let T = CSetHarness()
   print("=== CSet.swift Smoke Tests ===")

   // -----------------------------
   // Basic constructors / membership (CSet inits)
   // -----------------------------
   T.note("CSet(ch:) and CSet(str:) build expected sets")
   do {
      let aSet = CSet(ch: "A")
      T.expect(aSet.contains("A".unicodeScalars.first!), "CSet(ch:) should contain 'A'")
      T.expect(!aSet.contains("B".unicodeScalars.first!), "CSet(ch:) should not contain 'B'")

      let azSet = CSet(str: "AZ")
      T.expect(azSet.contains("A".unicodeScalars.first!) && azSet.contains("Z".unicodeScalars.first!),
               "CSet(str:) should contain 'A' and 'Z'")
   }

   // Prebuilt handy sets for tests
   let letters = CSet.letters
   let digits  = CSet.decimalDigits
   let wordish = CSet.alphanumerics.union(CSet(charactersIn: "_"))

   // -----------------------------
   // oneCSet / peek (+capture)  (single-scalar rule)
   // -----------------------------
   T.note("oneCSet: consumes a matching scalar, rejects non-member")
   T.expect(
      run("9x") { p in
         p.oneCSet(digits) {
            T.expect(remaining(p) == "x", "oneCSet should consume '9'")
            return true
         }
      },
      "oneCSet should succeed on '9'"
   )
   T.expect(
      !run("A") { p in p.oneCSet(digits) { true } },
      "oneCSet should fail when first char not in set"
   )

   T.note("oneCSet_peek: non-consuming")
   T.expect(
      run("A!") { p in
         p.oneCSet_peek(letters) {
            T.expect(remaining(p) == "A!", "peek must not consume")
            return true
         }
      }
   )

   T.note("oneCSet(capture:) and oneCSet_peek(capture:)")
   T.expect(
      run("_-") { p in
         let cap = RefSubstring()
         return p.oneCSet(wordish, capture: cap) {
            T.expect(cap.s == "_", "capture should be '_'")
            return true
         }
      }
   )
   T.expect(
      run("B?") { p in
         let cap = RefSubstring()
         return p.oneCSet_peek(letters, capture: cap) {
            T.expect(cap.s == "B", "peek cap mismatch")
            T.expect(remaining(p) == "B?", "peek should not consume")
            return true
         }
      }
   )

   // Boundary: composed Character with multiple scalars should fail
   // Using "e\u{301}" (e + COMBINING ACUTE) => 2 scalars.
   T.note("oneCSet: multi-scalar character is rejected by implementation")
   T.expect(
      !run("e\u{301}x") { p in p.oneCSet(letters) { true } },
      "oneCSet should require exactly one unicode scalar"
   )

   // -----------------------------
   // nTomCSet (eager)  / lazy / peek (+capture)
   // -----------------------------
   T.note("nTomCSet eager: greedy, then backtrack to satisfy tail")
   T.expect(
      run("1234X") { p in
         p.nTomCSet(digits, n: 1, m: 5) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X" { return true }
            return false
         }
      },
      "nTomCSet should align so next is 'X'"
   )

   T.note("nTomCSet: cannot meet minimum")
   T.expect(
      !run("abc") { p in p.nTomCSet(digits, n: 2, m: 3) { true } },
      "nTomCSet should fail if < n members"
   )

   T.note("nTomCSet_lazy: grows only as needed")
   T.expect(
      run("aaX") { p in
         p.nTomCSet_lazy(letters, n: 0, m: 3) {
            p.c_peek( "X" ){
               if p.cursor < p.endStr, letters.contains(p.haystack[p.cursor].unicodeScalars.first!) {
                  return true // keep it lazy while next is a letter
               }
               T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
               return true
            }
         }
      }
   )

   T.note("nTomCSet_peek: verify ≥ n without consuming")
   T.expect(
      run("12ab") { p in
         p.nTomCSet_peek(digits, n: 2, m: 3) {
            T.expect(remaining(p) == "12ab", "peek must not consume")
            return true
         }
      }
   )

   T.note("nTomCSet capture variants (eager/lazy/peek)")
   T.expect(
      run("foo123!") { p in
         let cap = RefSubstring()
         return p.nTomCSet(CSet.alphanumerics, n: 3, m: 6, capture: cap) {
            T.expect(!cap.s.isEmpty, "capture should contain consumed alphanumerics")
            return true
         }
      }
   )
   T.expect(
      run("999X") { p in
         let cap = RefSubstring()
         return p.nTomCSet_lazy(digits, n: 0, m: 3, capture: cap) {
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
         return p.nTomCSet_peek(digits, n: 1, m: 3, capture: cap) {
            T.expect(cap.s == "123" || cap.s == "12" || cap.s == "1",
                     "peek cap should be 1..3 digits")
            T.expect(remaining(p) == "123-", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // zero/one/more and exact-n wrappers (+lazy/+peek, +capture)
   // -----------------------------
   T.note("zeroOrOneCSet: present and absent")
   T.expect(
      run("Z") { p in p.zeroOrOneCSet(letters) { remaining(p).isEmpty } },
      "zeroOrOneCSet should consume when present"
   )
   T.expect(
      run("1") { p in p.zeroOrOneCSet(letters) { remaining(p) == "1" } },
      "zeroOrOneCSet should accept zero"
   )

   T.note("zeroOrMoreCSet / peek / capture")
   T.expect(
      run("ABC!") { p in
         p.zeroOrMoreCSet(letters) {
            T.expect(remaining(p) == "!", "zeroOrMoreCSet should eat letters")
            return true
         }
      }
   )
   T.expect(
      run("ABC!") { p in
         p.zeroOrMoreCSet_peek(letters) {
            T.expect(remaining(p) == "ABC!", "peek should not consume")
            return true
         }
      }
   )
   T.expect(
      run("__-") { p in
         let cap = RefSubstring()
         return p.zeroOrMoreCSet(wordish, capture: cap) {
            T.expect(cap.s == "__", "zeroOrMore capture mismatch: \(cap.s)")
            return true
         }
      }
   )

   T.note("oneOrMoreCSet and oneOrMoreCSet_lazy(capture:)")
   T.expect(
      run("aa.") { p in
         p.oneOrMoreCSet(letters) {
            T.expect(remaining(p) == ".", "oneOrMoreCSet should consume ≥1")
            return true
         }
      }
   )
   T.expect(
      run("aaX") { p in
         let cap = RefSubstring()
         return p.oneOrMoreCSet_lazy(letters, capture: cap) {
            p.c_peek( "X" ){
               T.expect(!cap.s.isEmpty, "lazy oneOrMore still requires ≥1")
               T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
               return true
            }
         }
      }
   )

   T.note("nCSet / nCSet_peek (+capture)")
   T.expect(
      run("123!") { p in
         p.nCSet(digits, n: 3) {
            T.expect(remaining(p) == "!", "nCSet(3) should consume exactly '123'")
            return true
         }
      }
   )
   T.expect(
      run("123!") { p in
         p.nCSet_peek(digits, n: 3) {
            T.expect(remaining(p) == "123!", "nCSet_peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("AB12-") { p in
         let cap = RefSubstring()
         return p.nCSet(CSet.alphanumerics, capture: cap, n: 4) {
            T.expect(cap.s == "AB12", "nCSet capture mismatch: \(cap.s)")
            return true
         }
      }
   )

   // -----------------------------
   // upToCSet / thruCSet (+peek, +capture)
   // -----------------------------
   T.note("upToCSet stops before first member; thruCSet consumes it")
   T.expect(
      run("abc1rest") { p in
         p.upToCSet(digits) {
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "1",
                     "upToCSet must stop at '1'")
            return true
         }
      }
   )
   T.expect(
      run("abc1rest") { p in
         p.thruCSet(digits) {
            T.expect(remaining(p) == "rest", "thruCSet should consume 'abc1'")
            return true
         }
      }
   )

   T.note("upToCSet_peek / thruCSet_peek: non-consuming")
   T.expect(
      run("abc:rest") { p in
         p.upToCSet_peek(CSet(charactersIn: ":")) {
            T.expect(remaining(p) == "abc:rest", "upToCSet_peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("abc:rest") { p in
         p.thruCSet_peek(CSet(charactersIn: ":")) {
            T.expect(remaining(p) == "abc:rest", "thruCSet_peek must not consume")
            return true
         }
      }
   )

   T.note("upToCSet(capture:) excludes delimiter; thruCSet(capture:) includes it")
   T.expect(
      run("foo-bar") { p in
         let cap = RefSubstring()
         return p.upToCSet(CSet(charactersIn: "-"), capture: cap) {
            T.expect(cap.s == "foo", "upToCSet capture mismatch: \(cap.s)")
            return true
         }
      }
   )
   T.expect(
      run("foo-bar") { p in
         let cap = RefSubstring()
         return p.thruCSet(CSet(charactersIn: "-"), capture: cap) {
            T.expect(cap.s == "foo-", "thruCSet capture should include '-'")
            return true
         }
      }
   )

   T.note("thruCSet_peek(capture:) includes delimiter in capture but restores cursor")
   T.expect(
      run("pre:post") { p in
         let cap = RefSubstring()
         return p.thruCSet_peek(CSet(charactersIn: ":"), capture: cap) {
            T.expect(cap.s == "pre:", "peek capture should include ':'")
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
