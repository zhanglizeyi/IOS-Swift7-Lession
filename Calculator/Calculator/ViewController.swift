//
//  ViewController.swift
//  Calculator
//
//  Created by zhanglizeyi on 8/24/16.
//  Copyright © 2016 zhanglizeyi. All rights reserved.
//

//hint ?,! both are for optional

import UIKit //like include module

class ViewController: UIViewController, UITextFieldDelegate {
    
    //propoerty
    @IBOutlet fileprivate weak var display: UILabel!
    
    @IBOutlet weak var StackView: UIStackView!
    @IBOutlet weak var keyView: UIStackView!
    @IBOutlet weak var percent: UITextField!
    @IBOutlet weak var min: UITextField!
    @IBOutlet weak var max: UITextField!
    @IBOutlet weak var Slider: UISlider!
    
    fileprivate var userIsInTheMiddleOfTyping = false
    
    override func viewDidLoad(){
        super.viewDidLoad();
        display.textColor = .orange;
    }
    
    @IBAction func defaultButton(_ sender: Any) {
        min.text = ""
        max.text = ""
        min.placeholder = "Min"
        max.placeholder = "Max"
        Slider.minimumValue = 0
        Slider.maximumValue = 100
        Slider.value = 50
    }
    
    @IBAction func twentyFivePer(_ sender: Any) {
        let result = displayValue * 0.25
        displayValue = result
        display.text = String(result)
    }
    @IBAction func twentyPer(_ sender: Any) {
        let result = displayValue * 0.2
        displayValue = result
        display.text = String(result)
    }
    
    @IBAction func tenPer(_ sender: Any) {
        let result = displayValue * 0.1
        displayValue = result
        display.text = String(result)
    }
    
    @IBAction func fivePer(_ sender: Any) {
        let result = displayValue * 0.05
        displayValue = result
        display.text = String(result)
    }
    
    @IBAction func fifteenPer(_ sender: Any) {
        let result = displayValue * 0.15
        displayValue = result
        display.text = String(result)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("min: \(min.text!)  max: \(max.text!)")
        if((min.text != "") && (max.text != "")){
            Slider.minimumValue = Float(min.text!)!
            Slider.maximumValue = Float(max.text!)!
        }
        let sliderVar = Double(sender.value)
        display.text = String(sliderVar)
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction fileprivate func touchDigit(_ sender: UIButton)
    {
        //local and initial, never changed
        //whenever you doing constant
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    fileprivate var displayValue: Double {
        
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    
    //can infer
    fileprivate var brain = CalculatorBrain() //initializer
    
    
    @IBAction fileprivate func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            
            print("This is in performOperation \(displayValue)")
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {

            print(mathematicalSymbol)
            
            brain.performOperation(mathematicalSymbol)
        }
        //show the update
        displayValue = brain.result
    }

}

