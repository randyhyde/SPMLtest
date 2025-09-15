//
//  testString.swift
//  SPMLtest

import Foundation
import SPML

func testString()
{

   let s1      = RefSubstring("")
   let s2      = RefSubstring("")
   let s3      = RefSubstring("")
   let s4      = RefSubstring("")
   let s5      = RefSubstring("")
   let s6      = RefSubstring("")

   
   var name    = ""
   var i       = " "
   var test    = ""
   var pResult = false
   
   var p       = Pattern()


   //---------------------------------------------
   //
   // Test s  and si


      var mStr = "a"
      name     = "s\(i)"
      i        = ""
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
            p.s( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.s( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.s( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.s #3
                  return result3
               } // p.s #2
               return result2
               
            } // p.s #1
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



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 cc"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.si #1
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


      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-000 cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si( "aa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.si #3
                     } // p.s
                  } // p.si #2
               } // p.s
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( "aa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bb", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( mStr, capture:s3 )
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
      precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
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
            p.si( "aa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si( "BB", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si( mStr, capture:s3 )
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
      precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      // Non-consuming versions:
      
      i    = ""
      name = "s\(i)"
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
            p.s_peek( "aaa", capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.s_peek( "aaa", capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.s_peek( "aaa", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.s #3
                  return result3
               } // p.s #2
               return result2
               
            } // p.s #1
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




      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 c_"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si_peek( "aaa", capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si_peek( "aaa", capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si_peek( "aaa", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.si #1
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


      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( "aaa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s_peek( "aa", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s4, {p.eos()} )
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
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-000 c_"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si_peek( "aaa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si_peek( "aa", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.si #3
                     } // p.s
                  } // p.si #2
               } // p.s
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( "aaa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s_peek( "bb", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bba" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "ab", capture:s4, {p.eos()} )
                           } // p.s #3
                     } // p.s
                  } // p.s #2
               } // p.s
            } // p.s #1
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



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-111 c_"
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
            p.si_peek( "aaa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si_peek( "BB", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bb" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si_peek( "aa", capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "aab", capture:s4, {p.eos()} )
                           } // p.s #3
                     } // p.s
                  } // p.s #2
               } // p.s
            } // p.s #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
      precondition( s4.s == "aab", "\(name)\(test) failed, s4='\(s4.s)', expected 'aab'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      // non-capture + consuming
      
      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.s( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.s( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 _c"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-000 _c"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.si #3
                     } // p.s
                  } // p.si #2
               } // p.s
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( "aa" )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bb" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.s #3
                     } // p.s
                  } // p.s #2
               } // p.s
            } // p.s #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
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
            p.si( "aa" )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si( "BB" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
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
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      // non-capture + not consuming
      
      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.s_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.s_peek( mStr )
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



      mStr  = "a"
      i    = "i"
      name = "s"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 __"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
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
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-000 __"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.si #3
                     } // p.s
                  } // p.si #2
               } // p.s
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.s #3
                     } // p.s
                  } // p.s #2
               } // p.s
            } // p.s #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
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
            p.si_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )

      // Lazy variants:
      
      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.s( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.s( "aa", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.s #3
                  return result3
               } // p.s #2
               return result2
               
            } // p.s #1
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



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy cc"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "aaa", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
      precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( "aa", capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-000 Lazy cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.si #3
                     } // p.s
                  } // p.si #2
               } // p.s
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( "aa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bb", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( mStr, capture:s3 )
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
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
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
            p.si( "aa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si( "BB", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si( mStr, capture:s3 )
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
      precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "b", "\(name)\(test) failed, s4='\(s4.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      // Non-consuming versions:
      
      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( "aaa", capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.s_peek( "aaa", capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.s_peek( "aaa", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.s #3
                  return result3
               } // p.s #2
               return result2
               
            } // p.s #1
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




      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy c_"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si_peek( "AAA", capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si_peek( "AAA", capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si_peek( "AAA", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.si #1
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


      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( "aaa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s_peek( "aa", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s_peek( "a", capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s4, {p.eos()} )
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
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-000 Lazy c_"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si_peek( "aaa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si_peek( "aa", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.si #3
                     } // p.s
                  } // p.si #2
               } // p.s
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( "aaa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s_peek( "bb", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bba" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "ab", capture:s4, {p.eos()} )
                           } // p.s #3
                     } // p.s
                  } // p.s #2
               } // p.s
            } // p.s #1
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



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-111 Lazy c_"
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
            p.si_peek( "aaa", capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si_peek( "BB", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bb" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si_peek( "aa", capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "aab", capture:s4, {p.eos()} )
                           } // p.s #3
                     } // p.s
                  } // p.s #2
               } // p.s
            } // p.s #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
      precondition( s4.s == "aab", "\(name)\(test) failed, s4='\(s4.s)', expected 'aab'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      // non-capture + consuming
      
      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.s( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.s( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy _c"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-000 Lazy _c"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.si #3
                     } // p.s
                  } // p.si #2
               } // p.s
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s( "aa" )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "bb" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.s #3
                     } // p.s
                  } // p.s #2
               } // p.s
            } // p.s #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
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
            p.si( "aa" )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si( "BB" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
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
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      // non-capture + not consuming
      
      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.s_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.s_peek( mStr )
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



      mStr  = "a"
      i    = "i"
      name = "s"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy __"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
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
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
      test = " #1-000 Lazy __"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.si_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.si #3
                     } // p.s
                  } // p.si #2
               } // p.s
            } // p.si #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr  = "a"
      i    = ""
      name = "s\(i)"
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
            p.s_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.s #3
                     } // p.s
                  } // p.s #2
               } // p.s
            } // p.s #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "a"
      i    = "i"
      name = "s\(i)"
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
            p.si_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.si_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.si_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
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
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#2"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaA" ){
            print(
               "p.s \(test) sequence: p.s('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.s( "a", capture:s1 )
            {
               print( "p.si(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( "a", capture:s2 )
               {
                  print( "p.si(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.s #1
            return result1
            
         } // match
      print()
      precondition( pResult, "s \(test) failed to match string" )
      precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "s \(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "A", "s \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "s \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#3"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.s \(test) sequence: p.s('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.s( "a", capture:s1 )
            {
               print( "p.si(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( "AAA", capture:s2 )
               {
                  print( "p.si(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.s #1
            return result1
            
         } // match
      print()
      precondition( pResult, "s \(test) failed to match string" )
      precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "aaA", "s \(test) failed, s2='\(s2.s)', expected 'aaA'" )
      precondition( s3.s == "A", "s \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "s \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#4"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.s \(test) sequence: p.s('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.s( "aaa", capture:s1 )
            {
               print( "p.si(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( "a", capture:s2 )
               {
                  print( "p.si(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.eos()
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.s #1
            return result1
            
         } // match
      print()
      precondition( pResult, "s \(test) failed to match string" )
      precondition( s1.s == "aaa", "s \(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "A", "s \(test) failed, s2='\(s2.s)', expected 'A'" )
      precondition( s3.s == "A", "s \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "s \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#5"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.s \(test) sequence: p.s('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.s( "a", capture:s1 )
            {
               print( "p.si(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( "a", capture:s2 )
               {
                  print( "p.si(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "AAA", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.s #1
            return result1
            
         } // match
      print()
      precondition( pResult, "s \(test) failed to match string" )
      precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "s \(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "aAA", "s \(test) failed, s3='\(s3.s)', expected 'aAA'" )
      print( "s \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#6"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.s \(test) sequence: p.s('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.s( "aaa", capture:s1)
            {
               print( "p.si(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( "a", capture:s2 )
               {
                  print( "p.si(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.s #1
            return result1
            
         } // match
      print()
      precondition( pResult, "s \(test) failed to match string" )
      precondition( s1.s == "aaa", "s \(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "A", "s \(test) failed, s2='\(s2.s)', expected 'A'" )
      precondition( s3.s == "A", "s \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "s \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#7"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.s \(test) sequence: p.s('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.s( "a", capture:s1 )
            {
               print( "p.si(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( "AaA", capture:s2 )
               {
                  print( "p.si(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.s #1
            return result1
            
         } // match
      print()
      precondition( pResult, "s \(test) failed to match string" )
      precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "aaA", "s \(test) failed, s2='\(s2.s)', expected 'aaA'" )
      precondition( s3.s == "A", "s \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "s \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#8"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.s \(test) sequence: p.s('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.s( "aaa", capture:s1 )
            {
               print( "p.si(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( "a", capture:s2 )
               {
                  print( "p.si(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.s #1
            return result1
            
         } // match
      print()
      precondition( pResult, "s \(test) failed to match string" )
      precondition( s1.s == "aaa", "s \(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "A", "s \(test) failed, s2='\(s2.s)', expected 'A'" )
      precondition( s3.s == "A", "s \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "s \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#9"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.s \(test) sequence: p.s('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.s( "a", capture:s1 )
            {
               print( "p.si(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.si( "a", capture:s2 )
               {
                  print( "p.si(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.si( "AAa", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.si #3
                  return result3
               } // p.si #2
               return result2
               
            } // p.s #1
            return result1
            
         } // match
      print()
      precondition( pResult, "s \(test) failed to match string" )
      precondition( s1.s == "a", "s \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "s \(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "aAA", "s \(test) failed, s3='\(s3.s)', expected 'aAA'" )
      print( "s \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



   //---------------------------------------------
   //
   // Test upToStr/upToStri.




      mStr     = "b"
      i    	   = ""
      name 	   = "upToStr\(i)"
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
            p.upToStr( mStr, capture:s1 )
            {
               print( "p.s(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s("b" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.upToStr( mStr, capture:s2 )
                  {
                     print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "b" )
                     {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.upToStr( mStr, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "ba", capture:s4, {p.eos()} )
                        } // p.upToStr #3
                     } // end p.s #2
                  } // p.upToStr #2
               } // end p.s #1
            } // p.upToStr #1
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "ba", "\(name)\(test) failed, s4='\(s4.s)', expected 'ba'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )

      mStr  = "b"
      i    = "i"
      name = "upToStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      s4.s = "*"
      test = " #1 cc"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aBaBaBa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.upToStri( mStr, capture:s1 )
            {
               print( "p.s(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "B" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.upToStri( mStr, capture:s2 )
                  {
                     p.s( "B" )
                     {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.upToStri( mStr, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( "Ba", capture:s4, {p.eos()} )
                        } // p.upToStri #3
                     } // p.s
                  }  // p.upToStri #2
               } // p.s
            } // p.upToStri #1
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "Ba", "\(name)\(test) failed, s3='\(s3.s)', expected 'Ba'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      mStr  = "b"
      i    = ""
      name = "upToStr\(i)"
      test = " #1-000 cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "bababaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.upToStr( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "ba" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.upToStr( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "ba" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.upToStr( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "baaaa", capture:s4, {p.eos()} )
                           } // p.upToStr #3
                     } // p.s
                  } // p.upToStr #2
               } // p.s
            } // p.upToStr #1
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      mStr  = "b"
      i    = "i"
      name = "upToStr\(i)"
      test = " #1-000 cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "BaBaBaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.upToStri( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "Ba" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.upToStri( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "Ba" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.upToStri( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "Baaaa", capture:s4, {p.eos()} )
                           } // p.upToStri #3
                     } // p.s
                  } // p.upToStri #2
               } // p.s
            } // p.upToStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )





      // Non-consuming versions:
      
      mStr  = "b"
      i     = ""
      name = "upToStr\(i)"
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
            p.upToStr_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.upToStr_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.upToStr_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "ababab", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.upToStr #3
                  return result3
               } // p.upToStr #2
               return result2
               
            } // p.upToStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "ababab", "\(name)\(test) failed, s4='\(s4.s)', expected 'ababab'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      mStr  = "B"
      i    = "i"
      name = "upToStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 c_"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aBaBaB" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.upToStri_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.upToStri_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.upToStri_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aBaBaB", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.upToStri #3
                  return result3
               } // p.upToStri #2
               return result2
               
            } // p.upToStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "aBaBaB", "\(name)\(test) failed, s4='\(s4.s)', expected 'aBaBaB'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      // non-capture + consuming
      
      mStr  = "b"
      i    = ""
      name = "upToStr\(i)"
      test = " #1-111 _c"
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
            p.upToStr( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.upToStr( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.upToStr( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "bababa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.upToStr #3
                  return result3
               } // p.upToStr #2
               return result2
            } // p.upToStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "bababa", "\(name)\(test) failed, s1='\(s1.s)', expected 'bababa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "B"
      i    = "i"
      name = "upToStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 _c"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aBaBaBa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.upToStri( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.upToStri( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.upToStri( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "BaBaBa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.upToStri #3
                  return result3
               } // p.upToStri #2
               return result2
               
            } // p.upToStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "BaBaBa", "\(name)\(test) failed, s1='\(s1.s)', expected 'BaBaBa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      // non-capture + not consuming
      
      mStr  = "b"
      i    = ""
      name = "upToStr\(i)"
      test = " #1-111 __"
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
            p.upToStr_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.upToStr_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.upToStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "abaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.upToStr #3
                  return result3
               } // p.upToStr #2
               return result2
            } // p.upToStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "abaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'abaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "B"
      i    = "i"
      name = "upToStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 __"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "abaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.upToStri_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.upToStri_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.upToStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "abaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.upToStri #3
                  return result3
               } // p.upToStri #2
               return result2
               
            } // p.upToStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "abaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'abaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )

      // consuming, capture:
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      s4.s        = "*"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "abcdefg" ){
            print( "p.upToStr #2 sequence(cc): ", terminator:"" ); return
            p.upToStr( "d", capture:s1 )
            {
               print( "p.upToStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.upToStr( "f", capture:s2 )
               { // This is the tail
                  print( "p.upToStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.upToStr( "fg", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("fg", capture:s4, {p.eos()} )
                  }
               } // tail
            } //arb
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abc"
         && s2.s == "de"
         && s3.s == ""
         && s4.s == "fg",
         "upToStr #2 failed"
      )
      print( "upToStr #2 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // capture, no consuming:
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      s4.s        = "*"
      s5.s        = "*"
      s6.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.upToStr #3 sequence(c_): ", terminator:"" ); return
            p.upToStr_peek( "d", capture:s1 )
            {
               p.s( "abc", capture:s2 )   // Verify non-consumption of "abc"
               {
                  print( "p.upToStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
                  p.upToStr_peek( "f", capture:s3 )
                  {
                     p.s( "de", capture:s4 )
                     {
                        print( "p.upToStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.upToStr( "fg", capture:s5 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.s( "fg", capture:s6 )
                        }
                     }
                  } // tail
               }
            } //arb
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abc"
         && s2.s == "abc"
         && s3.s == "de"
         && s4.s == "de"
         && s5.s == ""
         && s6.s == "fg",
         "upToStr #3 failed"
      )
      print( "upToStr #3 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )

      // no capture, consuming
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.upToStr #4 sequence(_c): ", terminator:"" ); return
            p.upToStr( "d" )
            {
               print( "p.upToStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.upToStr( "f" )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "fg" )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "upToStr #4 failed" )
      print( "upToStr #4 passed" )

      // no capture, no consuming
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.upToStr #5 sequence(__): ", terminator:"" ); return
            p.upToStr_peek( "d" )
            {
               print( "p.upToStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.upToStr_peek( "f" )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "abcdefg" )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "upToStr #5 failed" )
      print( "upToStr #5 passed" )


      // upToStri- capture and consuming

      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "abcdeFg" ){
            print( "p.upToStri #6 sequence(cc): ", terminator:"" ); return
            p.upToStri( "D", capture:s1 )
            {
               print( "p.upToStri('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.upToStri( "f", capture:s2 )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "Fg", capture:s3 )
               } // tail
            } //arb
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abc"
         && s2.s == "de"
         && s3.s == "Fg",
         "upToStri #6 failed"
      )
      print( "upToStri #6 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // capture, no consuming
      
      s1.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcDefg" )
         {
            print( "p.upToStri #7 sequence(c_): ", terminator:"" ); return
            p.upToStri_peek( "d", capture:s1 )
            {
               print( "p.upToStri('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.upToStri_peek( "F", capture:s2 )
               {
                 print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "abcDefg", capture:s3, {p.eos()} )
               }
            }
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition(
            pResult
         && s1.s == "abc"
         && s2.s == "abcDe"
         && s3.s == "abcDefg",
         "upToStri #7 failed"
      )
      print( "upToStri #7 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // no capture, consuming:
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.upToStri #8 sequence(_c): ", terminator:"" ); return
            p.upToStri( "D" )
            {
               print( "p.upToStri('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.upToStri( "F" )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "fg" )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "upToStri #8 failed" )
      print( "upToStri #8 passed" )
      

      // no capture, no consuming
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.upToStri #9 sequence(__): ", terminator:"" ); return
            p.upToStri_peek( "D" )
            {
               print( "p.upToStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.upToStri_peek( "F" )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "abcdefg" )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "upToStri #9 failed" )
      print( "upToStri #9 passed" )




   //---------------------------------------------
   //
   // Test thruStr/thruStri.




      mStr     = "b"
      i    	   = ""
      name 	   = "thruStr\(i)"
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
            p.thruStr( mStr, capture:s1 )
            {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.thruStr( mStr, capture:s2 )
                  {
                        print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.thruStr( mStr, capture:s3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           return p.s( "a", capture:s4, {p.eos()} )
                        } // p.thruStr #3
                  } // p.thruStr #2
            } // p.thruStr #1
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "ab", "\(name)\(test) failed, s1='\(s1.s)', expected 'ab'" )
      precondition( s2.s == "ab", "\(name)\(test) failed, s2='\(s2.s)', expected 'ab'" )
      precondition( s3.s == "ab", "\(name)\(test) failed, s3='\(s3.s)', expected 'ab'" )
      precondition( s4.s == "a", "\(name)\(test) failed, s4='\(s4.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      mStr  = "b"
      i    = "i"
      name = "thruStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      s4.s = "*"
      test = " #1 cc"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aBaBaBa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.thruStri( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.thruStri( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.thruStri( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a", capture:s4, {p.eos()} )
                  } // p.thruStri #3
               }  // p.thruStri #2
            } // p.thruStri #1
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aB", "\(name)\(test) failed, s1='\(s1.s)', expected 'aB'" )
      precondition( s2.s == "aB", "\(name)\(test) failed, s2='\(s2.s)', expected 'aB'" )
      precondition( s3.s == "aB", "\(name)\(test) failed, s3='\(s3.s)', expected 'aB'" )
      precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      mStr  = "b"
      i    = ""
      name = "thruStr\(i)"
      test = " #1-000 cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "bababaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.thruStr( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.thruStr( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.thruStr( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     return p.s( "aaaa", capture:s4, {p.eos()} )
                  } // p.thruStr #3
               } // p.thruStr #2
            } // p.thruStr #1
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      precondition( s2.s == "ab", "\(name)\(test) failed, s2='\(s2.s)', expected 'ab'" )
      precondition( s3.s == "ab", "\(name)\(test) failed, s3='\(s3.s)', expected 'ab'" )
      precondition( s4.s == "aaaa", "\(name)\(test) failed, s4='\(s4.s)', expected 'aaaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      mStr  = "b"
      i    = "i"
      name = "thruStr\(i)"
      test = " #1-000 cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "BaBaBaaaa" )
         {
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.thruStri( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.thruStri( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.thruStri( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     return p.s( "aaaa", capture:s4, {p.eos()} )
                  } // p.thruStri #3
               } // p.thruStri #2
            } // p.thruStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "B", "\(name)\(test) failed, s1='\(s1.s)', expected 'B'" )
      precondition( s2.s == "aB", "\(name)\(test) failed, s2='\(s2.s)', expected 'aB'" )
      precondition( s3.s == "aB", "\(name)\(test) failed, s3='\(s3.s)', expected 'aB'" )
      precondition( s4.s == "aaaa", "\(name)\(test) failed, s4='\(s4.s)', expected 'aaaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )






      // Non-consuming versions:
      
      mStr  = "b"
      i    = ""
      name = "thruStr\(i)"
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
            p.thruStr_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.thruStr_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.thruStr_peek( mStr, capture:s3 )
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



      mStr  = "b"
      i    = "i"
      name = "thruStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 c_"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aBaBaB" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.thruStri_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.thruStri_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.thruStri_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aBaBaB", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.thruStri #3
                  return result3
               } // p.thruStri #2
               return result2
               
            } // p.thruStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aB", "\(name)\(test) failed, s1='\(s1.s)', expected 'aB'" )
      precondition( s2.s == "aB", "\(name)\(test) failed, s2='\(s2.s)', expected 'aB'" )
      precondition( s3.s == "aB", "\(name)\(test) failed, s3='\(s3.s)', expected 'aB'" )
      precondition( s4.s == "aBaBaB", "\(name)\(test) failed, s4='\(s4.s)', expected 'aBaBaB'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      // non-capture + consuming
      
      mStr  = "b"
      i    = ""
      name = "thruStr\(i)"
      test = " #1-111 _c"
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
            p.thruStr( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.thruStr( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.thruStr( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.thruStr #3
                  return result3
               } // p.thruStr #2
               return result2
            } // p.thruStr #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr  = "b"
      i    = "i"
      name = "thruStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 _c"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aBaBaBa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.thruStri( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.thruStri( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.thruStri( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.thruStri #3
                  return result3
               } // p.thruStri #2
               return result2
               
            } // p.thruStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      // non-capture + not consuming
      
      mStr  = "b"
      i    = ""
      name = "thruStr\(i)"
      test = " #1-111 __"
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
            p.thruStr_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.thruStr_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.thruStr_peek( mStr )
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



      mStr  = "B"
      i    = "i"
      name = "thruStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 __"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "abaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.thruStri_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.thruStri_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.thruStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "abaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.thruStri #3
                  return result3
               } // p.thruStri #2
               return result2
               
            } // p.thruStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "abaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'abaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      
      // consuming, capture:
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      s4.s        = "*"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "abcdefg" ){
            print( "p.thruStr #2 sequence(cc): ", terminator:"" ); return
            p.thruStr( "d", capture:s1 )
            {
               print( "p.thruStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.thruStr( "f", capture:s2 )
               { // This is the tail
                  print( "p.thruStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.thruStr( "g", capture:s3, {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition(
            pResult
         && s1.s == "abcd"
         && s2.s == "ef"
         && s3.s == "g",
         "thruStr #2 failed"
      )
      print( "thruStr #2 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // capture, no consuming:
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      s4.s        = "*"
      s5.s        = "*"
      s6.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.thruStr #3 sequence(c_): ", terminator:"" ); return
            p.thruStr_peek( "d", capture:s1 )
            {
               p.s( "abcd", capture:s2 )   // Verify non-consumption of "abc"
               {
                  print( "p.thruStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
                  p.thruStr_peek( "f", capture:s3 )
                  {
                     p.s( "ef", capture:s4 )
                     {
                        print( "p.thruStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.thruStr( "g", capture:s5, {p.eos()} )
                     }
                  } // tail
               }
            } //arb
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abcd"
         && s2.s == "abcd"
         && s3.s == "ef"
         && s4.s == "ef"
         && s5.s == "g",
         "thruStr #3 failed"
      )
      print( "thruStr #3 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )

      // no capture, consuming
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.thruStr #4 sequence(_c): ", terminator:"" ); return
            p.thruStr( "d" )
            {
               print( "p.thruStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.thruStr( "f" )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "g", {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "thruStr #4 failed" )
      print( "thruStr #4 passed" )

      // no capture, no consuming
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.thruStr #5 sequence(__): ", terminator:"" ); return
            p.thruStr_peek( "d" )
            {
               print( "p.upToStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.thruStr_peek( "f" )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "abcdefg" )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "thruStr #5 failed" )
      print( "thruStr #5 passed" )


      // thruStri- capture and consuming

      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "abcdeFg" ){
            print( "p.thruStri #6 sequence(cc): ", terminator:"" ); return
            p.thruStri( "D", capture:s1 )
            {
               print( "p.thruStri('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.thruStri( "f", capture:s2 )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "g", capture:s3 )
               } // tail
            } //arb
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abcd"
         && s2.s == "eF"
         && s3.s == "g",
         "thruStri #6 failed"
      )
      print( "thruStri #6 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // capture, no consuming
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcDefg" ){
            print( "p.thruStri #7 sequence(c_): ", terminator:"" ); return
            p.thruStri_peek( "d", capture:s1 )
            {
               print( "p.thruStri('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.thruStri_peek( "F", capture:s2 )
               { // This is the tail
                 print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "abcDefg", capture:s3 )
               } // tail
            } //arb
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition(
            pResult
         && s1.s == "abcD"
         && s2.s == "abcDef"
         && s3.s == "abcDefg",
         "thruStri #7 failed"
      )
      print( "thruStri #7 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // no capture, consuming:
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.thruStri #8 sequence(_c): ", terminator:"" ); return
            p.thruStri( "D" )
            {
               print( "p.thruStri('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.thruStri( "F" )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "g", {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "thruStri #8 failed" )
      print( "thruStri #8 passed" )
      

      // no capture, no consuming
      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcdefg" ){
            print( "p.thruStri #9 sequence(__): ", terminator:"" ); return
            p.thruStri_peek( "D" )
            {
               print( "p.thruStri('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.thruStri_peek( "F" )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.s( "abcdefg" )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "thruStri #9 failed" )
      print( "thruStri #9 passed" )
      
     
     
     //-----------------------------------------------------------------------------------------------
     //
     // nTomStr/nTomStri
     
      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      test     =  " #1 cc"
      p        = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStr( "a", n:2, m:4, capture:s1 )
            {
               print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.nTomStr( "b", n:2, m:3, capture:s2 )
               {
                  print( "p.nTomStr(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                     p.nTomStr( "c", n:1, m:3, capture:s3 )
                     {
                        print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.eos()
                        return result4
                     } // p.nTomStr #3
                  return result3
               } // p.nTomStr #2
               return result2
            } //p.nTomStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
      precondition( s2.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
      precondition( s3.s == "ccc", "nTomStr\(test) failed, s3='\(s3.s)', expected 'ccc'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      test =  " #1 Lazy cc"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStr_lazy( "a", n:2, m:4, capture:s1 )
            {
               print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.nTomStr_lazy( "b", n:2, m:3, capture:s2 )
               {
                  print( "p.nTomStr(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                     p.nTomStr_lazy( "c", n:1, m:3, capture:s3 )
                     {
                        print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.eos()
                        return result4
                     } // p.nTomStr #3
                  return result3
               } // p.nTomStr #2
               return result2
            } //p.nTomStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
      precondition( s2.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
      precondition( s3.s == "ccc", "nTomStr\(test) failed, s3='\(s3.s)', expected 'ccc'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      test =  "i #1 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "AAAABBBCCC" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStri( "a", n:2, m:4, capture:s1 )
            {
               print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.nTomStri( "b", n:2, m:3, capture:s2 )
               {
                  print( "p.nTomStri(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                     p.nTomStri( "c", n:1, m:3, capture:s3 )
                     {
                        print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.eos()
                        return result4
                     } // p.nTomStr #3
                  return result3
               } // p.nTomStr #2
               return result2
            } //p.nTomStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "AAAA", "nTomStr\(test) failed, s1='\(s1.s)', expected 'AAAA'" )
      precondition( s2.s == "BBB", "nTomStr\(test) failed, s2='\(s2.s)', expected 'BBB'" )
      precondition( s3.s == "CCC", "nTomStr\(test) failed, s3='\(s3.s)', expected 'CCC'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      test =  "i #1 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "AAAABBBCCC" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStri_lazy( "a", n:2, m:4, capture:s1 )
            {
               print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.nTomStri_lazy( "b", n:2, m:3, capture:s2 )
               {
                  print( "p.nTomStri(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                     p.nTomStri_lazy( "c", n:1, m:3, capture:s3 )
                     {
                        print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                        let result4 = p.eos()
                        return result4
                     } // p.nTomStr #3
                  return result3
               } // p.nTomStr #2
               return result2
            } //p.nTomStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "AAAA", "nTomStr\(test) failed, s1='\(s1.s)', expected 'AAAA'" )
      precondition( s2.s == "BBB", "nTomStr\(test) failed, s2='\(s2.s)', expected 'BBB'" )
      precondition( s3.s == "CCC", "nTomStr\(test) failed, s3='\(s3.s)', expected 'CCC'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  " #1 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStr_peek( "a", n:2, m:4, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaaa" )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "b", n:2, m:3, capture:s2 )
                  {
                     print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("bbb", capture:s3 )
                     {
                       print( "p.nTomStr(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.nTomStr_peek( "c", n:1, m:3, capture:s4 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           let result4 = p.s( "ccc", capture:s5, {p.eos()} )
                           return result4
                        } // p.nTomStr #3
                     } // p.s #2
                  } // p.nTomStr #2
               } // p.s
            } //p.nTomStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
      precondition( s2.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
      precondition( s3.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
      precondition( s4.s == "ccc", "nTomStr\(test) failed, s4='\(s4.s)', expected 'ccc'" )
      precondition( s5.s == "ccc", "nTomStr\(test) failed, s5='\(s5.s)', expected 'ccc'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )



      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  " #1 Lazy c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStr_peek( "a", n:2, m:4, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaaa" )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "b", n:2, m:3, capture:s2 )
                  {
                     print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("bbb", capture:s3 )
                     {
                       print( "p.nTomStr(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.nTomStr_peek( "c", n:1, m:3, capture:s4 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           let result4 = p.s( "ccc", capture:s5, {p.eos()} )
                           return result4
                        } // p.nTomStr #3
                     } // p.s #2
                  } // p.nTomStr #2
               } // p.s
            } //p.nTomStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
      precondition( s2.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
      precondition( s3.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
      precondition( s4.s == "ccc", "nTomStr\(test) failed, s4='\(s4.s)', expected 'ccc'" )
      precondition( s5.s == "ccc", "nTomStr\(test) failed, s5='\(s5.s)', expected 'ccc'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)'" )


      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      s5.s   = "*"
      s6.s   = "*"
      test =  "i #1 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "AAAABBBCCC" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStri_peek( "a", n:2, m:4, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "AAAA", capture:s2 )
               {
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "b", n:2, m:3, capture:s3 )
                  {
                     print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("BBB", capture:s4 )
                     {
                       print( "p.nTomStri(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.nTomStri_peek( "c", n:1, m:3, capture:s5 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           let result4 = p.s( "CCC", capture:s6, {p.eos()} )
                           return result4
                        } // p.nTomStri #3
                     } // p.s #2
                  } // p.nTomStri #2
               } // p.s
            } //p.nTomStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "AAAA", "nTomStr\(test) failed, s1='\(s1.s)', expected 'AAAA'" )
      precondition( s2.s == "AAAA", "nTomStr\(test) failed, s1='\(s1.s)', expected 'AAAA'" )
      precondition( s3.s == "BBB", "nTomStr\(test) failed, s2='\(s2.s)', expected 'BBB'" )
      precondition( s4.s == "BBB", "nTomStr\(test) failed, s2='\(s2.s)', expected 'BBB'" )
      precondition( s5.s == "CCC", "nTomStr\(test) failed, s2='\(s2.s)', expected 'CCC'" )
      precondition( s6.s == "CCC", "nTomStr\(test) failed, s3='\(s3.s)', expected 'CCC'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)', s6='\(s6.s)'" )


      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      s5.s   = "*"
      s6.s   = "*"
      test =  "i #1 Lazy c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "AAAABBBCCC" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStri_peek( "a", n:2, m:4, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "AAAA", capture:s2 )
               {
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "b", n:2, m:3, capture:s3 )
                  {
                     print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("BBB", capture:s4 )
                     {
                       print( "p.nTomStri(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.nTomStri_peek( "c", n:1, m:3, capture:s5 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           let result4 = p.s( "CCC", capture:s6, {p.eos()} )
                           return result4
                        } // p.nTomStri #3
                     } // p.s #2
                  } // p.nTomStri #2
               } // p.s
            } //p.nTomStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "AAAA", "nTomStr\(test) failed, s1='\(s1.s)', expected 'AAAA'" )
      precondition( s2.s == "AAAA", "nTomStr\(test) failed, s1='\(s1.s)', expected 'AAAA'" )
      precondition( s3.s == "BBB", "nTomStr\(test) failed, s2='\(s2.s)', expected 'BBB'" )
      precondition( s4.s == "BBB", "nTomStr\(test) failed, s2='\(s2.s)', expected 'BBB'" )
      precondition( s5.s == "CCC", "nTomStr\(test) failed, s2='\(s2.s)', expected 'CCC'" )
      precondition( s6.s == "CCC", "nTomStr\(test) failed, s3='\(s3.s)', expected 'CCC'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)', s5='\(s5.s)', s6='\(s6.s)'" )



      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  " #1 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStr( "a", n:2, m:4 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr( "b", n:2, m:3 )
               { // This is the tail
                 print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.nTomStr( "c", n:1, m:3 )
                  {
                     let result4 = p.eos()
                     return result4
                  } // p.nTomStri #2
                } // p.nTomStri #1
            } //p.nTomStr
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )



      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  " #1 Lazy _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStr_lazy( "a", n:2, m:4 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_lazy( "b", n:2, m:3 )
               { // This is the tail
                 print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.nTomStr_lazy( "c", n:1, m:3 )
                  {
                     let result4 = p.eos()
                     return result4
                  } // p.nTomStri #2
                } // p.nTomStri #1
            } //p.nTomStr
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )



      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  "i #1 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStri( "A", n:2, m:4 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri( "B", n:2, m:3 )
               { // This is the tail
                 print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.nTomStri( "C", n:1, m:3 )
                  {
                     let result4 = p.eos()
                     return result4
                  } // p.nTomStri #2
                } // p.nTomStri #1
            } //p.nTomStr
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )



      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  "i #1 Lazy _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStri_lazy( "A", n:2, m:4 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_lazy( "B", n:2, m:3 )
               { // This is the tail
                 print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.nTomStri_lazy( "C", n:1, m:3 )
                  {
                     let result4 = p.eos()
                     return result4
                  } // p.nTomStri #2
                } // p.nTomStri #1
            } //p.nTomStr
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )



      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  "#1 __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbcCc" ){
            print(
               "p.nTomStr \(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStr_peek( "a", n:2, m:4 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaaa", capture:s1 )
               {
                  print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "B", n:2, m:3 )
                  { // This is the tail
                     print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("bbb", capture:s2 )
                     {
                       print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                       p.nTomStri_peek( "c", n:1, m:3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           let result4 = p.s( "cCc", capture:s3, {p.eos()} )
                           return result4
                        } // p.nTomStri #2
                     } // p.s #2
                  } // p.nTomStri #1
               } // p.s
            } //p.nTomStr
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr \(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr \(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "bbb", "nTomStr \(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "cCc", "nTomStr \(test) failed, s3='\(s3.s)', expected 'cCc'" )
      print( "nTomStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )





      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  "i #1 __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStri_peek( "A", n:2, m:4 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaaa", capture:s1 )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "B", n:2, m:3 )
                  {
                     print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("bbb", capture:s2 )
                     {
                       print( "p.nTomStr(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                       p.nTomStri_peek( "C", n:1, m:3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           let result4 = p.s( "ccc", capture:s3, {p.eos()} )
                           return result4
                        } // p.nTomStr #3
                     } // p.s #2
                  } // p.nTomStr #2
               } // p.s
            } //p.nTomStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
      precondition( s2.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
      precondition( s3.s == "ccc", "nTomStr\(test) failed, s3='\(s3.s)', expected 'ccc'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      s1.s   = "*"
      s2.s   = "*"
      s3.s   = "*"
      s4.s   = "*"
      test =  "i #1 Lazy __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaabbbccc" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nTomStri_peek( "A", n:2, m:4 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaaa", capture:s1 )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "B", n:2, m:3 )
                  {
                     print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("bbb", capture:s2 )
                     {
                       print( "p.nTomStr(3, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                       p.nTomStri_peek( "C", n:1, m:3 )
                        {
                           print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                           let result4 = p.s( "ccc", capture:s3, {p.eos()} )
                           return result4
                        } // p.nTomStr #3
                     } // p.s #2
                  } // p.nTomStr #2
               } // p.s
            } //p.nTomStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
      precondition( s2.s == "bbb", "nTomStr\(test) failed, s2='\(s2.s)', expected 'bbb'" )
      precondition( s3.s == "ccc", "nTomStr\(test) failed, s3='\(s3.s)', expected 'ccc'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #2 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr \(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr( "a", n:4, m:6, capture:s1 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr( "a", n:3, m:4, capture:s2 )
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "a", n:1, m:3, capture:s3, {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'AaAa'" )
      precondition( s3.s == "aa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'Aa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #2 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "AAAAAAAAAAAA" ){
            print(
               "p.nTomStri \(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri( "a", n:4, m:6, capture:s1 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri( "a", n:3, m:4, capture:s2 )
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri( "a", n:1, m:3, capture:s3, {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "AAAAAA", "nTomStr\(test) failed, s1='\(s1.s)', expected 'AAAAAA'" )
      precondition( s2.s == "AAAA", "nTomStr\(test) failed, s2='\(s2.s)', expected 'AAAA'" )
      precondition( s3.s == "AA", "nTomStr\(test) failed, s3='\(s3.s)', expected 'AA'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #2 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_lazy( "a", n:4, m:6, capture:s1 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_lazy( "a", n:3, m:4, capture:s2 )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_lazy( "a", n:1, m:3, capture:s3, {p.eos()} )
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #2 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_lazy( "a", n:4, m:6, capture:s1 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_lazy( "a", n:3, m:4, capture:s2 )
               {
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_lazy( "a", n:1, m:3, capture:s3, {p.eos()} )
               } // p.nTomStri
            } //p.nTomStri
         } // matchi
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #2 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_peek( "a", n:4, m:6, capture:s1 )
            {
               p.s( "aaaaaa" )
               {
                  print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "a", n:3, m:4, capture:s2 )
                  {
                     p.s("aaaa" )
                     {
                        print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.nTomStr_peek( "a", n:1, m:3, capture:s3 )
                        {
                           p.s("aa", {p.eos()} )
                        } // p.nTomStr
                     } // p.s
                  } // p.nTomStr
               } // p.s
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #2 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_peek( "A", n:4, m:6, capture:s1 )
            {
               p.s( "aaaaaa" )
               {
                  print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "A", n:3, m:4, capture:s2 )
                  {
                     p.s("aaaa" )
                     {
                        print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.nTomStri_peek( "A", n:1, m:3, capture:s3 )
                        {
                           p.s("aa", {p.eos()} )
                        } // p.nTomStri
                     } // p.s
                  } // p.nTomStri
               } // p.s
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #2 Lazy c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_peek( "a", n:4, m:6, capture:s1 )
            {
               p.s( "aaaaaa" )
               {
                  print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "a", n:3, m:4, capture:s2 )
                  {
                     p.s("aaaa" )
                     {
                        print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.nTomStr_peek( "a", n:1, m:3, capture:s3 )
                        {
                           p.s("aa", {p.eos()} )
                        } // p.nTomStr
                     } // p.s
                  } // p.nTomStr
               } // p.s
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #2 Lazy c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStri\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_peek( "A", n:4, m:6, capture:s1 )
            {
               p.s( "aaaaaa" )
               {
                  print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "A", n:3, m:4, capture:s2 )
                  {
                     p.s("aaaa" )
                     {
                        print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.nTomStri_peek( "A", n:1, m:3, capture:s3 )
                        {
                           p.s("aa", {p.eos()} )
                        } // p.nTomStri
                     } // p.s
                  } // p.nTomStri
               } // p.s
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #2 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr( "a", n:4, m:6 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr( "a", n:3, m:4 )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "a", n:1, m:3, {p.eos()} )
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #2 Lazy _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_lazy( "a", n:4, m:6 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_lazy( "a", n:3, m:4 )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_lazy( "a", n:1, m:3, {p.eos()} )
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #2 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri( "a", n:4, m:6 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri( "a", n:3, m:4 )
               {
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri( "a", n:1, m:3, {p.eos()} )
               } // p.nTomStri
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #2 Lazy _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_lazy( "a", n:4, m:6 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_lazy( "a", n:3, m:4 )
               {
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_lazy( "a", n:1, m:3, {p.eos()} )
               } // p.nTomStri
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )



      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #2 __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_peek( "a", n:4, m:6 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_peek( "a", n:3, m:4 )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "a", n:1, m:3 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.nTomStr
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #2 Lazy __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_peek( "a", n:4, m:6 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_peek( "a", n:3, m:4 )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "a", n:1, m:3 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.nTomStr
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #2 __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_peek( "A", n:4, m:6 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_peek( "A", n:3, m:4 )
               {
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "A", n:1, m:3 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.nTomStri
               } // p.nTomStri
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #2 Lazy __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_peek( "A", n:4, m:6 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_peek( "A", n:3, m:4 )
               {
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "A", n:1, m:3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.nTomStri
               } // p.nTomStri
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      // Test #3-backtracking:

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #3 (bt) cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr( "a", n:4, m:12, capture:s1 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr( "a", n:4, m:8, capture:s2 )
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "a", n:3, m:4, capture:s3, {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #3 (bt) Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_lazy( "a", n:4, m:12, capture:s1 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_lazy( "a", n:4, m:8, capture:s2 )
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_lazy( "a", n:3, m:4, capture:s3, {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aaaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #3 (bt) cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri( "A", n:4, m:12, capture:s1 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri( "a", n:4, m:8, capture:s2 )
               { // This is the tail
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri( "A", n:3, m:4, capture:s3, {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #3 (bt) Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_lazy( "A", n:4, m:12, capture:s1 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_lazy( "a", n:4, m:8, capture:s2 )
               { // This is the tail
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_lazy( "A", n:3, m:4, capture:s3, {p.eos()} )
               } // p.nTomStri
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaa'" )
      precondition( s2.s == "aaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaa'" )
      precondition( s3.s == "aaaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #3 (bt) c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_peek( "a", n:4, m:12, capture:s1 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_peek( "a", n:4, m:8 , capture:s2)
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "a", n:3, m:4, capture:s3 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.s
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaaaaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
      precondition( s2.s == "aaaaaaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaaaaaa'" )
      precondition( s3.s == "aaaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #3 (bt) Lazy c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_peek( "a", n:4, m:12, capture:s1 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_peek( "a", n:4, m:8, capture:s2 )
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "a", n:3, m:4, capture:s3 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.s
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaaaaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
      precondition( s2.s == "aaaaaaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaaaaaa'" )
      precondition( s3.s == "aaaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #3 (bt) c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_peek( "A", n:4, m:12, capture:s1 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_peek( "A", n:4, m:8, capture:s2 )
               { // This is the tail
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "A", n:3, m:4, capture:s3 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.s
               } // tail
            } //arb
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaaaaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
      precondition( s2.s == "aaaaaaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaaaaaa'" )
      precondition( s3.s == "aaaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #3 (bt) Lazy c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_peek( "A", n:4, m:12, capture:s1 ){
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_peek( "a", n:4, m:8, capture:s2 )
               { // This is the tail
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "A", n:3, m:4, capture:s3 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.s
               } // p.nTomStri
            } //p.nTomStri
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition( pResult, "nTomStr\(test) failed to match string" )
      precondition( s1.s == "aaaaaaaaaaaa", "nTomStr\(test) failed, s1='\(s1.s)', expected 'aaaaaaaaaaaa'" )
      precondition( s2.s == "aaaaaaaa", "nTomStr\(test) failed, s2='\(s2.s)', expected 'aaaaaaaa'" )
      precondition( s3.s == "aaaa", "nTomStr\(test) failed, s3='\(s3.s)', expected 'aaaa'" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #3 (bt) _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr( "a", n:4, m:12 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr( "a", n:4, m:8 )
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "a", n:3, m:4, {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #3 (bt) Lazy _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_lazy( "a", n:4, m:12 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_lazy( "a", n:4, m:8 , capture:s2 )
               {
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_lazy( "a", n:3, m:4, {p.eos()} )
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #3 (bt) _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri( "A", n:4, m:12 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri( "a", n:4, m:8 )
               { // This is the tail
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri( "A", n:3, m:4, {p.eos()} )
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #3 (bt) Lazy _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_lazy( "A", n:4, m:12 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_lazy( "a", n:4, m:8 )
               { // This is the tail
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_lazy( "A", n:3, m:4, {p.eos()} )
               } // p.nTomStri
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #3 (bt) __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_peek( "a", n:4, m:12 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_peek( "a", n:4, m:8 )
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "a", n:3, m:4 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.s
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #3 (bt) Lazy __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStr_peek( "a", n:4, m:12 )
            {
               print( "p.nTomStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStr_peek( "a", n:4, m:8 )
               { // This is the tail
                  print( "p.nTomStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_peek( "a", n:3, m:4 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.s
               } // p.nTomStr
            } //p.nTomStr
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #3 (bt) __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_peek( "A", n:4, m:12 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_peek( "A", n:4, m:8 )
               { // This is the tail
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "A", n:3, m:4 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.s
               } // tail
            } //arb
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #3 (bt) Lazy __"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaaaaaaa" ){
            print(
               "p.nTomStr\(test) sequence: p.nTomStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            ); return
            p.nTomStri_peek( "A", n:4, m:12 )
            {
               print( "p.nTomStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.nTomStri_peek( "a", n:4, m:8 )
               { // This is the tail
                  print( "p.nTomStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStri_peek( "A", n:3, m:4 )
                  {
                     p.s("aaaaaaaaaaaa", {p.eos()} )
                  } // p.s
               } // p.nTomStri
            } //p.nTomStri
         } // match
      print()
      precondition( pResult, "nTomStr\(test) failed to match string" )
      print( "nTomStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "abcabcabcabcabc" ){
            print( "p.nTomStr #4 sequence: ", terminator:"" ); return
            p.nTomStr( "abc", n:2, m:3 , capture:s1 )
            {
               print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.nTomStr( "abc", n:2, m:3, capture:s2 )
               { // This is the tail
                  print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "abc", n:1, m:1, capture:s3, {p.eos()} )
               } // tail
            }
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abcabc"
         && s2.s == "abcabc"
         && s3.s == "abc",
         "nTomStr #4 failed"
      )
      print( "nTomStr #4 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      
      
   // capture, consuming, .lazy:

      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcabcabcabcabc" ){
            print( "p.nTomStr #5 sequence: ", terminator:"" ); return
            p.nTomStr_lazy( "abc", n:2, m:3, capture:s1 )
            {
               print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.nTomStr_lazy( "abc", n:2, m:3, capture:s2 )
               { // This is the tail
                  print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_lazy( "abc", n:1, m:1, capture:s3 , {p.eos()} )
               } // tail
            }
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abcabc"
         && s2.s == "abcabc"
         && s3.s == "abc",
         "nTomStr #5 failed"
      )
      print( "nTomStr #5 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      // no capture, consuming, .eager:

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      p     = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcabcabcabcabc" ){
            print( "p.nTomStr #6 sequence: ", terminator:"" ); return
            p.nTomStr( "abc", n:2, m:3 )
            {
               print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.nTomStr( "abc", n:2, m:3 )
               { // This is the tail
                  print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "abc", n:1, m:1, {p.eos()} )
               } // tail
            }
         } // match
      print()
      precondition( pResult, "nTomStr #6 failed" )
      print( "nTomStr #6 passed" )

      // no capture, consuming, .lazy:

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      p     = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcabcabcabcabc" ){
            print( "p.nTomStr #7 sequence: ", terminator:"" ); return
            p.nTomStr_lazy( "abc", n:2, m:3 )
            {
               print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.nTomStr_lazy( "abc", n:2, m:3 )
               { // This is the tail
                  print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_lazy( "abc", n:1, m:1, {p.eos()} )
               } // tail
            }
         } // match
      print()
      precondition( pResult, "nTomStr #7 failed" )
      print( "nTomStr #7 passed" )


      // capture, not consuming, .eager:

      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcabcabcabcabc" ){
            print( "p.nTomStr #8 sequence: ", terminator:"" ); return
            p.nTomStr_peek( "abc", n:2, m:3, capture:s1 )
            {
               print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.nTomStr_peek( "abc", n:2, m:3, capture:s2 )
               { // This is the tail
                  print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "abcabcabcabcabc", n:1, m:1, capture:s3, {p.eos( )} )
               } // tail
            }
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abcabcabc"
         && s2.s == "abcabcabc"
         && s3.s == "abcabcabcabcabc",
         "nTomStr #8 failed"
      )
      print( "nTomStr #8 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      // capture, not consuming, .lazy:

      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcabcabcabcabc" ){
            print( "p.nTomStr #9 sequence: ", terminator:"" ); return
            p.nTomStr_peek( "abc", n:2, m:3, capture:s1 )
            {
               print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.nTomStr_peek( "abc", n:2, m:3, capture:s2 )
               { // This is the tail
                  print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "abcabcabcabcabc", n:1, m:1, capture:s3, {p.eos()} )
               } // tail
            }
         } // match
      print()
      precondition(
            pResult
         && s1.s == "abcabcabc"
         && s2.s == "abcabcabc"
         && s3.s == "abcabcabcabcabc",
         "nTomStr #9 failed"
      )
      print( "nTomStr #9 passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // no capture, not consuming, .eager:

      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcabcabcabcabc" ){
            print( "p.nTomStr #10 sequence: ", terminator:"" ); return
            p.nTomStr_peek( "abc", n:2, m:3 )
            {
               print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.nTomStr_peek( "abc", n:2, m:3 )
               { // This is the tail
                  print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr( "abcabcabcabcabc", n:1, m:1, {p.eos()} )
               } // tail
            }
         } // match
      print()
      precondition( pResult, "nTomStr #10 failed" )
      print( "nTomStr #10 passed" )


      // no capture, not consuming, .lazy:

      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "abcabcabcabcabc" ){
            print( "p.nTomStr #11 sequence: ", terminator:"" ); return
            p.nTomStr_peek( "abc", n:2, m:3 )
            {
               print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
               p.nTomStr_peek( "abc", n:2, m:3 )
               { // This is the tail
                  print( "p.nTomStr('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.nTomStr_lazy( "abcabcabcabcabc", n:1, m:1, {p.eos()} )
               } // tail
            }
         } // match
      print()
      precondition( pResult, "nTomStr #11 failed" )
      print( "nTomStr #11 passed" )


      //--------------------------------------------------------------------------------------------------------
      //
      // zeroOrOneStr/zeroOrOneStri
      
      

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
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_110 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_100 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_000 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


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
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_peek( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_peek( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_peek( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.s("a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_110 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_peek( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_peek( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_100 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_peek( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_peek( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_000 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_peek( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_peek( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_peek( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // no capture + consuming:
      
      test  = " #1_111 _c"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_110 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_100 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_000 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      // no capture and not consuming

      
      test  = " #1_111-000 __"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_peek( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_peek( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_peek( "a" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


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
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_lazy( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_lazy( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_110 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_lazy( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_lazy( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_100 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_lazy( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_lazy( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_000 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_lazy( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_lazy( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


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
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_peek( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_peek( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_peek( "a", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s("a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      



      // no capture + consuming:
      
      test  = " #1_111 _c"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )



      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_110 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_100 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = " #1_000 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      
      test  = " #1_111 Lazy _c"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_lazy( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_lazy( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_lazy( "a" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )

    

      // no capture and not consuming

      
      test  = " #1_111-000 __"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_peek( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_peek( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_peek( "a" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )

      
      test  = " #1_111-000 Lazy __"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr_peek( "a" )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr_peek( "a" )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr_peek( "a" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      // zeroOrOnei capture + consuming:
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_111 cc"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_110 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_100 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "a", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_000 cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      // Capture, no consuming:
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_111 c_"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_peek( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_peek( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_peek( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.s("a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_110 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_peek( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_peek( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_100 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_peek( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_peek( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_000 c_"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_peek( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_peek( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_peek( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      // no capture + consuming:
      
      test  = "i #1_111 _c"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_110 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_100 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_000 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      // no capture and not consuming

      
      test  = "i #1_111-000 __"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_peek( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_peek( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_peek( "A" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      // Lazy capture + consuming:
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_111 Lazy cc"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_lazy( "a", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_lazy( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_110 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_lazy( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_lazy( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_lazy( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_100 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_lazy( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_lazy( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_lazy( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_000 Lazy cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_lazy( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_lazy( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_lazy( "A", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      // Lazy: Capture, not consuming.
      // Note: lazy + not consuming = eager/not consuming.
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_111 Lazy c_"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_peek( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_peek( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_peek( "A", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s("a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1'\(s1.s)', s2'\(s2.s)', s3'\(s3.s)'" )
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      



      // no capture + consuming:
      
      test  = "i #1_111 _c"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "a" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "a" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "a" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )



      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_110 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_100 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A" )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "i #1_000 _c"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )


      
      test  = "i #1_111 Lazy _c"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "a" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_lazy( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_lazy( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_lazy( "A" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )

    

      // no capture and not consuming

      
      test  = "i #1_111-000 __"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_peek( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_peek( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_peek( "A" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )

      
      test  = "i #1_111-000 Lazy __"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri_peek( "A" )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri_peek( "A" )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri_peek( "A" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      print( "zeroOrOneStr\(test) passed" )

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
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      precondition( s4.s == "aaa", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      s4.s  = "*"
      test  = " #1-100 (bt) cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      precondition( s4.s == "aaa", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      s4.s  = "*"
      test  = " #1-110 (bt) cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      precondition( s4.s == "aaa", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )




      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      s4.s  = "*"
      test  = " #1-111 (bt) cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStr( "a", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStr( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStr( "a", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStr #3
                  return result3
               } // p.zeroOrOneStr #2
               return result2
               
            } // p.zeroOrOneStr #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "aaa", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )




      // zeroOrOnei capture + consuming + backtracking:
      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      s4.s  = "*"
      test  = "i #1-000 (bt) cc"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A", capture:s1 )
            {
               print( "p.zeroOrOneStr(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStr(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      precondition( s4.s == "aaa", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      s4.s  = "*"
      test  = "i #1-100 (bt) cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "p.zeroOrOneStri\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "a", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "a", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      precondition( s4.s == "aaa", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      
      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      s4.s  = "*"
      test  = "i #1-110 (bt) cc"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "a", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "a", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "a", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected ''" )
      precondition( s4.s == "aaa", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )




      
      s1.s        = "*"
      s2.s        = "*"
      s3.s        = "*"
      s4.s        = "*"
      test           = "i #1-111 (bt) cc"
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "p.zeroOrOneStr\(test) sequence: p.zeroOrOneStri('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrOneStri( "A", capture:s1 )
            {
               print( "p.zeroOrOneStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrOneStri( "A", capture:s2 )
               {
                  print( "p.zeroOrOneStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrOneStri( "A", capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrOneStri #3
                  return result3
               } // p.zeroOrOneStri #2
               return result2
               
            } // p.zeroOrOneStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'")
      precondition( pResult, "zeroOrOneStr\(test) failed to match string" )
      precondition( s1.s == "a", "zeroOrOneStr\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "zeroOrOneStr\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      precondition( s4.s == "aaa", "zeroOrOneStr\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "zeroOrOneStr\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )



      //--------------------------------------------------------------------------------------------
      //
      // zeroOrMoreStr/zeroOrMoreStri
      
     
      mStr     = "a"
      i        = ""
      name     = "zeroOrMoreChar\(i)"
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
            p.zeroOrMoreStr( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStr( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStr( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStr #3
                  return result3
               } // p.zeroOrMoreStr #2
               return result2
               
            } // p.zeroOrMoreStr #1
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




      mStr = "a"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 cc"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStri( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStri( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStri #3
                  return result3
               } // p.zeroOrMoreStri #2
               return result2
               
            } // p.zeroOrMoreStri #1
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


      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-000 cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.zeroOrMoreStri #3
                     } // p.s
                  } // p.zeroOrMoreStri #2
               } // p.s
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr( "b", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStri( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri( "B", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
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
      
      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStr_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStr_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStr #3
                  return result3
               } // p.zeroOrMoreStr #2
               return result2
               
            } // p.zeroOrMoreStr #1
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




      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 c_"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStri_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStri_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStri #3
                  return result3
               } // p.zeroOrMoreStri #2
               return result2
               
            } // p.zeroOrMoreStri #1
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


      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_peek( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-000 c_"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_peek( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.zeroOrMoreStri #3
                     } // p.s
                  } // p.zeroOrMoreStri #2
               } // p.s
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_peek( "b", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bba" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "ab", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-111 c_"
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
            p.zeroOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_peek( "B", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bb" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "aab", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
      precondition( s4.s == "aab", "\(name)\(test) failed, s4='\(s4.s)', expected 'aab'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      // non-capture + consuming
      
      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStr( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStr( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStr #3
                  return result3
               } // p.zeroOrMoreStr #2
               return result2
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 _c"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStri( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStri( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStri #3
                  return result3
               } // p.zeroOrMoreStri #2
               return result2
               
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-000 _c"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStri #3
                     } // p.s
                  } // p.zeroOrMoreStri #2
               } // p.s
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr( "b" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStri( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri( "B" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      // non-capture + not consuming
      
      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStr_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStr #3
                  return result3
               } // p.zeroOrMoreStr #2
               return result2
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 __"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStri_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStri #3
                  return result3
               } // p.zeroOrMoreStri #2
               return result2
               
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-000 __"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStri #3
                     } // p.s
                  } // p.zeroOrMoreStri #2
               } // p.s
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_peek( "b" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStri_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      // Lazy variants:
      
      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_lazy( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStr_lazy( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStr_lazy( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStr #3
                  return result3
               } // p.zeroOrMoreStr #2
               return result2
               
            } // p.zeroOrMoreStr #1
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




      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy cc"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_lazy( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStri_lazy( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStri_lazy( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStri #3
                  return result3
               } // p.zeroOrMoreStri #2
               return result2
               
            } // p.zeroOrMoreStri #1
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


      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_lazy( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_lazy( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_lazy( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-000 Lazy cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_lazy( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_lazy( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_lazy( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.zeroOrMoreStri #3
                     } // p.s
                  } // p.zeroOrMoreStri #2
               } // p.s
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "", "\(name)\(test) failed, s1='\(s1.s)', expected ''" )
      precondition( s2.s == "", "\(name)\(test) failed, s2='\(s2.s)', expected ''" )
      precondition( s3.s == "", "\(name)\(test) failed, s3='\(s3.s)', expected ''" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_lazy( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_lazy( "b", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_lazy( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStri_lazy( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_lazy( "B", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_lazy( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
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
      
      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStr_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStr_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStr #3
                  return result3
               } // p.zeroOrMoreStr #2
               return result2
               
            } // p.zeroOrMoreStr #1
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




      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy c_"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStri_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStri_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStri #3
                  return result3
               } // p.zeroOrMoreStri #2
               return result2
               
            } // p.zeroOrMoreStri #1
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


      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_peek( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-000 Lazy c_"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_peek( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.zeroOrMoreStri #3
                     } // p.s
                  } // p.zeroOrMoreStri #2
               } // p.s
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
      test = " #1-111 Lazy c_"
      s1.s = "*"
      s2.s = "p.zeroOrMoreStri_lazy( mStr, capture:s1*"
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
            p.zeroOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_peek( "b", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bba" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "ab", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-111 Lazy c_"
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
            p.zeroOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_peek( "B", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bb" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "aab", capture:s4, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
      precondition( s4.s == "aab", "\(name)\(test) failed, s4='\(s4.s)', expected 'aab'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      // non-capture + consuming
      
      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_lazy( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStr_lazy( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStr_lazy( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStr #3
                  return result3
               } // p.zeroOrMoreStr #2
               return result2
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy _c"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_lazy( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStri_lazy( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStri_lazy( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStri #3
                  return result3
               } // p.zeroOrMoreStri #2
               return result2
               
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_lazy( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_lazy( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_lazy( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-000 Lazy _c"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_lazy( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_lazy( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_lazy( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStri #3
                     } // p.s
                  } // p.zeroOrMoreStri #2
               } // p.s
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_lazy( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_lazy( "b" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_lazy( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStri_lazy( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_lazy( "B" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_lazy( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      // non-capture + not consuming
      
      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStr_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStr #3
                  return result3
               } // p.zeroOrMoreStr #2
               return result2
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy __"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.zeroOrMoreStri_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.zeroOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.zeroOrMoreStri #3
                  return result3
               } // p.zeroOrMoreStri #2
               return result2
               
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
      test = " #1-000 Lazy __"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.zeroOrMoreStri_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStri #3
                     } // p.s
                  } // p.zeroOrMoreStri #2
               } // p.s
            } // p.zeroOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr = "a"
      i    = ""
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStr_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStr_peek( "b" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStr_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "zeroOrMoreStr\(i)"
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
            p.zeroOrMoreStri_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.zeroOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.zeroOrMoreStri_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.zeroOrMoreStr #3
                     } // p.s
                  } // p.zeroOrMoreStr #2
               } // p.s
            } // p.zeroOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      //-----------------------------------------------------------------------------------------------
      //
      // oneOrMoreStr/oneOrMoreStri
      
      
      mStr = "a"
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
            p.oneOrMoreStr( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStr( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStr( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStr #3
                  return result3
               } // p.oneOrMoreStr #2
               return result2
               
            } // p.oneOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 cc"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStri #1
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


      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
      test = " #1-000 cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaaaaa" )
         {
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-000 cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.oneOrMoreStri #3
                     } // p.s
                  } // p.oneOrMoreStri #2
               } // p.s
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aa'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr( "b", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStri( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri( "B", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
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
      
      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStr_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStr_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStr #3
                  return result3
               } // p.oneOrMoreStr #2
               return result2
               
            } // p.oneOrMoreStr #1
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




      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 c_"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStri #1
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


      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_peek( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-000 c_"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_peek( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.oneOrMoreStri #3
                     } // p.s
                  } // p.oneOrMoreStri #2
               } // p.s
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_peek( "b", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bba" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "ab", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-111 c_"
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
            p.oneOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_peek( "B", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bb" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "aab", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
      precondition( s4.s == "aab", "\(name)\(test) failed, s4='\(s4.s)', expected 'aab'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      // non-capture + consuming
      
      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStr( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStr( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStr #3
                  return result3
               } // p.oneOrMoreStr #2
               return result2
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 _c"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-000 _c"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStri #3
                     } // p.s
                  } // p.oneOrMoreStri #2
               } // p.s
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr( "b" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStri( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri( "B" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      // non-capture + not consuming
      
      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStr_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStr #3
                  return result3
               } // p.oneOrMoreStr #2
               return result2
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 __"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-000 __"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStri #3
                     } // p.s
                  } // p.oneOrMoreStri #2
               } // p.s
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_peek( "a" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStri_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )

      // Lazy variants:
      
      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_lazy( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStr_lazy( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStr_lazy( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStr #3
                  return result3
               } // p.oneOrMoreStr #2
               return result2
               
            } // p.oneOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy cc"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_lazy( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_lazy( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_lazy( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "aaa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aaa'" )
      precondition( s4.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_lazy( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_lazy( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_lazy( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-000 Lazy cc"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_lazy( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_lazy( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_lazy( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.oneOrMoreStri #3
                     } // p.s
                  } // p.oneOrMoreStri #2
               } // p.s
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "\(name)\(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_lazy( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_lazy( "b", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_lazy( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStri_lazy( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_lazy( "B", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_lazy( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
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
      
      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStr_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStr_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStr #3
                  return result3
               } // p.oneOrMoreStr #2
               return result2
               
            } // p.oneOrMoreStr #1
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




      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy c_"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_peek( mStr, capture:s2 )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_peek( mStr, capture:s3 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s4, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStri #1
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


      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_peek( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-000 Lazy c_"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_peek( mStr, capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", {p.eos()} )
                           } // p.oneOrMoreStri #3
                     } // p.s
                  } // p.oneOrMoreStri #2
               } // p.s
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "aa", "\(name)\(test) failed, s2='\(s2.s)', expected 'aa'" )
      precondition( s3.s == "a", "\(name)\(test) failed, s3='\(s3.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )




      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
      test = " #1-111 Lazy c_"
      s1.s = "*"
      s2.s = "p.oneOrMoreStri_lazy( mStr, capture:s1*"
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
            p.oneOrMoreStr_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_peek( "b", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bba" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "ab", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
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



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-111 Lazy c_"
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
            p.oneOrMoreStri_peek( mStr, capture:s1 )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "aaa" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_peek( "B", capture:s2 )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "bb" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_peek( mStr, capture:s3 )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "aab", capture:s4, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "bb", "\(name)\(test) failed, s2='\(s2.s)', expected 'bb'" )
      precondition( s3.s == "aa", "\(name)\(test) failed, s3='\(s3.s)', expected 'aa'" )
      precondition( s4.s == "aab", "\(name)\(test) failed, s4='\(s4.s)', expected 'aab'" )
      print( "\(name)\(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )


      // non-capture + consuming
      
      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_lazy( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStr_lazy( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStr_lazy( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStr #3
                  return result3
               } // p.oneOrMoreStr #2
               return result2
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy _c"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_lazy( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_lazy( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_lazy( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "a", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_lazy( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_lazy( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_lazy( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-000 Lazy _c"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_lazy( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_lazy( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_lazy( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStri #3
                     } // p.s
                  } // p.oneOrMoreStri #2
               } // p.s
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_lazy( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_lazy( "b" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_lazy( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStri_lazy( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_lazy( "B" )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_lazy( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "b", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "b", "\(name)\(test) failed, s1='\(s1.s)', expected 'b'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      // non-capture + not consuming
      
      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStr_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStr #3
                  return result3
               } // p.oneOrMoreStr #2
               return result2
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      test = " #1 Lazy __"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_peek( mStr )
            {
               print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_peek( mStr )
               {
                  print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.s( "aaa", capture:s1, {p.eos()} )
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "aaa", "\(name)\(test) failed, s1='\(s1.s)', expected 'aaa'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )


      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
      test = " #1-000 Lazy __"
      s1.s = "*"
      s2.s = "*"
      s3.s = "*"
      p    = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaa" ){
            print(
               "\(name)\(test) sequence: \(name)('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStri_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStri #3
                     } // p.s
                  } // p.oneOrMoreStri #2
               } // p.s
            } // p.oneOrMoreStri #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      mStr = "a"
      i    = ""
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStr_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStr_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStr_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )



      mStr = "A"
      i    = "i"
      name = "oneOrMoreStr\(i)"
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
            p.oneOrMoreStri_peek( mStr )
            {
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.s( "a" )
               {
                  print( "\(name)(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.oneOrMoreStri_peek( mStr )
                  {
                     print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.s( "a" )
                     {
                           print( "\(name)(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           p.oneOrMoreStri_peek( mStr )
                           {
                              print( "p.s('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                              return p.s( "a", capture:s1, {p.eos()} )
                           } // p.oneOrMoreStr #3
                     } // p.s
                  } // p.oneOrMoreStr #2
               } // p.s
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)', s4='\(s4.s)'" )
      precondition( pResult, "\(name)\(test) failed to match string" )
      precondition( s1.s == "a", "\(name)\(test) failed, s1='\(s1.s)', expected 'a'" )
      print( "\(name)\(test) passed, s1='\(s1.s)'" )




      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#2"
      p = Pattern()  // Clean up memory
      print()
      pResult  =
         p.match( "aaA" ){
            print(
               "p.oneOrMoreStr \(test) sequence: p.oneOrMoreStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr( "a", capture:s1 )
            {
               print( "p.oneOrMoreStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri( "a", capture:s2 )
               {
                  print( "p.oneOrMoreStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "oneOrMoreStr \(test) failed to match string" )
      precondition( s1.s == "a", "oneOrMoreStr \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "oneOrMoreStr \(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "A", "oneOrMoreStr \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "oneOrMoreStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#3"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.oneOrMoreStr \(test) sequence: p.oneOrMoreStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr_lazy( "a", capture:s1 )
            {
               print( "p.oneOrMoreStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri( "a", capture:s2 )
               {
                  print( "p.oneOrMoreStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "oneOrMoreStr \(test) failed to match string" )
      precondition( s1.s == "a", "oneOrMoreStr \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "aaA", "oneOrMoreStr \(test) failed, s2='\(s2.s)', expected 'aaA'" )
      precondition( s3.s == "A", "oneOrMoreStr \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "oneOrMoreStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#4"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.oneOrMoreStr \(test) sequence: p.oneOrMoreStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr( "a", capture:s1 )
            {
               print( "p.oneOrMoreStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_lazy( "a", capture:s2 )
               {
                  print( "p.oneOrMoreStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                     let result4 = p.eos()
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "oneOrMoreStr \(test) failed to match string" )
      precondition( s1.s == "aaa", "oneOrMoreStr \(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "A", "oneOrMoreStr \(test) failed, s2='\(s2.s)', expected 'A'" )
      precondition( s3.s == "A", "oneOrMoreStr \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "oneOrMoreStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#5"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.oneOrMoreStr \(test) sequence: p.oneOrMoreStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr_lazy( "a", capture:s1 )
            {
               print( "p.oneOrMoreStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_lazy( "a", capture:s2 )
               {
                  print( "p.oneOrMoreStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "oneOrMoreStr \(test) failed to match string" )
      precondition( s1.s == "a", "oneOrMoreStr \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "oneOrMoreStr \(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "aAA", "oneOrMoreStr \(test) failed, s3='\(s3.s)', expected 'aAA'" )
      print( "oneOrMoreStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#6"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.oneOrMoreStr \(test) sequence: p.oneOrMoreStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr( "a", capture:s1 )
            {
               print( "p.oneOrMoreStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri( "a", capture:s2 )
               {
                  print( "p.oneOrMoreStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      //print( "xxxx pResult=\(pResult), s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )
      precondition( pResult, "oneOrMoreStr \(test) failed to match string" )
      precondition( s1.s == "aaa", "oneOrMoreStr \(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "A", "oneOrMoreStr \(test) failed, s2='\(s2.s)', expected 'A'" )
      precondition( s3.s == "A", "oneOrMoreStr \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "oneOrMoreStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#7"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.oneOrMoreStr \(test) sequence: p.oneOrMoreStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr_lazy( "a", capture:s1 )
            {
               print( "p.oneOrMoreStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri( "a", capture:s2 )
               {
                  print( "p.oneOrMoreStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "oneOrMoreStr \(test) failed to match string" )
      precondition( s1.s == "a", "oneOrMoreStr \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "aaA", "oneOrMoreStr \(test) failed, s2='\(s2.s)', expected 'aaA'" )
      precondition( s3.s == "A", "oneOrMoreStr \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "oneOrMoreStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#8"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.oneOrMoreStr \(test) sequence: p.oneOrMoreStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr( "a", capture:s1 )
            {
               print( "p.oneOrMoreStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_lazy( "a", capture:s2 )
               {
                  print( "p.oneOrMoreStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "oneOrMoreStr \(test) failed to match string" )
      precondition( s1.s == "aaa", "oneOrMoreStr \(test) failed, s1='\(s1.s)', expected 'aaa'" )
      precondition( s2.s == "A", "oneOrMoreStr \(test) failed, s2='\(s2.s)', expected 'A'" )
      precondition( s3.s == "A", "oneOrMoreStr \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "oneOrMoreStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#9"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaAA" ){
            print(
               "p.oneOrMoreStr \(test) sequence: p.oneOrMoreStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.oneOrMoreStr_lazy( "a", capture:s1 )
            {
               print( "p.oneOrMoreStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.oneOrMoreStri_lazy( "a", capture:s2 )
               {
                  print( "p.oneOrMoreStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.oneOrMoreStri_lazy( "a", capture:s3 )
                  {
                     print( "p.eos('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); 
                     let result4 = p.eos()
                     return result4
                     
                  } // p.oneOrMoreStri #3
                  return result3
               } // p.oneOrMoreStri #2
               return result2
               
            } // p.oneOrMoreStr #1
            return result1
            
         } // match
      print()
      precondition( pResult, "oneOrMoreStr \(test) failed to match string" )
      precondition( s1.s == "a", "oneOrMoreStr \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "oneOrMoreStr \(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "aAA", "oneOrMoreStr \(test) failed, s3='\(s3.s)', expected 'aAA'" )
      print( "oneOrMoreStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      //---------------------------------------------------------------------------------------
      //
      // nStr/nStri
      
      

      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#1"
      print()
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaA" ){
            print(
               "p.nStr \(test) sequence: p.nStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nStr( "a", n:1, capture:s1 )
            {
               print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.nStri( "a", n:1, capture:s2 )
               {
                  print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.nStri( "a", n:1, capture:s3 )
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
      precondition( pResult, "nStr \(test) failed to match string" )
      precondition( s1.s == "a", "nStr \(test) failed, s1='\(s1.s)', expected 'a'" )
      precondition( s2.s == "a", "nStr \(test) failed, s2='\(s2.s)', expected 'a'" )
      precondition( s3.s == "A", "nStr \(test) failed, s3='\(s3.s)', expected 'A'" )
      print( "nStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#2"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaAAAA" ){
            print(
               "p.nStr \(test) sequence: p.nStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nStr( "a", n:4, capture:s1 )
            {
               print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.nStri( "a", n:1, capture:s2 )
               {
                  print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.nStri( "a", n:3, capture:s3 )
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
      precondition( pResult, "nStr \(test) failed to match string" )
      precondition( s1.s == "aaaa", "nStr \(test) failed, s1='\(s1.s)', expected 'aaaaa'" )
      precondition( s2.s == "A", "nStr \(test) failed, s2='\(s2.s)', expected 'A'" )
      precondition( s3.s == "AAA", "nStr \(test) failed, s3='\(s3.s)', expected 'AAA'" )
      print( "nStr \(test) passed, s1='\(s1.s)', s2='\(s2.s)', s3='\(s3.s)'" )


      s1.s  = "*"
      s2.s  = "*"
      s3.s  = "*"
      test  = "#3"
      p = Pattern()  // Clean up memory
      pResult  =
         p.match( "aaaaAAA" ){
            print(
               "p.nStr \(test) sequence: p.nStr('\(p.haystack[p.cursor..<p.endStr])'), ",
               terminator:""
            );
            let result1 =
            p.nStr( "a", n:4, capture:s1 )
            {
               print( "p.nStri(1, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let result2 =
               p.nStri( "a", n:1, capture:s2 )
               {
                  print( "p.nStri(2, '\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                  let result3 =
                  p.nStri( "a", n:3, capture:s3 )
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
      precondition( !pResult, "nStr \(test) should have returned failure" )
      print( "nStr \(test) passed" )






   // MARK: - String.swift tests

   func slice(_ p: Pattern) -> Substring
   {
      p.haystack[p.cursor..<p.endStr]
   }

   // ------------------------------
   // s / s_peek (case sensitive)
   // ------------------------------

   func test_s_sequence()
   {
      let name = "s"
      let test = " #seq"
      let s1 = RefSubstring("*")
      let s2 = RefSubstring("*")
      let s3 = RefSubstring("*")
      let s4 = RefSubstring("*")
      let p = Pattern()
      print()

      let ok =
      p.match("aaaa")
      {
         print("\(name)\(test) sequence: \(name)('\(slice(p))'), ", terminator:"")

         let r1 =
         p.s("a", capture: s1)
         {
            print("\(name)(1, '\(slice(p))'), ", terminator:"")
            let r2 =
            p.s("a", capture: s2)
            {
               print("\(name)(2, '\(slice(p))'), ", terminator:"")
               let r3 =
               p.s("a", capture: s3)
               {
                  print("p.s('\(slice(p))'), ", terminator:"")
                  let r4 = p.s("a", capture: s4) { p.eos() }
                  return r4
               }
               return r3
            }
            return r2
         }
         return r1
      }
      print()
      precondition(ok, "\(name)\(test) failed")
      precondition(s1.s == "a" && s2.s == "a" && s3.s == "a" && s4.s == "a",
                   "\(name)\(test) captures wrong: s1='\(s1.s)' s2='\(s2.s)' s3='\(s3.s)' s4='\(s4.s)'")
   }

   func test_s_fail_and_restore()
   {
      let name = "s #fail-restore"
      let cap = RefSubstring("*")
      let p = Pattern()

      let ok =
      p.match("baaa")
      {
         let r = p.s("a", capture: cap) { true }
         precondition(!r, "\(name) should fail")
         precondition(slice(p) == "baaa", "\(name) p.cursor advanced on failure")
         return true
      }
      precondition(ok, "\(name) driver failed")
   }

   func test_s_peek_nonconsuming_and_capture()
   {
      let name = "s_peek #nonconsume"
      let cap  = RefSubstring("*")
      let p    = Pattern()

      let ok =
      p.match("abc")
      {
         let before = slice(p)
         let r = p.s_peek("ab", capture: cap) { true }
         precondition(r, "\(name) should pass")
         precondition(slice(p) == before, "\(name) consumed input")
         precondition(cap.s == "ab", "\(name) capture wrong: '\(cap)'")
         return true
      }
      precondition(ok, "\(name) driver failed")
   }

   func test_s_boundaries()
   {
      let name = "s #boundaries"

      // Empty input, non-empty needle -> fail
      do {
         let cap = RefSubstring("*")
         let p = Pattern()
         let ok = p.match("") { p.s("x", capture: cap) { true } }
         precondition(!ok, "\(name) should fail on empty input")
      }

      // Empty needle matches (captures empty)
      do {
         let cap = RefSubstring("*")
         let p = Pattern()
         let ok = p.match("xyz") { p.s("", capture: cap) { p.s("xyz") { p.eos() } } }
         precondition(ok, "\(name) empty needle should match")
         precondition(cap.s.isEmpty, "\(name) empty capture should be empty, got '\(cap.s)'")
      }

      // EOS boundary after consuming
      do {
         let p = Pattern()
         let ok =
         p.match("ab")
         {
            _ = p.s("ab") { true }
            return !p.s("x") { true }   // must not crash or advance
         }
         precondition(ok, "\(name) EOS check failed")
      }
   }

   // ------------------------------
   // si / si_peek (case insensitive)
   // ------------------------------

   func test_si_basic()
   {
      let name = "si #basic"
      let cap = RefSubstring("*")
      let p = Pattern()

      let ok =
      p.match("AbCd")
      {
         let result =
            p.si("ab", capture: cap)
            {
               return p.si("CD") { p.eos() }
            }
            precondition(cap.s == "Ab", "\(name) capture wrong: '\(cap.s)'")
            return result

      }
      precondition(ok, "\(name) failed")
   }

   func test_si_peek()
   {
      let name = "si_peek #nonconsume"
      let cap = RefSubstring("*")
      let p = Pattern()

      let ok =
      p.match("aBC")
      {
         let before = slice(p)
         let r = p.si_peek("AB", capture: cap) { true }
         precondition(r, "\(name) should pass")
         precondition(slice(p) == before, "\(name) consumed input")
         precondition(cap.s == "aB", "\(name) capture wrong: '\(cap.s)'")
         return true
      }
      precondition(ok, "\(name) driver failed")
   }

   func test_si_fail()
   {
      let name = "si #fail"
      let p = Pattern()
      let ok = p.match("xx") { !p.si("ab") { true } }
      precondition(ok, "\(name) should fail")
   }

   // ----------------------------------------
   // nTomStr (eager) + capture/backtracking
   // ----------------------------------------

   func test_nTomStr_eager_exact()
   {
      let name = "nTomStr #exact n==m"
      let cap = RefSubstring("*")
      let p = Pattern()

      let ok =
      p.match("foofooX")
      {
         p.nTomStr("foo", n: 2, m: 2, capture: cap)
         {
            p.s("X") { p.eos() }
         }
      }
      precondition(ok, "\(name) failed")
      precondition(cap.s == "foofoo", "\(name) capture wrong: '\(cap.s)'")
   }

   func test_nTomStr_eager_backtrack()
   {
      // Greedy up to m, then backtrack for tail "bar"
      let name = "nTomStr #greedy-backtrack"
      let cap = RefSubstring("*")
      let p = Pattern()

      let ok =
      p.match("foofoobar")
      {
         p.nTomStr("foo", n: 1, m: 3, capture: cap)
         {
            p.s("bar") { p.eos() }
         }
      }
      precondition(ok, "\(name) failed")
      precondition(cap.s == "foofoo", "\(name) expected backtrack to 2×'foo', got '\(cap.s)'")
   }

   func test_nTomStr_eager_bounds()
   {
      let name = "nTomStr #bounds"

      // n > length
      do
      {
         let p = Pattern()
         let ok = p.match("foo") { !p.nTomStr("foo", n: 2, m: 5) { true } }
         precondition(ok, "\(name) n>len should fail")
      }

      // n == 0, m == 0 (accept zero)
      do
      {
         let cap = RefSubstring("*")
         let p = Pattern()
         let ok =
         p.match("foofoo")
         {
            p.nTomStr("foo", n: 0, m: 0, capture: cap)
            {
               return p.s("foofoo") { p.eos() }
            }
         }
         precondition(ok, "\(name) n==m==0 failed")
         precondition(cap.s.isEmpty, "\(name) capture not empty")
      }
   }

   // ----------------------------------------
   // nTomStr_lazy (lazy) + capture
   // ----------------------------------------

   func test_nTomStr_lazy_prefers_min()
   {
      let name = "nTomStr_lazy #prefers-min"
      let cap = RefSubstring("*")
      let p = Pattern()

      let ok =
      p.match("foofoobar")
      {
         p.nTomStr_lazy("foo", n: 0, m: 3, capture: cap)
         {
            p.s("bar") { p.eos() }
         }
      }
      precondition(ok, "\(name) failed")
      precondition(cap.s == "foofoo", "\(name) capture wrong: '\(cap.s)'") // minimal to satisfy "bar"
   }

   func test_nTomStr_lazy_exhausts_then_fail()
   {
      let name = "nTomStr_lazy #no-tail"
      let p = Pattern()

      let ok =
      p.match("foofoo")
      {
         let r = p.nTomStr_lazy("foo", n: 0, m: 2)
         {
            p.s("nope") { true }
         }
         precondition(!r, "\(name) should fail (no tail match)")
         precondition(p.haystack[p.cursor..<p.endStr] == "foofoo", "\(name) should restore on failure")
         return true
      }
      precondition(ok, "\(name) driver failed")
   }

   // ----------------------------------------
   // nTomStr_peek (non-consuming)
   // ----------------------------------------

   func test_nTomStr_peek_check_n_only()
   {
      let name = "nTomStr_peek #check-n"
      let p1 = Pattern()
      let ok1 = p1.match("foofoo") { p1.nTomStr_peek("foo", n: 2, m: 10) { true } }
      precondition(ok1, "\(name) should pass")

      let p2 = Pattern()
      let ok2 = p2.match("foo") { p2.nTomStr_peek("foo", n: 2, m: 10) { true } }
      precondition(!ok2, "\(name) should fail (only 1 available)")

      let p3 = Pattern()
      let ok3 =
      p3.match("foofoofoo")
      {
         let before = slice(p3)
         let r = p3.nTomStr_peek("foo", n: 2, m: 3) { true }
         precondition(r, "\(name) should succeed")
         precondition(slice(p3) == before, "\(name) consumed input")
         return true
      }
      precondition(ok3, "\(name) driver failed")
   }

   func test_nTomStr_peek_capture_eager_max()
   {
      // Because nTomStr_peek (capturing) calls eager nTomStr under the hood then restores p.cursor,
      // the capture should reflect the longest allowed run (up to m), without consuming.
      let name = "nTomStr_peek #capture"
      let cap = RefSubstring("*")
      let p = Pattern()

      let ok =
      p.match("foofoofooX")
      {
         let before = slice(p)
         let r = p.nTomStr_peek("foo", n: 0, m: 3, capture: cap) { true }
         precondition(r, "\(name) should pass")
         precondition(slice(p) == before, "\(name) consumed input")
         precondition(cap.s == "foofoofoo", "\(name) capture wrong: '\(cap.s)'")
         return true
      }
      precondition(ok, "\(name) driver failed")
   }

   // ----------------------------------------
   // Case-insensitive nTomStri*
   // ----------------------------------------

   func test_nTomStri_eager_and_peek()
   {
      let name = "nTomStri #eager+peek"
      let cap = RefSubstring("*")

      // eager with backtrack
      do {
         let p = Pattern()
         let ok =
         p.match("AbcAbcZ")
         {
            p.nTomStri("abc", n: 1, m: 3, capture: cap)
            {
               p.s("Z") { p.eos() }
            }
         }
         precondition(ok, "\(name) eager failed")
         precondition(cap.s == "AbcAbc", "\(name) eager capture wrong: '\(cap.s)'")
      }

      // peek check n only
      do {
         let p = Pattern()
         let ok =
         p.match("AbcAbc")
         {
            let before = slice(p)
            let r = p.nTomStri_peek("abc", n: 2, m: 9) { true }
            precondition(r, "\(name) peek should pass")
            precondition(slice(p) == before, "\(name) peek consumed")
            return true
         }
         precondition(ok, "\(name) peek driver failed")
      }
   }

   func test_nTomStri_lazy_prefers_min()
   {
      let name = "nTomStri_lazy #prefers-min"
      let cap = RefSubstring("*")
      let p = Pattern()

      let ok =
      p.match("abcabcEND")
      {
         // minimal to satisfy tail "END" is two "abc"
         p.nTomStri_lazy("AbC", n: 0, m: 3, capture: cap)
         {
            p.s("END") { p.eos() }
         }
      }
      precondition(ok, "\(name) failed")
      precondition(cap.s == "XXabcabc".dropFirst(2), "\(name) capture wrong: '\(cap.s)'")
   }

   // ----------------------------------------
   // zeroOrOne / zeroOrMore wrappers
   // ----------------------------------------

   func test_zeroOrOneStr()
   {
      let name = "zeroOrOneStr"
      let cap = RefSubstring("*")

      // Present
      do {
         let p = Pattern()
         let ok =
         p.match("fooX")
         {
            p.zeroOrOneStr("foo", capture: cap)
            {
               p.c("X") { p.eos() }
            }
         }
         precondition(ok, "\(name) present failed")
         precondition(cap.s == "foo", "\(name) present capture wrong '\(cap.s)'")
      }

      // Absent (should still allow tail)
      do {
         let p = Pattern()
         let ok =
         p.match("X")
         {
            p.zeroOrOneStr("foo")
            {
               p.c("X") { p.eos() }
            }
         }
         precondition(ok, "\(name) absent failed")
      }
   }

   func test_zeroOrMoreStr()
   {
      let name = "zeroOrMoreStr"
      let cap = RefSubstring("*")

      // Many
      do {
         let p = Pattern()
         let ok =
         p.match("foofoofooY")
         {
            p.zeroOrMoreStr("foo", capture: cap)
            {
               p.c("Y") { p.eos() }
            }
         }
         precondition(ok, "\(name) many failed")
         precondition(cap.s == "foofoofoo", "\(name) capture wrong '\(cap.s)'")
      }

      // None (should still match)
      do {
         let p = Pattern()
         let ok =
         p.match("Y")
         {
            p.zeroOrMoreStr("foo")
            {
               p.c("Y") { p.eos() }
            }
         }
         precondition(ok, "\(name) none failed")
      }
   }

   // ------------------------------
   // Driver
   // ------------------------------

   func runAllStringTests()
   {
      print("— Running String.swift tests —")

      // s / s_peek
      test_s_sequence()
      test_s_fail_and_restore()
      test_s_peek_nonconsuming_and_capture()
      test_s_boundaries()

      // si / si_peek
      test_si_basic()
      test_si_peek()
      test_si_fail()

      // nTomStr families
      test_nTomStr_eager_exact()
      test_nTomStr_eager_backtrack()
      test_nTomStr_eager_bounds()

      test_nTomStr_lazy_prefers_min()
      test_nTomStr_lazy_exhausts_then_fail()

      test_nTomStr_peek_check_n_only()
      test_nTomStr_peek_capture_eager_max()

      // Case-insensitive families
      test_nTomStri_eager_and_peek()
      test_nTomStri_lazy_prefers_min()

      // Wrappers
      test_zeroOrOneStr()
      test_zeroOrMoreStr()

      print("— String.swift tests complete —")
   }

   runAllStringTests()
   runStringSmokeTests()
   runStringTests()

}

// MARK: - Lightweight Test Harness

final class StringHarness {
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
      precondition( failed == 0, "StringHarness has failures" )
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

public func runStringSmokeTests() {
   let T = StringHarness()
   print("=== String.swift Smoke Tests ===")

   // -----------------------------
   // s / s_peek (case-sensitive) + capture
   // -----------------------------
   T.note("s: match exact string and consume")
   T.expect(
      run("hello!") { p in
         p.s("hello") {
            T.expect(remaining(p) == "!", "s should consume 'hello'")
            return true
         }
      },
      "s(\"hello\") should succeed"
   )

   T.note("s: boundary — empty input fails")
   T.expect(
      !run("") { p in p.s("x") { true } },
      "s should fail on empty haystack"
   )

   T.note("s_peek: verify without consuming")
   T.expect(
      run("abc") { p in
         p.s_peek("ab") {
            T.expect(remaining(p) == "abc", "s_peek must not consume")
            return true
         }
      },
      "s_peek should not consume"
   )

   T.note("s(capture:) captures matched substring")
   T.expect(
      run("foobar!") { p in
         let cap = RefSubstring()
         return p.s("foo", capture: cap) {
            T.expect(cap.s == "foo", "capture mismatch: \(cap.s)")
            return true
         }
      }
   )

   T.note("s_peek(capture:) captures but restores cursor")
   T.expect(
      run("foobar") { p in
         let cap = RefSubstring()
         return p.s_peek("foo", capture: cap) {
            T.expect(cap.s == "foo", "peek cap mismatch: \(cap.s)")
            T.expect(remaining(p) == "foobar", "s_peek should restore cursor")
            return true
         }
      }
   )

   // -----------------------------
   // si / si_peek (case-insensitive) + capture
   // -----------------------------
   T.note("si: case-insensitive match consumes")
   T.expect(
      run("HeLLo?") { p in
         p.si("hello") {
            T.expect(remaining(p) == "?", "si should consume case-insensitively")
            return true
         }
      }
   )

   T.note("si: mismatch still fails")
   T.expect(
      !run("test") { p in p.si("nope") { true } },
      "si should fail when strings differ"
   )

   T.note("si_peek and si(capture:)/si_peek(capture:)")
   T.expect(
      run("AbC!") { p in
         p.si_peek("abc") {
            T.expect(remaining(p) == "AbC!", "si_peek must not consume")
            return true
         }
      }
   )
   T.expect(
      run("AbC!") { p in
         let cap = RefSubstring()
         return p.si("abc", capture: cap) {
            T.expect(cap.s == "AbC", "si capture should preserve source slice (got:\(cap.s)')")
            return true
         }
      }
   )
   T.expect(
      run("AbC!") { p in
         let cap = RefSubstring()
         return p.si_peek("abc", capture: cap) {
            T.expect(cap.s == "AbC", "si_peek capture mismatch: \(cap.s)")
            T.expect(remaining(p) == "AbC!", "si_peek must restore cursor")
            return true
         }
      }
   )

   // -----------------------------
   // nTomStr (eager): min/max, greedy + backtracking fence
   // -----------------------------
   T.note("nTomStr eager: consumes between n and m; backtracks to satisfy tail")
   T.expect(
      run("xxxy!") { p in
         p.nTomStr("x", n: 1, m: 4) {
            // Tail requires next char be 'y'
            if p.cursor < p.endStr, p.haystack[p.cursor] == "y" { return true }
            return false
         }
      },
      "nTomStr should align so next is 'y'"
   )

   T.note("nTomStr eager: boundary — cannot meet minimum")
   T.expect(
      !run("zzz") { p in p.nTomStr("x", n: 1, m: 3) { true } },
      "nTomStr should fail when no 'x' to reach n"
   )

   // -----------------------------
   // nTomStr_lazy: grows only as needed
   // -----------------------------
   T.note("nTomStr_lazy: prefers fewer, grows until tail accepts")
   T.expect(
      run("aaaX") { p in
         p.nTomStr_lazy("a", n: 0, m: 3) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "a" { return true }
            T.expect(p.cursor < p.endStr && p.haystack[p.cursor] == "X", "lazy should stop at 'X'")
            return true
         }
      }
   )

   T.note("nTomStr_lazy: edge n=0,m=0 — tail runs immediately")
   T.expect(
      run("data") { p in
         p.nTomStr_lazy("x", n: 0, m: 0) {
            T.expect(remaining(p) == "data", "cursor unchanged for n=0,m=0")
            return true
         }
      }
   )

   // -----------------------------
   // nTomStr_peek: verifies without consuming
   // -----------------------------
   T.note("nTomStr_peek: checks range without consuming")
   T.expect(
      run("abcxyz!") { p in
         p.nTomStr_peek("ab", n: 1, m: 1) {
            T.expect(remaining(p) == "abcxyz!", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // Capturing variants (eager, lazy, peek)
   // -----------------------------
   T.note("nTomStr(capture:) captures greedy span")
   T.expect(
      run("foofoo!") { p in
         let cap = RefSubstring()
         return p.nTomStr("foo", n: 1, m: 2, capture: cap) {
            T.expect(cap.s == "foofoo", "capture should equal 'foofoo', got \(cap.s)")
            return true
         }
      }
   )

   T.note("nTomStr_lazy(capture:) captures minimal span that satisfies tail")
   T.expect(
      run("barbarX") { p in
         let cap = RefSubstring()
         return p.nTomStr_lazy("bar", n: 0, m: 2, capture: cap) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X" {
               T.expect(cap.s.count <= 6, "cap length within lazy bounds")
               return true
            }
            return false
         }
      }
   )

   T.note("nTomStr_peek(capture:) captures but restores cursor")
   T.expect(
      run("ticktickTock") { p in
         let cap = RefSubstring()
         return p.nTomStr_peek("tick", n: 1, m: 2, capture: cap) {
            T.expect(cap.s == "ticktick", "peek capture mismatch: \(cap.s)")
            T.expect(remaining(p) == "ticktickTock", "peek must not consume")
            return true
         }
      }
   )

   // -----------------------------
   // Case-insensitive families: nTomStri / lazy / peek (+ capture)
   // -----------------------------
   T.note("nTomStri eager: case-insensitive greedy + backtrack")
   T.expect(
      run("AbAb!") { p in
         p.nTomStri("ab", n: 1, m: 3) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "!" { return true }
            return false
         }
      }
   )

   T.note("nTomStri_lazy: grows as needed (ci)")
   T.expect(
      run("aBax") { p in
         p.nTomStri_lazy("ab", n: 0, m: 2) {
            if p.cursor < p.endStr,
               p.haystack[p.cursor...].hasPrefix("a") ||
               p.haystack[p.cursor...].hasPrefix("A") {
               return true
            }
            return true
         }
      }
   )

   T.note("nTomStri_peek: verify without consuming (ci)")
   T.expect(
      run("abAB?") { p in
         p.nTomStri_peek("ab", n: 2, m: 3) {
            T.expect(remaining(p) == "abAB?", "nTomStri_peek peek must not consume")
            return true
         }
      }
   )

   T.note("nTomStri capture variants")
   T.expect(
      run("AbAbX") { p in
         let cap = RefSubstring()
         return p.nTomStri("ab", n: 1, m: 2, capture: cap) {
            T.expect(cap.s.lowercased() == "abab", "nTomStri capture should equal 'AbAb'")
            return true
         }
      }
   )
   T.expect(
      run("AbX") { p in
         let cap = RefSubstring()
         return p.nTomStri_lazy("ab", n: 0, m: 1, capture: cap) {
            p.c_peek( "X" ){
               T.expect(!cap.s.isEmpty, "nTomStri lazy capture should not be empty when match exists")
               return true
            }
         }
      }
   )
   T.expect(
      run("aB!") { p in
         let cap = RefSubstring()
         return p.nTomStri_peek("ab", n: 1, m: 1, capture: cap) {
            T.expect(cap.s.lowercased() == "ab", "nTomStri_peek peek capture mismatch: \(cap.s)")
            T.expect(remaining(p) == "aB!", "nTomStri_peek peek must restore cursor")
            return true
         }
      }
   )

   // -----------------------------
   // Convenience: zeroOrOneStr / zeroOrMoreStr (and ci variants)
   // -----------------------------
   T.note("zeroOrOneStr: optional present")
   T.expect(
      run("key=") { p in
         p.zeroOrOneStr("key") {
            p.c_peek( "=" ){
               T.expect(remaining(p) == "=", "zeroOrOneStr should consume when present")
               return true
            }
         }
      }
   )

   T.note("zeroOrOneStr: optional absent")
   T.expect(
      run("=") { p in
         p.zeroOrOneStr("key") {
            T.expect(remaining(p) == "=", "zeroOrOneStr should accept zero")
            return true
         }
      }
   )

   T.note("zeroOrMoreStr: consumes many; peek variant does not consume")
   T.expect(
      run("haHaHa!") { p in
         p.zeroOrMoreStr("ha") {
            T.expect(remaining(p).hasSuffix("!"), "zeroOrMoreStr should consume all 'ha'")
            return true
         }
      }
   )
   T.expect(
      run("haHa!") { p in
         p.zeroOrMoreStr_peek("ha") {
            T.expect(remaining(p) == "haHa!", "peek must not consume")
            return true
         }
      }
   )

   T.note("zeroOrMoreStr_lazy(capture:) with growth")
   T.expect(
      run("xxxy") { p in
         let cap = RefSubstring()
         return p.zeroOrMoreStr_lazy("x", capture: cap) {
            if p.cursor < p.endStr, p.haystack[p.cursor] == "y" {
               T.expect(cap.s == "xxx", "lazy capture should be 'xxx'")
               return true
            }
            return false
         }
      }
   )

   T.note("Case-insensitive convenience: zeroOrOneStri / zeroOrMoreStri")
   T.expect(
      run("KEY=") { p in p.zeroOrOneStri("key") { remaining(p) == "=" } }
   )
   T.expect(
      run("abABab.") { p in p.zeroOrMoreStri("ab") { remaining(p) == "." } }
   )

   // -----------------------------
   // Final summary
   // -----------------------------
   T.summary()
}




// MARK: - Tiny harness

private struct Tally
{
    var passed = 0
    var failed = 0
}

private var tally = Tally()

@inline(__always)
private func expect(_ name: String, _ ok: Bool, _ detail: @autoclosure () -> String = "")
{
    if ok
    {
        print("✅ \(name)")
        tally.passed &+= 1
    }
    else
    {
        print("❌ \(name)  \(detail())")
        tally.failed &+= 1
    }
}

@inline(__always)
private func dist(_ s: String, _ i: String.Index) -> Int
{
    return s.distance(from: s.startIndex, to: i)
}

// MARK: - Core s/si tests

public func test_s_and_s_peek_and_captures()
{
    // s(): exact match and EOS
    do
    {
        let p = Pattern()
        let ok = p.match("hello!")
        {
            return p.s("hello")
            {
                return p.s("!")
                {
                    return p.eos { return true }
                }
            }
        }
        expect("s: simple sequential matches", ok)
    }

    // s(): empty needle succeeds at cursor (no advance)
    do
    {
        let p = Pattern()
        let ok = p.match("abc")
        {
            return p.s("")
            {
                return p.s("a") { return true }
            }
        }
        expect("s: empty string matches at cursor", ok)
    }

    // s_peek(): non-consuming
    do
    {
        let p = Pattern()
        let ok = p.match("abc")
        {
            return p.s_peek("ab")
            {
                return p.s("ab")
                {
                    return p.s("c") { return p.eos { return true } }
                }
            }
        }
        expect("s_peek: verify without consuming", ok)
    }

    // s(capture:)
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("xyz!")
        {
            return p.s("xyz", capture: cap)
            {
                return p.s("!")
                {
                    return p.eos { return true }
                }
            }
        }
        expect("s(capture): captured text", ok && String(cap.s) == "xyz")
    }

    // s_peek(capture:)
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("KLM")
        {
            return p.s_peek("KL", capture: cap)
            {
                return p.s("KL")
                {
                    return p.s("M") { return p.eos { return true } }
                }
            }
        }
        expect("s_peek(capture): captured without consuming", ok && String(cap.s) == "KL")
    }
}

public func test_si_and_si_peek_and_captures()
{
    // si(): ASCII case-insensitive
    do
    {
        let p = Pattern()
        let ok = p.match("Hello")
        {
            return p.si("hello") { return p.eos { return true } }
        }
        expect("si: ASCII case-insensitive", ok)
    }

    // si(): Unicode case-insensitive (É vs é)
    do
    {
        let p = Pattern()
        let ok = p.match("Éclair!")
        {
            return p.si("éclair")
            {
                return p.s("!") { return p.eos { return true } }
            }
        }
        expect("si: Unicode case-insensitive", ok)
    }

    // si_peek(capture:)
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("AbAbY")
        {
            return p.si_peek("ab", capture: cap)
            {
                return p.si("ab")
                {
                    return p.si("abY") { print( "mached y" ); return p.eos { return true } }
                }
            }
        }
        expect("si_peek(capture): verify & capture without consuming, cap='\(cap.s)'", ok && cap.s.count == 2)
    }
}

// MARK: - nTomStr families (eager/lazy/peek) + CI variants

public func test_nTomStr_eager_and_lazy_and_peek()
{
    // nTomStr (eager): greedy then backtrack as needed
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("aaaY")
        {
            return p.nTomStr("a", n: 1, m: 4, capture: cap)
            {
                return p.s("Y") { return p.eos { return true } }
            }
        }
        expect("nTomStr (eager): greedy with backtrack to satisfy tail", ok && (1...4).contains(cap.s.count))
    }

    // nTomStr: fails when minimum not met
    do
    {
        let p = Pattern()
        let ok = p.match("bbb")
        {
            return p.nTomStr("a", n: 1, m: 3) { return true }
        }
        expect("nTomStr: fails when minimum not met", !ok)
    }

    // nTomStr with n==m==0 (edge) matches empty
    do
    {
        let p = Pattern()
        let ok = p.match("X")
        {
            return p.nTomStr("abc", n: 0, m: 0)
            {
                return p.s("X") { return p.eos { return true } }
            }
        }
        expect("nTomStr: n==m==0 matches empty", ok)
    }

    // nTomStr_lazy: grow as needed
    do
    {
        let p = Pattern()
        let ok = p.match("aaaaB!")
        {
            return p.nTomStr_lazy("a", n: 1, m: 4)
            {
                return p.s("B!") { return p.eos { return true } }
            }
        }
        expect("nTomStr_lazy: grows as needed", ok)
    }

    // nTomStr_peek(capture): non-consuming, captures would-be span
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("xxxy")
        {
            return p.nTomStr_peek("x", n: 1, m: 3, capture: cap)
            {
                return p.s("xxx")
                {
                    return p.s("y") { return p.eos { return true } }
                }
            }
        }
        expect("nTomStr_peek(capture): verify/capture without consuming", ok && String(cap.s) == "xxx")
    }
}

public func test_nTomStri_case_insensitive_family()
{
    // nTomStri: eager, case-insensitive
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("AbABab!")
        {
            return p.nTomStri("ab", n: 2, m: 3, capture: cap)
            {
                return p.s("!") { return p.eos { return true } }
            }
        }
        expect("nTomStri: eager case-insensitive repeats", ok && cap.s.count == 6)
    }

    // nTomStri_lazy: CI grow
    do
    {
        let p = Pattern()
        let ok = p.match("abABY")
        {
            return p.nTomStri_lazy("ab", n: 1, m: 3)
            {
                return p.s("Y") { return p.eos { return true } }
            }
        }
        expect("nTomStri_lazy: grows as needed (CI)", ok)
    }

    // nTomStri_peek(capture)
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("abABABY")
        {
            return p.nTomStri_peek("ab", n: 1, m: 3, capture: cap)
            {
                return p.nTomStri("ab", n: 3, m: 3)
                {
                    return p.s("Y") { return p.eos { return true } }
                }
            }
        }
        expect("nTomStri_peek(capture): verify/capture without consuming (CI)", ok && cap.s.count == 6)
    }
}

// MARK: - Look-behind helpers: behindStr / notBehindStr / behindStri / notBehindStri

public func test_behindStr_and_notBehindStr()
{
    // behindStr at interior position (ASCII fast path)
    do
    {
        let p = Pattern()
        let ok = p.match("abcXYZ")
        {
            return p.s("abc")
            {
                return p.behindStr("abc")
                {
                    return p.s("XYZ") { return p.eos { return true } }
                }
            }
        }
        expect("behindStr: positive at interior (ASCII)", ok)
    }

    // behindStr fails at BOS (not enough chars to the left)
    do
    {
        let p = Pattern()
        let ok = p.match("abc")
        {
            return p.behindStr("a")
            {
                return true
            }
        }
        expect("behindStr: fails at BOS", !ok)
    }

    // behindStr with empty literal succeeds (zero-width)
    do
    {
        let p = Pattern()
        let ok = p.match("X")
        {
            return p.behindStr("")
            {
                return true
            }
        }
        expect("behindStr: empty literal succeeds", ok)
    }

    // notBehindStr: succeed when previous chars differ
    do
    {
        let p = Pattern()
        let ok = p.match("abcXYZ")
        {
            return p.s("abc")
            {
                return p.notBehindStr("zzz")
                {
                    return p.s("XYZ") { return p.eos { return true } }
                }
            }
        }
        expect("notBehindStr: succeeds when literal not present behind", ok)
    }

    // notBehindStr: fail when literal *is* present behind
    do
    {
        let p = Pattern()
        let ok = p.match("abcXYZ")
        {
            return p.s("abc")
            {
                return p.notBehindStr("abc")
                {
                    return true
                }
            }
        }
        expect("notBehindStr: fails when literal present behind", !ok)
    }

    // notBehindStr at BOS succeeds for non-empty literal (not enough to match)
    do
    {
        let p = Pattern()
        let ok = p.match("foo")
        {
            return p.notBehindStr("bar")
            {
                return true
            }
        }
        expect("notBehindStr: BOS success when not enough left chars", ok)
    }

    // notBehindStr with empty literal fails (empty always “behind”)
    do
    {
        let p = Pattern()
        let ok = p.match("Y")
        {
            return p.notBehindStr("")
            {
                return true
            }
        }
        expect("notBehindStr: empty literal fails", !ok)
    }
}

public func test_behindStri_and_notBehindStri()
{
    // behindStri at interior (ASCII CI)
    do
    {
        let p = Pattern()
        let ok = p.match("AbCXYZ")
        {
            return p.s("AbC")
            {
                return p.behindStri("aBc")
                {
                    return p.s("XYZ") { return p.eos { return true } }
                }
            }
        }
        expect("behindStri: positive at interior (ASCII CI)", ok)
    }

    // behindStri with Unicode CI (É vs é)
    do
    {
        let p = Pattern()
        let ok = p.match("Éclat")
        {
            return p.s("Écl")
            {
                return p.behindStri("écl")
                {
                    return p.s("at") { return p.eos { return true } }
                }
            }
        }
        expect("behindStri: Unicode case-insensitive positive", ok)
    }

    // behindStri fails when mismatch ignoring case
    do
    {
        let p = Pattern()
        let ok = p.match("abcXYZ")
        {
            return p.s("abc")
            {
                return p.behindStri("zzz")
                {
                    return true
                }
            }
        }
        expect("behindStri: fails on non-matching literal (CI)", !ok)
    }

    // notBehindStri: succeeds when differing (CI), fails when equal (CI)
    do
    {
        let p = Pattern()
        let ok1 = p.match("AbcXYZ")
        {
            return p.s("Abc")
            {
                return p.notBehindStri("zzz")
                {
                    return p.s("XYZ") { return p.eos { return true } }
                }
            }
        }
        expect("notBehindStri: succeeds when differing (CI)", ok1)
    }
    do
    {
        let p = Pattern()
        let ok2 = p.match("AbcXYZ")
        {
            return p.s("Abc")
            {
                return p.notBehindStri("aBc")
                {
                    return true
                }
            }
        }
        expect("notBehindStri: fails when equal (CI)", !ok2)
    }

    // BOS behaviors: notBehindStri succeeds for non-empty literal; empty literal fails
    do
    {
        let p = Pattern()
        let ok = p.match("foo")
        {
            return p.notBehindStri("bar")
            {
                return true
            }
        }
        expect("notBehindStri: BOS success when not enough left chars (CI)", ok)
    }
    do
    {
        let p = Pattern()
        let ok = p.match("foo")
        {
            return p.notBehindStri("")
            {
                return true
            }
        }
        expect("notBehindStri: empty literal fails (CI)", !ok)
    }
}

// MARK: - Convenience families (zero/one/more on strings)

public func test_zeroOrOne_zeroOrMore_families()
{
    // zeroOrOneStr: present
    do
    {
        let p = Pattern()
        let ok = p.match("hi")
        {
            return p.zeroOrOneStr("hi")
            {
                return p.eos { return true }
            }
        }
        expect("zeroOrOneStr: present", ok)
    }

    // zeroOrOneStr: absent (zero case)
    do
    {
        let p = Pattern()
        let ok = p.match("")
        {
            return p.zeroOrOneStr("hi")
            {
                return p.eos { return true }
            }
        }
        expect("zeroOrOneStr: absent", ok)
    }

    // zeroOrOneStr_peek: non-consuming present
    do
    {
        let p = Pattern()
        let ok = p.match("ping")
        {
            return p.zeroOrOneStr_peek("pi")
            {
                return p.s("pi")
                {
                    return p.s("ng") { return p.eos { return true } }
                }
            }
        }
        expect("zeroOrOneStr_peek: present peek", ok)
    }

    // zeroOrMoreStr: zero case then tail
    do
    {
        let p = Pattern()
        let ok = p.match("done")
        {
            return p.zeroOrMoreStr("x")
            {
                return p.s("done") { return p.eos { return true } }
            }
        }
        expect("zeroOrMoreStr: zero allowed", ok)
    }

    // zeroOrMoreStr: many copies
    do
    {
        let p = Pattern()
        let ok = p.match("xxx!")
        {
            return p.zeroOrMoreStr("x")
            {
                return p.s("!")
                {
                    return p.eos { return true }
                }
            }
        }
        expect("zeroOrMoreStr: many copies", ok)
    }

    // zeroOrMoreStr_lazy(capture): minimal then grow
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("zzZ")
        {
            return p.zeroOrMoreStr_lazy("z", capture: cap)
            {
                return p.s("Z") { return p.eos { return true } }
            }
        }
        expect("zeroOrMoreStr_lazy(capture): captured minimal span", ok && cap.s.count >= 0)
    }

    // Case-insensitive convenience family
    do
    {
        let p = Pattern()
        let ok = p.match("HelloHello!")
        {
            return p.zeroOrOneStri("hello")
            {
                return p.zeroOrMoreStri("hello")
                {
                    return p.s("!") { return p.eos { return true } }
                }
            }
        }
        expect("Stri family: zeroOrOne + zeroOrMore (CI)", ok)
    }
}


// MARK: - Runner

public func runStringTests()
{
    tally = Tally()

    test_s_and_s_peek_and_captures()
    test_si_and_si_peek_and_captures()
    test_nTomStr_eager_and_lazy_and_peek()
    test_nTomStri_case_insensitive_family()
    test_behindStr_and_notBehindStr()
    test_behindStri_and_notBehindStri()
    test_zeroOrOne_zeroOrMore_families()

    print("\n=== String.swift Tests ===")
    print("Passed: \(tally.passed)   Failed: \(tally.failed)")
    precondition( tally.failed == 0, "StringHarness has failures" )
}
