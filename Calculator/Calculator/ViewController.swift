//
//  ViewController.swift
//  Calculator
//
//  Created by zhanglizeyi on 8/24/16.
//  Copyright © 2016 zhanglizeyi. All rights reserved.
//

//hint ?,! both are for optional

import UIKit //like include module

class ViewController: UIViewController {
    
    //propoerty
    @IBOutlet private weak var display: UILabel!
    
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton)
    {
        //local and initial, never changed
        //whenever you doing constant
        let digit = sender.currentTitle!
        //exclamation is unwarp thing to get accosiated
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    
    //can infer
    private var brain = CalculatorBrain() //initializer
    
    
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
           
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }

}

