//
//  ViewController.swift
//  Calculator
//
//  Created by zhanglizeyi on 8/24/16.
//  Copyright © 2016 zhanglizeyi. All rights reserved.
//

//hint ?,! both are for optional

import UIKit //like include module

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //propoerty
    @IBOutlet fileprivate weak var display: UILabel!
    
    @IBOutlet weak var StackView: UIStackView!
    @IBOutlet weak var keyView: UIStackView!
    @IBOutlet weak var percent: UITextField!
    @IBOutlet weak var min: UITextField!
    @IBOutlet weak var max: UITextField!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var navigation: UINavigationItem!
    
    fileprivate var userIsInTheMiddleOfTyping = false
    
    override func viewDidLoad(){
        super.viewDidLoad();
        display.textColor = .orange;
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(handleSetting))
//        
        
        //right navgation items in two, 1 is pic of timeLine and 2 is userlist
        let rightBtn1 = UIButton.init(type: .custom)
        rightBtn1.frame = CGRect(x:0, y:0, width: 45, height:45)
        rightBtn1.setImage(UIImage(named: "timeLineImage.png"), for: .normal)
        rightBtn1.tintColor = .blue
        rightBtn1.addTarget(self, action: #selector(handleSetting), for: .touchUpInside)
        let item1 = UIBarButtonItem.init(customView: rightBtn1)
        navigation.setLeftBarButton(item1, animated: true)
        
    }
    
    
    func handleSetting(){
        let con = settingController()
        let navCon = UINavigationController(rootViewController: con)
        present(navCon, animated: true, completion: nil)
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
    
    @IBAction func clearBtn(_ sender: Any) {
        displayValue = 0
        min.text = ""
        max.text = ""
        min.placeholder = "Min"
        max.placeholder = "Max"
        Slider.minimumValue = 0
        Slider.maximumValue = 100
        Slider.value = 50
        display.text = "$"
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

