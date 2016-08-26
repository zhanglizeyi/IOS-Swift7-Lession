//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by zhanglizeyi on 8/25/16.
//  Copyright © 2016 zhanglizeyi. All rights reserved.

// model file never has uikit

import Foundation


//global function
func multiply(op1: Double, op2: Double) -> Double{
    return op1*op2
}

func divide(op1: Double, op2: Double) -> Double{
    return op1/op2
}

func minus(op1: Double, op2: Double) -> Double{
    return op1-op2
}

func plus(op1: Double, op2: Double) -> Double{
    return op1+op2
}

class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    
    //operation -> local, var all lower case and cammel case
    private var operation: Dictionary<String, Operation> = [
        "π"  : Operation.Constant (M_PI),
        "e"  : Operation.Constant (M_E),
        "√"  : Operation.UnaryOperation (sqrt),
        "cos": Operation.UnaryOperation (cos),
        "±"   : Operation.UnaryOperation( {-$0}),
        "×"  : Operation.BinaryOperation ({ $0 * $1}),
        "+"  : Operation.BinaryOperation({ $0 + $1}),
        "-"  : Operation.BinaryOperation({$0 - $1}),
        "÷"  : Operation.BinaryOperation({$0 / $1}),
        "="  : Operation.Equals
    ]
    
    //Operation
    private enum Operation{
        case Constant (Double)
        case UnaryOperation ((Double) -> Double)
        case BinaryOperation ((Double, Double) -> Double)
        case Equals
    }
    
    //calculation
    func performOperation(symbol: String) {
        
        if let operation = operation[symbol]{
        
            switch operation {
            case .Constant (let value):
                accumulator = value
            case .UnaryOperation (let function):
                accumulator = function(accumulator)
            case .BinaryOperation (let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()

            }
        }
    }
    
    //complexty
    private func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: ((Double, Double) -> Double)
        var firstOperand: Double
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}