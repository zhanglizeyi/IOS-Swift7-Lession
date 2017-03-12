//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by zhanglizeyi on 8/25/16.
//  Copyright © 2016 zhanglizeyi. All rights reserved.

// model file never has uikit

import Foundation


//global function
//func Float(op1: Double, op2: Double) -> Double{
//    return op1+(op2/10)
//}

class CalculatorBrain
{
    fileprivate var accumulator = 0.0
    
    func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    
    //operation -> local, var all lower case and cammel case
    fileprivate var operation: Dictionary<String, Operation> = [
        "π"  : Operation.constant (M_PI),
        "e"  : Operation.constant (M_E),
        "√"  : Operation.unaryOperation (sqrt),
        "C"  : Operation.constant(0),
        "±"  : Operation.unaryOperation( {-$0}),
        "×"  : Operation.binaryOperation ({ $0 * $1}),
        "+"  : Operation.binaryOperation({ $0 + $1}),
        "-"  : Operation.binaryOperation({$0 - $1}),
        "÷"  : Operation.binaryOperation({$0 / $1}),
        "."  : Operation.binaryOperation({$0+$1/10}),
        "="  : Operation.equals
    ]
    
    //Operation
    fileprivate enum Operation{
        case constant (Double)
        case unaryOperation ((Double) -> Double)
        case binaryOperation ((Double, Double) -> Double)
        case equals
    }
    
    //calculation
    func performOperation(_ symbol: String) {
        
        if let operation = operation[symbol]{
        
            switch operation {
            case .constant (let value):
                accumulator = value
            case .unaryOperation (let function):
                accumulator = function(accumulator)
            case .binaryOperation (let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .equals:
                executePendingBinaryOperation()
                
            }
        }
    }
    
    //complexty
    fileprivate func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    fileprivate var pending: PendingBinaryOperationInfo?
    
    fileprivate struct PendingBinaryOperationInfo {
        var binaryFunction: ((Double, Double) -> Double)
        var firstOperand: Double
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
