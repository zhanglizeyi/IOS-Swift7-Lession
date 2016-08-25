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
    @IBOutlet weak var display: UILabel!
    
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton)
    {
        //local and initial, never changed
        //whenever you doing constant
        let digit = sender.currentTitle!
        //exclamation is unwarp thing to get accosiated
        
        if userIsInTheMiddleOfTyping
        {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else
        {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle
        {
            if mathematicalSymbol == "π"
            {
                display.text = String(M_PI)  //testing
            }
        }
    }

}

