//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by zhanglizeyi on 8/25/16.
//  Copyright © 2016 zhanglizeyi. All rights reserved.

// model file never has uikit

import Foundation


class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        switch symbol {
        case "π": accumulator = M_PI
        case "√": accumulator = sqrt(accumulator)
            
        default: break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
} 