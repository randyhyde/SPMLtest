//
//  testPat.swift
//  SPMLtest

import Foundation
import SPML

func testPat()
{
   let str     = RefSubstring("")
   let s1      = RefSubstring("")
   let s2      = RefSubstring("")
   let s3      = RefSubstring("")

   
   var pResult = false
   
   var p       = Pattern()


// Test onePat:

   print()
   p = Pattern()  // Clean up memory
   
   // Simple test to see if onePat works at all:
   
   pResult =
      p.match( "abcdef" ){
         p.onePat(
            block:
            { tail in
               p.s( "abc" )
               {
                  p.s( "de" )
                  {
                     tail()
                  }
               }
            },
            capture:str
         ){ // This is the tail:
            p.s( "f" )
         }
      }
   precondition( pResult, "onePat #1 failed" )
   precondition(
      str.s == "abcde",
      "onePat did not capture 'abcde' properly, \n" +
      "got: '\(str.s)'"
   )
   print( "onePat #1 passed, capture = '\(str.s)'" )
   
   // Test to ensure a failed match does not change
   // the capture string:
   
   p       = Pattern()
   str.s   = "failed"
   pResult =
      p.match( "abcdff" ){
         p.onePat(
            block:
            { tail in
               p.s( "abc" )
               {
                  p.s( "de" )
                  {
                     tail()
                  }
               }
            },
            capture:str
         ){ // This is the tail
            p.s( "f" )
         }
      }
   precondition( !pResult, "onePat #2 did not fail" )
   precondition(
      str.s == "failed",
      "onePat (incorrectly) changed str, \n" +
      "got: '\(str.s)'"
   )
   print( "onePat #2 passed, capture = '\(str.s)' (failed)" )
   
   // Check capturing an empty string with block:
   
   pResult =
      p.match( "abcabc" ){
         p.onePat(
            block:{ tail in tail() },
            capture:str
         ){ // This is the tail:
            p.s("abcabc" )
         }
      }
   precondition( pResult, "onePat #3 failed" )
   print( "onePat #3 passed, str='\(str.s)'" )
      
   // Backtracking test.
   
   s1.s           = "*"
   s2.s           = "*"
   s3.s           = "*"
   p        = Pattern()
   pResult  =
      p.match( "aaa" ){
         p.onePat(
            block:
            { blockTail in
               print( "onePat #4 sequence: ", terminator:"" ); return
               p.arb()
               {
                  print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                  p.c( "a", capture:s1 )
                  {
                     print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.c( "a", capture:s2 )
                     {
                        print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.c( "a", capture:s3 )
                       {
                           print( "p.c(3,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           blockTail()
                       }
                     }
                  }
               }
            },
            capture:str
         ){ // This is the tail
            print( "tail" ); return
            p.eos()
         }
      }
   precondition( pResult, "onePat #4 failed" )
   print( "onePat #4 passed, capture = '\(str.s)', s1=\(s1.s), s2=\(s2.s), s3=\(s3.s)" )
      
   // Backtracking test #2 (moved arb outside onePat).
   
   p        = Pattern()
   pResult  =
      p.match( "aaa" ){
         print( "onePat #5 sequence: ", terminator:"" ); return
         p.arb()
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.onePat(
               block:
               { blockTail in
                  p.c( "a", capture:s1 )
                  {
                     print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     p.c( "a", capture:s2 )
                     {
                        print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                        p.c( "a", capture:s3 )
                       {
                           print( "p.c(3,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                           blockTail()
                       } // p.c(3)
                     } // p.c(2)
                  }// p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               print( "tail" ); return
               p.eos()
            } // tail
         } //arb
      } // match
   precondition( pResult, "onePat #5 failed" )
   print( "onePat #5 passed, capture = '\(str.s)', s1=\(s1.s), s2=\(s2.s), s3=\(s3.s)" )
   
   // Test version w/o capture:
   
   pResult =
      p.match( "abcdef" ){
         p.onePat(
            block:
            { tail in
               p.s( "abc" )
               {
                  p.s( "de" )
                  {
                     tail()
                  }
               }
            }
         ){ // This is the tail:
            p.s( "f" )
         }
      }
   precondition( pResult, "onePat #6 failed" )
   print( "onePat #6 passed" )

   
   // Test with consuming=false (no capture):
   
   p        = Pattern()  // Clean up memory
   s1.s   = "*"
   pResult  =
      p.match( "abcdef" ){
         p.onePat_peek(
            block:
            { tail in
               p.s( "abc" )
               {
                  p.s( "de" )
                  {
                     tail()
                  }
               }
            }
         ){ // This is the tail:
            p.s( "abcdef" )
         }
      }
   precondition( pResult, "onePat #7 failed" )
   print( "onePat #7 passed" )
   
   // Capturing + consuming=false
   
   p       = Pattern()
   str.s   = "failed"
   pResult =
      p.match( "abcdef" ){
         p.onePat_peek(
            block:
            { tail in
               p.s( "abc" )
               {
                  p.s( "de" )
                  {
                     tail()
                  }
               }
            },
            capture:str
         ){ // This is the tail
            p.s( "abcdef" )
         }
      }
   precondition(
         pResult
      && str.s == "abcde",
      "onePat #8 failed"
   )
   print( "onePat #8 passed, capture = '\(str.s)' (failed)" )
   

//---------------------------------------------
//
// Test nTomPat:

   s1.s  = "*"
   str.s = "*"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #1 sequence: arb:'\(p.haystack[p.cursor..<p.endStr])', ", terminator:"" ); return
         p.arb( capture: s1 )
         {
            print( "nTomPat('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat(
               n:3,
               m:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               print( "tail" ); return
               p.eos()
            } // tail
         } //arb
      } // match
   print()
   print( "xxxx pResult=\(pResult), str='\(str.s)', s1='\(s1.s)'" )
   precondition( pResult, "nTomPat #1 failed" )
   print( "nTomPat #1 passed, capture = '\(str.s)', s1=\(s1.s)" )


   s1.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #2 sequence: ", terminator:"" ); return
         p.arb()
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat(
               n:3,
               m:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               print( "tail" ); return
               p.eos()
            } // tail
         } //arb
      } // match
   precondition( pResult, "nTomPat #2 failed" )
   print( "nTomPat #2 passed, capture = '\(str.s)', s1=\(s1.s)" )

   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #3 sequence: arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); //return
//         p.arb()
//         {
            print( "nTomPat('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat(
               n:1,
               m:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     print( "blockTail('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.c( "a", capture:s2 )
               {
                  print( "tail" ); return
                  p.eos()
               }
            } // tail
//         } //arb
      } // match
   print( "xxxx pResult=\(pResult), str='\(str.s)', s1=\(s1.s), s2=\(s2.s)" ) 
   precondition( pResult, "nTomPat #3 failed" )
   print( "nTomPat #3 passed, capture = '\(str.s)', s1=\(s1.s), s2=\(s2.s)" )

   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #4 sequence: ", terminator:"" ); return
         p.arb()
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat_lazy(
               n:1,
               m:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.c( "a", capture:s2 )
               {
                  print( "tail" ); return
                  p.eos()
               }
            } // tail
         } //arb
      } // match
   print()
   print( "xxxx pResult=\(pResult), str='\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "nTomPat #4 failed" )
   print( "nTomPat #4 passed, capture = '\(str.s)', s1=\(s1.s), s2=\(s2.s)" )

   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #5 sequence: ", terminator:"" ); return
         p.arb( )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat(
               n:1,
               m:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.c( "a", capture:s2 )
               {
                  print( "tail" ); return
                  p.eos()
               }
            } // tail
         } //arb
      } // match
   precondition( pResult, "nTomPat #5 failed" )
   print( "nTomPat #5 passed, capture = '\(str.s)', s1=\(s1.s), s2=\(s2.s)" )

   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #6 sequence: ", terminator:"" ); return
         p.arb( )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat(
               n:1,
               m:4,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.c( "a", capture:s2 )
               {
                  print( "tail, ", terminator:"" ); return
                  p.eos()
                  {
                     print( "eos" )
                     return true
                  }
               }
            } // tail
         } //arb
      } // match
   precondition( pResult, "nTomPat #6 failed" )
   print( "nTomPat #6 passed, capture = '\(str.s)', s1=\(s1.s), s2=\(s2.s)" )

   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #7 sequence: arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
         p.arb( )
         {
            print( "nTomPat_lazy('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat_lazy(
               n:2,
               m:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.c( "a", capture:s2 )
               {
                  print( "tail, ", terminator:"" ); return
                  p.eos()
                  {
                     print( "eos" )
                     return true
                  }
               }
            } // tail
         } //arb
      } // match
   print()
   print( "xxxx pResult=\(pResult), str='\(str.s)', s1='\(s1.s)', s2='\(s2.s)'")
   precondition( pResult, "nTomPat #7 failed" )
   print( "nTomPat #7 passed, capture = '\(str.s)', s1=\(s1.s), s2=\(s2.s)" )

   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #8 sequence: arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
         p.arb_lazy( )
         {
            print( "nTomPat_lazy('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat_lazy(
               n:3,
               m:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.c( "a", capture:s2 )
               {
                  print( "tail, ", terminator:"" ); return
                  p.eos()
                  {
                     print( "eos" )
                     return true
                  }
               }
            } // tail
         } //arb
      } // match
   print()
   precondition( !pResult, "nTomPat #8 should have failed" )
   print( "nTomPat #8 passed, (failure, as expected)" )

   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nTomPat #9 sequence: ", terminator:"" ); return
         p.arb( )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nTomPat(
               n:3,
               m:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
               p.c( "a", capture:s2 )
               {
                  print( "tail, ", terminator:"" ); return
                  p.eos()
                  {
                     print( "eos" )
                     return true
                  }
               }
            } // tail
         } //arb
      } // match
   print()
   precondition( !pResult, "nTomPat #9 should have failed" )
   print( "nTomPat #9 passed, (failure, as expected)" )

   
   // Test the version with consuming=false
   
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
            print( "nTomPat(no consume) #10 sequence: ", terminator:"" ); return
            p.nTomPat_peek(
               n           :3,
               m           :3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
                  
               }// block
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaa", capture:str, {p.eos()})
            } // tail
      } // match
   precondition( pResult, "nTomPat #10 failed" )
   print( "nTomPat #10 passed, capture = '\(str.s)'" )


   // Test the version with consuming=false and capturing
   
   p     = Pattern()  // Clean up memory
   s1.s = "*"
   s2.s = "*"
   s3.s = "*"
   pResult  =
      p.match( "aaa" ){
            print( "nTomPat(capture, no consume) #11 sequence: ", terminator:"" ); return
            p.nTomPat_peek(
               n           :3,
               m           :3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s2 )
                 {
                     print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:s1
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaa", capture:s3, {p.eos()})
            } // tail
      } // match
   precondition( pResult, "nTomPat #11 failed" )
   print( "nTomPat #11 passed, capture = '\(s1.s)', s2.s = '\(s2.s)', s3.s = '\(s3.s)'" )


      
//---------------------------------------------
//
// Test zeroOrOnePat:

   s1.s = "*"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print( "zeroOrOnePat #1 sequence: ", terminator:"" ); return
         p.arb()
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOnePat(
               block:
               { blockTail in
                 print( "p.c('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     let btResult = blockTail()
                     print( "blockTail('\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                     return btResult
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               let psResult =
                  p.s( "aa", capture:s1 )
                  {
                     let tailResult = p.eos()
                     print( "eos = \(tailResult)" )
                     return tailResult
                  }
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   precondition( pResult, "zeroOrOnePat #1 failed" )
   print( "zeroOrOnePat #1 passed, capture = '\(str.s)', s1='\(s1.s)'" )

   var pcCnt:Int = 0
   var psCnt:Int = 0
   var btCnt:Int = 0
   var esCnt:Int = 0
   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "zeroOrOnePat #2 sequence: ", terminator:"" ); return
         p.arb_lazy()
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrOnePat(
               block:
               { blockTail in
                 pcCnt += 1
                 print( "p.c(\(pcCnt),'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     btCnt += 1
                     print( "btCnt=\(btCnt), ", terminator:"" )
                     let btResult = blockTail()
                     print( "blockTail('\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                     return btResult
                 } // p.c(1)
                  
               }, // block
               capture:str
            ){ // This is the tail
               psCnt += 1
               print( "psCnt=\(psCnt), ", terminator:"" )
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     esCnt += 1
                     print( "esCnt=\(btCnt), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos = \(tailResult)", terminator:", " )
                     return tailResult
                  }
               print( "p.s('\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "zeroOrOnePat #2 failed" )
   print( "zeroOrOnePat #2 passed, capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   pcCnt = 0
   psCnt = 0
   btCnt = 0
   esCnt = 0
   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" )
      {
         print( "zeroOrOnePat #3 sequence: ", terminator:"" ); return
         p.zeroOrOnePat(
            block:
            { blockTail in
              pcCnt += 1
              print( "p.c(\(pcCnt),'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
              p.c( "a", capture:s1 )
              {
                  btCnt += 1
                  print( "btCnt=\(btCnt), ", terminator:"" )
                  let btResult = blockTail()
                  print( "blockTail('\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                  return btResult
              } // p.c(1)
               
            }, // block
            capture:str
         ){ // This is the tail
            psCnt += 1
            print( "psCnt=\(psCnt), ", terminator:"" )
            let psResult =
               p.s( "aa", capture:s2 )
               {
                  esCnt += 1
                  print( "esCnt=\(btCnt), ", terminator:"" )
                  let tailResult = p.eos()
                  print( "eos = \(tailResult)", terminator:", " )
                  return tailResult
               }
            print( "p.s('\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
            return psResult
         } // tail

      } // match
   print()
   precondition( pResult, "zeroOrOnePat #3 failed" )
   print( "zeroOrOnePat #3 passed, capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   s1.s = "*"
   s2.s = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" )
      {
         print( "zeroOrOnePat #4 sequence: zeroOrOnePat_lazy('\(p.haystack[ p.cursor..<p.endStr ])'), ", terminator:"" ); return
         p.zeroOrOnePat_lazy(
            block:
            { blockTail in
               print( "c('\(p.haystack[ p.cursor..<p.endStr ])'), ", terminator:"" ); return
               p.c( "a", capture:s1, blockTail )
            }, // block
            capture:str
         ){ // This is the tail
            print( "s('\(p.haystack[ p.cursor..<p.endStr ])'), ", terminator:"" ); return
            p.s( "aa", capture:s2 )
            {
               print( "eos('\(p.haystack[ p.cursor..<p.endStr ])'), ", terminator:"" ); return
               p.eos()
            }
         } // tail
      } // match
   print()
   print( "xxxx pResult=\(pResult), str='\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )
   precondition( pResult, "zeroOrOnePat #4 failed" )
   print( "zeroOrOnePat #4 passed, capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "b" )
      {
         p.zeroOrOnePat_lazy(
            block:
            { blockTail in
              p.c( "a", blockTail )
            }// block
         ){ // This is the tail
           p.eos()
         } // tail
      } // match
   precondition( !pResult, "zeroOrOnePat #5 failed (expected no pattern match)" )
   print( "zeroOrOnePat #5 passed" )

   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "b" )
      {
         p.zeroOrOnePat(
            block:
            { blockTail in
              p.c( "a", blockTail )
            }// block
         ){ // This is the tail
           p.eos()
         } // tail
      } // match
   precondition( !pResult, "zeroOrOnePat #6 failed (expected no pattern match)" )
   print( "zeroOrOnePat #6 passed" )

   // Test the version with consuming=false
   
   p     = Pattern()  // Clean up memory
   str.s  = "*"
   pResult  =
      p.match( "aaa" ){
            print( "zeroOrOnePat(no consume) #7 sequence: ", terminator:"" ); return
            p.zeroOrOnePat_peek(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
                  
               }// block
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaa", capture:str, {p.eos()})
            } // tail
      } // match
   precondition( pResult, "zeroOrOnePat #7 failed" )
   print( "zeroOrOnePat #7 passed, capture = '\(str.s)'" )
   
   p     = Pattern()  // Clean up memory
   str.s  = "*"
   pResult  =
      p.match( "bbb" ){
            print( "zeroOrOnePat(no consume) #8 sequence: ", terminator:"" ); return
            p.zeroOrOnePat_peek(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
                  
               }// block
            ){ // This is the tail
               print( "tail" ); return
               p.s( "bbb", capture:str, {p.eos()})
            } // tail
      } // match
   precondition( pResult, "zeroOrOnePat #8 failed" )
   print( "zeroOrOnePat #8 passed, capture = '\(str.s)'" )


   // Test the version with capture and consuming=false
   
   p        = Pattern()  // Clean up memory
   s1.s   = "*"
   str.s  = "*"
   pResult  =
      p.match( "aaa" ){
            print( "zeroOrOnePat(no consume) #9 sequence: ", terminator:"" ); return
            p.zeroOrOnePat_peek(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a" )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture :s1
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaa", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s1.s == "a",
      "zeroOrOnePat #9 failed"
   )
   print( "zeroOrOnePat #9 passed, capture = '\(s1.s)', tail = '\(str.s)'" )
   
   p     = Pattern()  // Clean up memory
   s1.s  = "*"
   str.s  = "*"
   pResult  =
      p.match( "bbb" ){
            print( "zeroOrOnePat(no consume) #10 sequence: ", terminator:"" ); return
            p.zeroOrOnePat_lazy(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture :s2
            ){ // This is the tail
               print( "tail" ); return
               p.s( "bbb", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s2.s == "",
      "zeroOrOnePat #10 failed"
   )
   print( "zeroOrOnePat #10 passed, capture = '\(s2.s)', tail = '\(str.s)'" )


   
      
//---------------------------------------------
//
// Test zeroOrMorePat:

   let arbCapture = RefSubstring("*")
   s1.s           = "*"
   s2.s           = "*"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print( "zeroOrMorePat #1 sequence: ", terminator:"" ); return
         p.arb( capture:arbCapture)
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrMorePat(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
           ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "zeroOrMorePat #1 failed" )
   print( "zeroOrMorePat #1 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )
   
   arbCapture.s = "*"
   s1.s         = "*"
   s2.s         = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "zeroOrMorePat #2 sequence: ", terminator:"" ); return
         p.arb_lazy( capture:arbCapture )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrMorePat(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "zeroOrMorePat #2 failed" )
   print( "zeroOrMorePat #2 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   arbCapture.s = "*"
   s1.s         = "*"
   s2.s         = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "zeroOrMorePat #3 sequence: ", terminator:"" ); return
         p.arb( capture:arbCapture)
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrMorePat_lazy(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "zeroOrMorePat #3 failed" )
   print( "zeroOrMorePat #3 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )
      
   arbCapture.s = "*"
   s1.s         = "*"
   s2.s         = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "zeroOrMorePat #4 sequence: ", terminator:"" ); return
         p.arb_lazy( capture:arbCapture )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.zeroOrMorePat_lazy(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "zeroOrMorePat #4 failed" )
   print( "zeroOrMorePat #4 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )


   // Test the version with consuming=false
   
   p     = Pattern()  // Clean up memory
   str.s  = "*"
   pResult  =
      p.match( "aaaaaa" ){
            print( "zeroOrMorePat(no consume) #5 sequence: ", terminator:"" ); return
            p.zeroOrMorePat_peek(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }// block
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaaaaa", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && str.s == "aaaaaa",
      "zeroOrMorePat #5 failed"
   )
   print( "zeroOrMorePat #5 passed, capture = '\(str.s)'" )
   
   p     = Pattern()  // Clean up memory
   str.s  = "*"
   pResult  =
      p.match( "bbb" ){
            print( "zeroOrMorePat(no consume) #6 sequence: ", terminator:"" ); return
            p.zeroOrMorePat_peek(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }// block
            ){ // This is the tail
               print( "tail" ); return
               p.s( "bbb", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && str.s == "bbb",
      "zeroOrMorePat #6 failed"
   )
   print( "zeroOrMorePat #6 passed, capture = '\(str.s)'" )


   // Test the version with capture and consuming=false
   
   p        = Pattern()  // Clean up memory
   s1.s   = "*"
   str.s  = "*"
   pResult  =
      p.match( "aaaaaa" ){
            print( "zeroOrMorePat(no consume) #7 sequence: ", terminator:"" ); return
            p.zeroOrMorePat_peek(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a" )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:s1
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaaaaa", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s1.s == "aaaaaa"
      && str.s == "aaaaaa",
      "zeroOrMorePat #7 failed"
   )
   print( "zeroOrMorePat #7 passed, capture = '\(s1.s)', tail = '\(str.s)'" )
   
   p     = Pattern()  // Clean up memory
   s1.s  = "*"
   str.s  = "*"
   pResult  =
      p.match( "bbb" ){
            print( "zeroOrMorePat(no consume) #8 sequence: ", terminator:"" ); return
            p.zeroOrMorePat_lazy(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a", capture:s1 )
                 {
                     print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture :s2,
            ){ // This is the tail
               print( "tail" ); return
               p.s( "bbb", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s2.s == "",
      "zeroOrMorePat #8 failed"
   )
   print( "zeroOrMorePat #8 passed, capture = '\(s2.s)', tail = '\(str.s)'" )

   
      
//---------------------------------------------
//
// Test oneOrMorePat:

   arbCapture.s   = "*"
   s1.s           = "*"
   s2.s           = "*"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print( "oneOrMorePat #1 sequence: ", terminator:"" ); return
         p.arb( capture:arbCapture)
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.oneOrMorePat(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "oneOrMorePat #1 failed" )
   print( "oneOrMorePat #1 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   arbCapture.s   = "*"
   s1.s           = "*"
   s2.s           = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "oneOrMorePat #2 sequence: ", terminator:"" ); return
         p.arb_lazy( capture:arbCapture )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.oneOrMorePat(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "oneOrMorePat #2 failed" )
   print( "oneOrMorePat #2 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   arbCapture.s   = "*"
   s1.s           = "*"
   s2.s           = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "oneOrMorePat #3 sequence: ", terminator:"" ); return
         p.arb_lazy( capture:arbCapture )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.oneOrMorePat_lazy(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "oneOrMorePat #3 failed" )
   print( "oneOrMorePat #3 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   arbCapture.s   = "*"
   s1.s           = "*"
   s2.s           = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "oneOrMorePat #4 sequence: ", terminator:"" ); return
         p.arb_lazy( capture:arbCapture )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.oneOrMorePat_lazy(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "oneOrMorePat #4 failed" )
   print( "oneOrMorePat #4 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" )
      {
         p.oneOrMorePat(
            block: { blockTail in
               p.c( "a", {blockTail()} )
            }, // block
            capture:str,
            { p.s( "aa", {p.eos()}) }  // This is the tail
         )
      } // match
   precondition( !pResult, "oneOrMorePat #5 didn't return failure" )
   print( "oneOrMorePat #5 passed, (pattern did not match)" )

   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" )
      {
         p.oneOrMorePat_lazy(
            block: { blockTail in
               p.c( "a", {blockTail()} )
            }, // block
            capture:str,
            { p.s( "aa", {p.eos()}) }  // This is the tail
         )
      } // match
   precondition( !pResult, "oneOrMorePat #6 didn't return failure" )
   print( "oneOrMorePat #6 passed, (pattern did not match)" )



   // Test the version with capture and consuming=false
   
   p        = Pattern()  // Clean up memory
   s1.s   = "*"
   str.s  = "*"
   pResult  =
      p.match( "aaaaaa" ){
            print( "oneOrMorePat(no consume) #7 sequence: ", terminator:"" ); return
            p.oneOrMorePat_peek(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a" )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture     :s1,
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaaaaa", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s1.s == "aaaaaa"
      && str.s == "aaaaaa",
      "oneOrMorePat #7 failed"
   )
   print( "oneOrMorePat #7 passed, capture = '\(s1.s)', tail = '\(str.s)'" )
   
   p     = Pattern()  // Clean up memory
   s1.s  = "*"
   str.s  = "*"
   pResult  =
      p.match( "aaabbb" ){
            print( "zeroOrMorePat(no consume) #8 sequence: ", terminator:"" ); return
            p.oneOrMorePat_peek(
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.s( "aaa", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:s2,
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaabbb", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s2.s == "aaa"
      && str.s == "aaabbb",
      "oneOrMorePat #8 failed"
   )
   print( "oneOrMorePat #8 passed, capture = '\(s2.s)', tail = '\(str.s)'" )

   
//---------------------------------------------
//
// Test nPat:

   arbCapture.s   = "*"
   s1.s           = "*"
   s2.s           = "*"
   p = Pattern()  // Clean up memory
   print()
   pResult  =
      p.match( "aaa" ){
         print( "nPat #1 sequence: nPat('\(p.haystack)'), ", terminator:"" ); return
         p.nPat(
            n:1,
            block:
            { blockTail in
              print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
              let pcResult =
                 p.c( "a", capture:s1 )
                 {
                     print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let btResult = blockTail()
                     print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                     return btResult
                 } // p.c(1)
              print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
              return pcResult
            }, // block
            capture:str
         ){ // This is the tail
            print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
            let psResult =
               p.s( "aa", capture:s2 )
               {
                  print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                  let tailResult = p.eos()
                  print( "eos(2) = \(tailResult), ", terminator:"" )
                  return tailResult
               }
            print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
            return psResult
         } // tail
      } // match
   print()
   precondition( pResult, "nPat #1 failed" )
   print( "nPat #1 passed, arbCapture='\(arbCapture.s)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   arbCapture.s   = "*"
   s1.s           = "*"
   s2.s           = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nPat #2 sequence: ", terminator:"" ); return
         p.arb_lazy( capture:arbCapture )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nPat(
               n:1,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nPat #2 failed" )
   print( "nPat #2 passed, arbCapture='\(arbCapture.s)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   arbCapture.s = "*"
   s1.s         = "*"
   s2.s         = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nPat #3 sequence: arb('\(p.haystack)'), ", terminator:"" ); return
         p.arb( capture:arbCapture )
         {
            print( "nPat('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nPat(
               n:1,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nPat #3 failed" )
   print( "nPat #3 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   arbCapture.s = "*"
   s1.s         = "*"
   s2.s         = "*"
   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aaa" ){
         print( "nPat #4 sequence: ", terminator:"" ); return
         p.arb_lazy( capture:arbCapture )
         {
            print( "arb('\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
            p.nPat(
               n:1,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
                 let pcResult =
                    p.c( "a", capture:s1 )
                    {
                        print( "blockTail(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                        let btResult = blockTail()
                        print( "blockTail(2,'\(p.haystack[p.cursor..<p.endStr])')=\(btResult), ", terminator:"" )
                        return btResult
                    } // p.c(1)
                 print( "p.c(2,'\(p.haystack[p.cursor..<p.endStr])'), pcResult=\(pcResult), ", terminator:"" );
                 return pcResult
               }, // block
               capture:str
            ){ // This is the tail
               print( "p.s(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" );
               let psResult =
                  p.s( "aa", capture:s2 )
                  {
                     print( "eos(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" )
                     let tailResult = p.eos()
                     print( "eos(2) = \(tailResult), ", terminator:"" )
                     return tailResult
                  }
               print( "p.s(2, '\(p.haystack[p.cursor..<p.endStr])')=\(psResult), ", terminator:"" )
               return psResult
            } // tail
         } //arb
      } // match
   print()
   precondition( pResult, "nPat #4 failed" )
   print( "nPat #4 passed, arbCapture='\(arbCapture)', capture = '\(str.s)', s1='\(s1.s)', s2='\(s2.s)'" )

   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" )
      {
         p.nPat(
            n:1,
            block: { blockTail in
               p.c( "a", {blockTail()} )
            }, // block
            capture:str,
            { p.s( "aa", {p.eos()}) }  // This is the tail
         )
      } // match
   precondition( !pResult, "nPat #5 didn't return failure" )
   print( "nPat #5 passed, (pattern did not match)" )

   p = Pattern()  // Clean up memory
   pResult  =
      p.match( "aa" )
      {
         p.nPat(
            n:1,
            block: { blockTail in
               p.c( "a", {blockTail()} )
            }, // block
            capture:str,
            { p.s( "aa", {p.eos()}) }  // This is the tail
         )
      } // match
   precondition( !pResult, "nPat #6 didn't return failure" )
   print( "nPat #6 passed, (pattern did not match)" )



   // Test the version with capture and consuming=false
   
   p        = Pattern()  // Clean up memory
   s1.s   = "*"
   str.s  = "*"
   pResult  =
      p.match( "aaaaaa" ){
            print( "nPat(no consume, 3) #7 sequence: ", terminator:"" ); return
            p.nPat_peek(
               n:3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.c( "a" )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture:s1
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaaaaa", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s1.s == "aaa"
      && str.s == "aaaaaa",
      "nPat #7 failed"
   )
   print( "oneOrMorePat #7 passed, capture = '\(s1.s)', tail = '\(str.s)'" )
   
   p     = Pattern()  // Clean up memory
   s1.s  = "*"
   str.s  = "*"
   pResult  =
      p.match( "aaabbb" ){
            print( "nPat(no consume,3) #8 sequence: ", terminator:"" ); return
            p.nPat_peek(
               n           :3,
               block:
               { blockTail in
                 print( "p.c(1,'\(p.haystack[p.cursor..<p.endStr])'), ", terminator:"" ); return
                 p.s( "a", capture:s1 )
                 {
                     blockTail()
                 } // p.c(1)
                  
               }, // block
               capture     :s2
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaabbb", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s2.s == "aaa"
      && str.s == "aaabbb",
      "nPat #8 failed"
   )
   print( "nPat #8 passed, capture = '\(s2.s)', tail = '\(str.s)'" )

   
   p     = Pattern()  // Clean up memory
   s1.s  = "*"
   str.s  = "*"
   print()
   pResult  =
      p.match( "aaabbb" ){
            print( "notAhead #1 sequence: ", terminator:"" ); return
            p.notAhead(
               pat: { tail in p.s("bbb", tail) },
            ){ // This is the tail
               print( "tail" ); return
               p.s( "aaabbb", capture:str, {p.eos()})
            } // tail
      } // match
   precondition(
         pResult
      && s2.s == "aaa"
      && str.s == "aaabbb",
      "notAhead #2 failed"
   )
   print( "notAhead #2 passed, tail = '\(str.s)'" )


   //-------------------------------------------------------------------------
   
   // Run the following test suite:
   
   runPatternSmokeTests()
   runPatternsTests()

}




// MARK: - Lightweight Test Harness)

final class PatternSmokeHarness
{
   private(set) var passed = 0
   private(set) var failed = 0
   private(set) var total  = 0

   func expect
   (
      _ condition :Bool,
      _ message   :@autoclosure ()->String = ""
   )
   {
      total += 1
      if condition
      {
         passed += 1
      }
      else
      {
         failed += 1
         print( "❌ FAIL: \(message())" )
      }
   }

   func note( _ msg:String )
   {
      print( "— \(msg)" )
   }

   func summary()
   {
      print( "—" )
      print( "✅ PASS: \(passed)  ❌ FAIL: \(failed)  (TOTAL: \(total))" )
      precondition( failed == 0, "PatternSmokeHarness has failures" )
   }
}

// MARK: - Small Utilities for Driving Pattern

@discardableResult
private func run
(
   _ s     :String,
   _ body  :(Pattern)->Bool
)->Bool
{
   let p = Pattern()
   return p.match( s )
   {
      body( p )
   }
}

// Consume exactly k characters (returns false if not enough remain)
@inline(__always)
private func consume
(
   _ p :Pattern,
   _ k :Int
)->Bool
{
   var i = 0
   while i < k && p.cursor < p.endStr
   {
      p.incCursor()
      i += 1
   }
   return i == k
}

@inline(__always)
private func remaining
(
   _ p :Pattern
)->Substring
{
   return p.haystack[ p.cursor..<p.endStr ]
}

// MARK: - Public Entry Point

public func runPatternSmokeTests()
{
   let T = PatternSmokeHarness()
   print( "=== Pattern Smoke Tests ===" )

   // -----------------------------
   // onePat (normal, boundary, peek, capture)
   // -----------------------------
   T.note( "onePat: success path with tail" )
   T.expect(
      run( "ab" )
      { p in
         p.onePat(
            block:
            { tail in
               T.expect( consume( p, 1 ), "onePat: could not consume 'a'" )
               return tail()
            })
         {
            T.expect( consume( p, 1 ), "onePat tail: could not consume 'b'" )
            return true
         }
      },
      "onePat should succeed"
   )

   T.note( "onePat: block fails on empty input (boundary)" )
   T.expect(
      !run( "" )
      { p in
         p.onePat(
            block: { _ in consume( p, 1 ) }
         )
         {
            T.expect( false, "tail should not run when block fails" )
            return true
         }
      },
      "onePat should fail on empty"
   )

   T.note( "onePat_peek: must not consume" )
   T.expect(
      run( "xyz" )
      { p in
         p.onePat_peek(
            block:
            { tail in
               T.expect( consume( p, 1 ), "peek block failed to consume temp char" )
               return tail()
            })
         {
            T.expect( remaining( p ) == "xyz", "peek should restore cursor" )
            return true
         }
      },
      "onePat_peek should succeed without consuming"
   )

   T.note( "onePat capture & peek-capture" )
   T.expect(
      run( "pqrs" )
      { p in
         let cap = RefSubstring()
         return p.onePat(
            block: { tail in
               T.expect( consume( p, 3 ), "capture block failed to consume 3 chars" )
               return tail()
            },
            capture: cap
         )
         {
            T.expect( cap.s == "pqr", "capture mismatch: \(cap.s)" )
            return true
         }
      },
      "onePat(capture:) should capture consumed slice"
   )

   T.expect(
      run( "pqrs" )
      { p in
         let cap = RefSubstring()
         return p.onePat_peek(
            block: { tail in
               T.expect( consume( p, 3 ), "peek-capture block failed to consume 3 chars" )
               return tail()
            },
            capture: cap
         )
         {
            T.expect( cap.s == "pqr", "peek-capture mismatch: \(cap.s)" )
            T.expect( remaining( p ) == "pqrs", "peek-capture should restore cursor" )
            return true
         }
      },
      "onePat_peek(capture:) should capture and restore"
   )

   // -----------------------------
   // nTomPat (eager) — backtracking & boundaries
   // -----------------------------
   T.note( "nTomPat eager: backtracks to satisfy tail" )
   T.expect(
      run( "aaab" )
      { p in
         p.nTomPat(
            n: 1, m: 3,
            block:
            { tail in
               T.expect( consume( p, 1 ), "nTomPat block failed to consume 'a'" )
               return tail()
            })
         {
            // Require next char be 'b'
            if p.cursor < p.endStr && p.haystack[p.cursor] == "b"
            {
               T.expect( consume( p, 1 ), "tail failed to consume 'b'" )
               return true
            }
            return false
         }
      },
      "nTomPat should backtrack to line up 'b'"
   )

   T.note( "nTomPat eager: failure when cannot reach minimum (boundary)" )
   T.expect(
      !run( "" )
      { p in
         p.nTomPat( n: 1, m: 3, block: { _ in consume( p, 1 ) } ) { true }
      },
      "nTomPat should fail when min not met"
   )

   // -----------------------------
   // nTomPat_lazy — grows as needed (including n=0,m=0)
   // -----------------------------
   T.note( "nTomPat_lazy: grows until tail stops" )
   T.expect(
      run( "aaaX" )
      { p in
         p.nTomPat_lazy(
            n: 0, m: 3,
            block:
            { tail in
               T.expect( consume( p, 1 ), "lazy block failed to consume 'a'" )
               return tail()
            })
         {
            // Keep succeeding while next is 'a'; stop on 'X'
            if p.cursor < p.endStr && p.haystack[p.cursor] == "a"
            {
               return true
            }
            T.expect( p.cursor < p.endStr && p.haystack[p.cursor] == "X",
                      "lazy should stop at 'X'" )
            return true
         }
      },
      "nTomPat_lazy should grow only as needed"
   )

   T.note( "nTomPat_lazy: n=0, m=0 (edge) — tail runs immediately" )
   T.expect(
      run( "hello" )
      { p in
         p.nTomPat_lazy(
            n: 0, m: 0,
            block:
            { _ in
               T.expect( false, "block should not run for n=0,m=0" )
               return false
            })
         {
            T.expect( remaining( p ) == "hello", "cursor should not move for n=0,m=0" )
            return true
         }
      },
      "nTomPat_lazy n=0,m=0 should call tail immediately"
   )

   // -----------------------------
   // arb / arb_lazy (eager vs lazy) + capturing variants
   // -----------------------------
   T.note( "arb eager: match all then back off" )
   T.expect(
      run( "abcDEF" )
      { p in
         p.arb
         {
            // Tail succeeds only when next is uppercase
            if p.cursor < p.endStr,
               ("A"..."Z").contains( p.haystack[p.cursor] )
            {
               return true
            }
            return false
         }
      },
      "arb should back off until next is uppercase"
   )

   T.note( "arb(capture:) captures prefix" )
   T.expect(
      run( "abcDEF" )
      { p in
         let cap = RefSubstring(); return
         p.arb( capture: cap )
         {
            if p.cursor < p.endStr,
               ("A"..."Z").contains( p.haystack[p.cursor] )
            {
               return true
            }
            return false
         }
      },
      "arb(capture:) should succeed"
   )

   T.note( "arb_lazy: start empty and grow until tail ok" )
   T.expect(
      run( "....X" )
      { p in
         p.arb_lazy
         {
            // Accept when next char is 'X'
            if p.cursor < p.endStr, p.haystack[p.cursor] == "X"
            {
               return true
            }
            return false
         }
      },
      "arb_lazy should grow until 'X'"
   )

   // -----------------------------
   // upToADigit / thruADigit families (incl. peek & capture)
   // -----------------------------
   T.note( "upToADigit: digit in the middle" )
   T.expect(
      run( "----9rest" )
      { p in
         p.uptoADigit
         {
            T.expect( p.cursor < p.endStr && p.haystack[p.cursor] == "9",
                      "uptoADigit should stop before '9'" )
            return true
         }
      },
      "uptoADigit should stop before first digit"
   )

   T.note( "uptoADigit: no digit (boundary -> fail & restore)" )
   T.expect(
      !run( "no-digits" )
      { p in
         let before = p.cursor
         let ok = p.uptoADigit { true }
         T.expect( p.cursor == before, "cursor should restore on failure" )
         return ok
      },
      "uptoADigit should fail if no digit exists"
   )

   T.note( "uptoADigit_peek(capture:) restores cursor and captures" )
   T.expect(
      run( "abc123" )
      { p in
         let cap = RefSubstring()
         return p.uptoADigit_peek( capture: cap )
         {
            T.expect( cap.s == "abc", "uptoADigit_peek capture mismatch: \(cap.s)" )
            T.expect( remaining( p ) == "abc123", "peek should not consume" )
            return true
         }
      },
      "uptoADigit_peek(capture:) should capture & restore"
   )

   T.note( "thruADigit: consumes through the digit" )
   T.expect(
      run( "xx7yy" )
      { p in
         p.thruADigit
         {
            T.expect( remaining( p ) == "yy",
                      "thruADigit should consume thru '7' (rest 'yy')" )
            return true
         }
      },
      "thruADigit should include the digit"
   )

   T.note( "thruADigit(capture:) captures thru digit" )
   T.expect(
      run( "pre5post" )
      { p in
         let cap = RefSubstring()
         return p.thruADigit( capture: cap )
         {
            T.expect( cap.s == "pre5", "thruADigit capture mismatch: \(cap.s)" )
            return true
         }
      },
      "thruADigit(capture:) should capture prefix+digit"
   )

   T.note( "thruADigit_peek: restores cursor" )
   T.expect(
      run( "a1b" )
      { p in
         let before = p.cursor
         let ok = p.thruADigit_peek { true }
         T.expect( ok, "thruADigit_peek should succeed" )
         T.expect( p.cursor == before, "thruADigit_peek should restore cursor" )
         return ok
      }
   )

   T.note( "thruADigit on empty string (boundary)" )
   T.expect(
      !run( "" )
      { p in
         p.thruADigit { true }
      },
      "thruADigit should fail on empty input"
   )

   // -----------------------------
   // Final Summary
   // -----------------------------
   T.summary()
}




//
// PatternsTests.swift — non-XCTest harness for Patterns.swift
//


// MARK: - Minimal harness

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
        print("❌ \(name) \(detail())")
        tally.failed &+= 1
    }
}

// MARK: - Tiny pattern “blocks” used with nPat/nTomPat APIs
// Each helper returns a (PatClosure)->Bool and ALWAYS returns p.tailGate(tail)

@inline(__always)
private func blockChar(_ p: Pattern, _ ch: Character) -> (PatClosure) -> Bool
{
    return { tail in
        if p.cursor >= p.endStr { return false }
        if p.haystack[p.cursor] != ch { return false }
        p.incCursor()
        return p.tailGate(tail)
    }
}

@inline(__always)
private func blockDigit(_ p: Pattern) -> (PatClosure) -> Bool
{
    return { tail in
        if p.cursor >= p.endStr { return false }
        guard let b = p.haystack[p.cursor].asciiValue, b >= 48 && b <= 57 else { return false }
        p.incCursor()
        return p.tailGate(tail)
    }
}

@inline(__always)
private func blockLiteral(_ p: Pattern, _ s: String) -> (PatClosure) -> Bool
{
    return { tail in
        var i = p.cursor
        for ch in s
        {
            if i >= p.endStr { return false }
            if p.haystack[i] != ch { return false }
            p.haystack.formIndex(after: &i)
        }
        p.cursor = i
        return p.tailGate(tail)
    }
}

// MARK: - Tests

public func test_onePat_basic()
{
    let p = Pattern()
    let ok = p.match("a")
    {
        return p.onePat(block: blockChar(p, "a"))
        {
            return p.eos { return true }
        }
    }
    expect("onePat: single char then EOS", ok)
}

public func test_zeroOrOnePat_present_and_absent()
{
    // Present
    do
    {
        let p = Pattern()
        let ok = p.match("x")
        {
            return p.zeroOrOnePat(block: blockChar(p, "x"))
            {
                return p.eos { return true }
            }
        }
        expect("zeroOrOnePat: present", ok)
    }

    // Absent (zero copies)
    do
    {
        let p = Pattern()
        let ok = p.match("")
        {
            return p.zeroOrOnePat(block: blockChar(p, "x"))
            {
                return p.eos { return true }
            }
        }
        expect("zeroOrOnePat: absent", ok)
    }
}

public func test_zeroOrMorePat_and_oneOrMorePat()
{
    // zeroOrMore: accepts zero, then "b!"
    do
    {
        let p = Pattern()
        let ok = p.match("b!")
        {
            return p.zeroOrMorePat(block: blockChar(p, "a"))
            {
                return blockLiteral(p, "b!")()
                {
                    return p.eos { return true }
                }
            }
        }
        expect("zeroOrMorePat: zero allowed", ok)
    }

    // oneOrMore: must see at least one digit
    do
    {
        let p = Pattern()
        let ok = p.match("123X")
        {
            return p.oneOrMorePat(block: blockDigit(p))
            {
                return blockChar(p, "X")()
                {
                    return p.eos { return true }
                }
            }
        }
        expect("oneOrMorePat: requires ≥1", ok)
    }

    // oneOrMore: fails when none
    do
    {
        let p = Pattern()
        let ok = p.match("X")
        {
            return p.oneOrMorePat(block: blockDigit(p))
            {
                return true
            }
        }
        expect("oneOrMorePat: fails with zero matches", !ok)
    }
}

public func test_nPat_exact_and_peek()
{
    // exactly 3 'a' then 'b'
    do
    {
        let p = Pattern()
        let ok = p.match("aaab")
        {
            return p.nPat(n: 3, block: blockChar(p, "a"))
            {
                return blockChar(p, "b")()
                {
                    return p.eos { return true }
                }
            }
        }
        expect("nPat: exact count", ok)
    }

    // peek does not consume
    do
    {
        let p = Pattern()
        let ok = p.match("aaab")
        {
            // Save position via peeking logic: after peek, we should still match full text
            return p.nPat_peek(n: 3, block: blockChar(p, "a"))
            {
                return blockLiteral(p, "aaab")()
                {
                    return p.eos { return true }
                }
            }
        }
        expect("nPat_peek: no consumption", ok)
    }
}

public func test_nTomPat_eager_backtracks()
{
    // "aaab!" — match a{1,4} eagerly, then require "b!"
    let p = Pattern()
    let ok = p.match("aaab!")
    {
        return p.nTomPat(n: 1, m: 4, block: blockChar(p, "a"))
        {
            return blockLiteral(p, "b!")()
            {
                return p.eos { return true }
            }
        }
    }
    expect("nTomPat (greedy): max then backtrack for tail", ok)
}

public func test_nTomPat_min_requirement_failure()
{
    let p = Pattern()
    let ok = p.match("bbb")
    {
        return p.nTomPat(n: 1, m: 3, block: blockChar(p, "a"))
        {
            return true
        }
    }
    expect("nTomPat: fails when minimum not met", !ok)
}

public func test_nTomPat_lazy_growth()
{
    // Lazy tries min length first and grows until tail fits
    let p = Pattern()
    let ok = p.match("aaabX")
    {
        return p.nTomPat_lazy(n: 1, m: 3, block: blockChar(p, "a"))
        {
            return blockLiteral(p, "bX")()
            {
                return p.eos { return true }
            }
        }
    }
    expect("nTomPat_lazy: grows as needed", ok)
}

public func test_nTomPat_peek_no_consume()
{
    let p = Pattern()
    let ok = p.match("abc")
    {
        return p.nTomPat_peek(n: 1, m: 2, block: blockChar(p, "a"))
        {
            // After peek, we can still match the whole string
            return blockLiteral(p, "abc")()
            {
                return p.eos { return true }
            }
        }
    }
    expect("nTomPat_peek: does not advance cursor", ok)
}

public func test_capturing_variants()
{
    // nTomPat capture: capture the repeated segment
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("aaab!")
        {
            return p.nTomPat(n: 1, m: 3, block: blockChar(p, "a"), capture: cap)
            {
                return blockLiteral(p, "b!")()
                {
                    return p.eos { return true }
                }
            }
        }
        expect("nTomPat(capture:): captured run", ok && cap.s == "aaa")
    }

    // nPat capture: exact
    do
    {
        let p = Pattern()
        let cap = RefSubstring()
        let ok = p.match("xxxy")
        {
            return p.nPat(n: 3, block: blockChar(p, "x"), capture: cap)
            {
                return blockChar(p, "y")()
                {
                    return p.eos { return true }
                }
            }
        }
        expect("nPat(capture:): captured exact run cap='\(cap.s)'", ok && cap.s == "xxx")
    }
}

public func test_fast_variants()
{
    // nPat_fast: exactly 2 'a'
    do
    {
        let p = Pattern()
        let ok = p.match("aab")
        {
            return p.nPat_fast(n: 2, block: blockChar(p, "a"))
            {
                return blockChar(p, "b")()
                {
                    return p.eos { return true }
                }
            }
        }
        expect("nPat_fast: exact match", ok)
    }

    // nTomPat_fast: ≥1 digit then 'X'
    do
    {
        let p = Pattern()
        let ok = p.match("123X")
        {
            return p.nTomPat_fast(n: 1, m: .max, block: blockDigit(p))
            {
                return blockChar(p, "X")()
                {
                    return p.eos { return true }
                }
            }
        }
        expect("nTomPat_fast: simple pass", ok)
    }
}

// MARK: - Runner

public func runPatternsTests()
{
    tally = Tally()

    test_onePat_basic()
    test_zeroOrOnePat_present_and_absent()
    test_zeroOrMorePat_and_oneOrMorePat()
    test_nPat_exact_and_peek()
    test_nTomPat_eager_backtracks()
    test_nTomPat_min_requirement_failure()
    test_nTomPat_lazy_growth()
    test_nTomPat_peek_no_consume()
    test_capturing_variants()
    test_fast_variants()

    print("\n=== Patterns.swift Tests ===")
    print("Passed: \(tally.passed)   Failed: \(tally.failed)")
    precondition( tally.failed == 0, "Patterns.swift Tests failed" )
}
