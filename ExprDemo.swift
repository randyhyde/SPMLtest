//
//  ExprDemo.swift
//  SPMLtest


import Foundation
import SPML

//----------------------------------------------
//
// Expression-
//
// Parser for an arithmetic expression parser.
// Demonstrates how to extend the Pattern class.
//
// Grammar:
//
// Expr   -> addOp
//
// addOp  -> mulOp addop'
// addOp' -> + mulOp addOp'
//        -> - mulOp addOp'
//        -> [empty]
//
// mulOp  -> factor mulOp'
// mulOp' -> * factor mulOp'
//        -> / factor mulOp'
//        -> [empty]
//
// factor -> value
//        -> ( Expr )
//
// For more information on this
// grammar, see "Compilers: Principles,
// Techniques, and Tools" by Aho, Sethi,
// and Ullman (the "Dragon Book").

public class Expression: Pattern
{
   // exprStk holds temporary values
   // during expression parsing:
   
   var   exprStk = Stack<Double>()

  
   // factor-
   // Handles floating-point literal constants
   // and parenthetical expressions.
   //
   // Note: the parenthetical expressions
   // are the magic part of this example.
   // This demonstrates recursion, meaning
   // the pattern-matching code supports
   // context-free languages, making this
   // pattern matching library more powerful
   // than the standard Swift regular expression
   // library (RegexBuilder).
   //
   // Handles the productions:
   //
   // factor -> value
   //        -> ( Expr )

   
   open func factor( _ tail: @escaping PatClosure = {true} )->Bool
   {
      let saveStart  = cursor
      let saveEnd    = endStr
      var result     = false
      let val        = RefDouble()
      
      assert(
            cursor >= haystack.startIndex
         && cursor <= haystack.endIndex
         && endStr   >= haystack.startIndex
         && endStr   <= haystack.endIndex,
         "factor: String index bounds error"
      )
       
       result =
         zeroOrMoreWS()
         {
            // This code demonstrates alternation using
            // both Boolean expressions and the choiceOf
            // method. Alternative 1 uses a nested
            // alternative (via choiceOf).
            
            // Alternative 1: a floating-point value:
            
            floatingPoint( val )
            {
               exprStk.push( val.d )
               return !failFence && tail() && !failFence
            }


            // Alternative 2: a parenthetical expression:
            
            || c("(")
               {
                  if expr( val )
                  {
                     exprStk.push( val.d )
                     result =
                        zeroOrMoreWS()
                        {
                           c(")")
                           {
                              return tailGate( tail )
                           }
                        }
                  }
                  return result
               }
               
            // Alternative 3: negation operation:
            
            || c("-")
               {
                  var value = 0.0
                  let result =
                     zeroOrMoreWS()
                     {
                        factor()
                        {
                           value = self.exprStk.pop()!
                           self.exprStk.push( -value )
                           return self.tailGate( tail )
                        }
                     }
                  return result
               }
               
            // Alternative 3: '+' prefix operation:
            
            || c("+")
               {
                  let result =
                     zeroOrMoreWS()
                     {
                        factor()
                        {
                           return self.tailGate( tail )
                        }
                     }
                  return result
               }
               
                  
         }
         
      return restoreIndexes(
         result,
         saveStart,
         saveEnd
      )
   } // end fpVal
   
   
   // mulOpPrime-
   //
   // Handles the productions:
   //
   // mulOp' -> * factor mulOp'
   //        -> / factor mulOp'
   //        -> [empty]

   open func mulOpPrime( _ tail:@escaping PatClosure = {true} )->Bool
   {
      let saveStart  = cursor
      let saveEnd    = endStr
      var result     = false
      var left       = 0.0
      var right      = 0.0

      result =
            zeroOrMoreWS
            {
               c("*")
               {
                  factor()
                  { [unowned self] in
                     right = exprStk.pop()!
                     left  = exprStk.pop()!
                     exprStk.push( left * right )
                     return mulOpPrime()
                     {
                        return !self.failFence && tail() && !self.failFence
                     }
                  }
               }
            }
            
         || zeroOrMoreWS()
            {
               c("/")
               {
                  factor()
                  { [unowned self] in
                     right = exprStk.pop()!
                     left  = exprStk.pop()!
                     precondition(
                        right != 0,
                        "Attempted division by zero in '\(haystack)'"
                     )
                     exprStk.push( left / right )
                     return mulOpPrime()
                     {
                        return !self.failFence && tail() && !self.failFence
                     }
                  }
               }
            }
            
         || tail()

      return restoreIndexes(
         result,
         saveStart,
         saveEnd
      )
   } // end mulOpPrime
   
   // mulOp-
   //
   // Handles the production:
   //
   // mulOp  -> factor mulOp'
   
   open func mulOp( _ tail:@escaping PatClosure = {true} )->Bool
   {
      let saveStart  = cursor
      let saveEnd    = endStr
      var result     = true
      
      
      assert(
            cursor >= haystack.startIndex
         && cursor <= haystack.endIndex
         && endStr   >= haystack.startIndex
         && endStr   <= haystack.endIndex,
         "mulOp: String index bounds error"
      )
      result =
         zeroOrMoreWS()
         {
            factor()
            { [unowned self] in
               mulOpPrime()
               {
                  !self.failFence && tail() && !self.failFence
               }
            }
         }
      return restoreIndexes(
         result,
         saveStart,
         saveEnd
      )
   } // end mulOp

   
   // addOpPrime
   //
   // Handles the productions:
   //
   // addOp' -> + mulOp addOp'
   //        -> - mulOp addOp'
   //        -> [empty]

   open func addOpPrime( _ tail:@escaping PatClosure = {true} )->Bool
   {
      let saveStart  = cursor
      let saveEnd    = endStr
      var result     = false
      var left       = 0.0
      var right      = 0.0

      result =
            zeroOrMoreWS()
            {
               let resultPlus =
                  c("+")
                  {
                     mulOp(){ [unowned self] in
                        right = exprStk.pop()!
                        left  = exprStk.pop()!
                        exprStk.push( left + right)
                        return addOpPrime()
                        {
                           return !self.failFence && tail() && !self.failFence
                        }
                     }
                  }
               return resultPlus
            }

         || zeroOrMoreWS()
            {
               c("-")
               {
                  mulOp(){ [unowned self] in
                     right = exprStk.pop()!
                     left  = exprStk.pop()!
                     exprStk.push( left - right )
                     return addOpPrime()
                     {
                        return !self.failFence && tail() && !self.failFence
                     }
                  }
               }
            }

         || tail()
         
      return restoreIndexes(
         result,
         saveStart,
         saveEnd
      )
   } // end addOpPrime
   
   
   // addOp-
   //
   // Handles the production:
   //
   // addOp  -> mulOp addop'

   
   open func addOp( _ tail:@escaping PatClosure = {true} )->Bool
   {
      let saveStart  = cursor
      let saveEnd    = endStr
      var result     = true
      
      assert(
            cursor >= haystack.startIndex
         && cursor <= haystack.endIndex
         && endStr   >= haystack.startIndex
         && endStr   <= haystack.endIndex,
         "addOp: String index bounds error"
      )
      result =
         zeroOrMoreWS()
         {
            mulOp()
            { [unowned self] in
               addOpPrime()
               {
                  !self.failFence && tail() && !self.failFence
               }
            }
         }
      return restoreIndexes(
         result,
         saveStart,
         saveEnd
      )
   } // end addOp
   
   // expr-
   //
   // Matches a floating-point expression and returns
   // the result in the value parameter.
   //
   // Handles the production:
   //
   // Expr   -> addOp
   
   open func expr
   (
      _ value: RefDouble,
      _ tail:PatClosure = {true}
   )->Bool
   {
      let saveStart     = cursor
      let saveEnd       = endStr
      var result        = true

      result =
            addOp()
            { [unowned self] in
               value.d = exprStk.pop()!
               return true
            }
      if result
      {
         result = tail()
      }
      return restoreIndexes(
         result,
         saveStart,
         saveEnd
      )
   } // end expr
   
} // end extension Pattern



public func testExpr()
{
   //----------------------------------------------
   // test code (main program):

   var e       = Expression()
   let pos     = RefSubstringIndex( e.haystack[e.cursor..<e.endStr] )
   let str     = RefSubstring("")
   var start   : Substring.Index
   var end     : Substring.Index


   let sx  = " (8+2) "
   let dx  = RefDouble( 0.0 )

   var pResult =
      e.match( sx ){
         e.markPos( mark:pos ){
         e.expr( dx ){
         e.capture( dest:str, mark:pos.ndx )
      }}}
   print( "Expr evaluation 0, result =\(pResult)" )
   print( "value=\(dx.d), capture=\(str)" )


   // Quick test of the expression
   // evaluator:

   let s  = " ( +12 - 3 ) / ( -4 * -2 ) * 8"
   let s0 = " ( ++12 - 3 ) / ( ---4 * -2 ) * 8"
   let d  = RefDouble( 0.0 )

   pResult =
      e.match( s ){
         e.markPos( mark:pos ){
         e.expr( d ){
         e.capture( dest:str, mark:pos.ndx )
      }}}
   print( "Expr evaluation 1, result =\(pResult)" )
   print( "value=\(d.d), capture=\(str.s)" )
   precondition( d.d == 9.0, "Expr eval 1 expected 9.0" )

   e = Expression() // Memory clean up

   /* Try out
      open func match(
         _ theStr :String,
           start  :String.Index,
           end    :String.Index,
         _ tail   :PatClosure = {true}
      )->Bool
   */

   var e2 = Expression()

   pResult =
      e2.match( s, start:s.startIndex, end:s.endIndex ){
         e2.markPos( mark:pos ){
         e2.expr( d ){
         e2.capture( dest:str, mark:pos.ndx )
      }}}
   print("Testing expr eval 2 [match(_:start:end:_:)]" )
   print("result = \(pResult), value=\(d.d), capture=\(str.s)" )
   precondition( d.d == 9.0, "Expr eval 2 expected 9.0" )
   e2 = Expression() // Memory clean up



   var e3   = Expression()
   start    = s.startIndex
   end      = s.endIndex

   print( "testing e3" )
   pResult =
      e3.match( s, start:start, end:end ){
         e3.markPos( mark:pos ){
         e3.expr( d ){
         e3.capture( dest:str, mark:pos.ndx )
      }}}
   print("Testing expr eval 3 [match(_:start:end:_:)]" )
   print("result = \(pResult), value=\(d.d), capture=\(str.s)" )
   print( "Str after eval: '\(e3.haystack[e3.cursor..<e3.endStr])'" )
   precondition( d.d == 9.0, "Expr eval 3 expected 9.0" )

   e3 = Expression() // Memory clean up


   print( "testing e4" )
   var e4 = Expression()

   pos.ndx = s.startIndex
   pResult =
      e4.match( s0 ){
         e4.markPos( mark:pos ){
         e4.expr( d ){
         e4.capture( dest:str, mark:pos.ndx )
      }}}
   print("Testing expr eval 4 [match(_:start:end:_:)]" )
   print("result = \(pResult), value=\(d.d), capture=\(str.s)" )
   print( "Str after eval: '\(e3.haystack[e3.cursor..<e3.endStr])'" )
   precondition( d.d == 9.0, "Expr eval 4 expected 9.0" )

   e4 = Expression() // Memory clean up
   
}
