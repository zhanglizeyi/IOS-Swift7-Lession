//
//  ViewController.swift
//  Calculator
//
//  Created by zhanglizeyi on 8/24/16.
//  Copyright © 2016 zhanglizeyi. All rights reserved.
//

//hint ?,! both are for optional

import UIKit //like include module

var isSettingOn = Bool()

struct defaultsKeys {
    static let keyOne = "lastAmount"
}

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
    @IBOutlet weak var fiveP: UIButton!
    @IBOutlet weak var tenP: UIButton!
    @IBOutlet weak var fifteenP: UIButton!
    @IBOutlet weak var twentyP: UIButton!
    @IBOutlet weak var twentyFiveP: UIButton!
    @IBOutlet weak var finalTipAmount: UILabel!

    fileprivate var userIsInTheMiddleOfTyping = false
    
    override func viewDidLoad(){
        super.viewDidLoad();
        display.textColor = .orange;
        

        
        //right navgation items in two, 1 is pic of timeLine and 2 is userlist
        let rightBtn1 = UIButton.init(type: .custom)
        rightBtn1.frame = CGRect(x:0, y:0, width: 45, height:45)
        rightBtn1.setImage(UIImage(named: "timeLineImage.png"), for: .normal)
        rightBtn1.tintColor = .blue
        rightBtn1.addTarget(self, action: #selector(handleSetting), for: .touchUpInside)
        let item1 = UIBarButtonItem.init(customView: rightBtn1)
        navigation.setLeftBarButton(item1, animated: true)
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
        
        isSettingOn = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(isSettingOn){
            fiveP.setTitle("5%", for: .normal)
            tenP.setTitle("10%", for: .normal)
            fifteenP.setTitle("15%", for: .normal)
            twentyP.setTitle("20%", for: .normal)
            twentyFiveP.setTitle("25%", for: .normal)
        }else{
            fiveP.setTitle("30%", for: .normal)
            tenP.setTitle("35%", for: .normal)
            fifteenP.setTitle("40%", for: .normal)
            twentyP.setTitle("45%", for: .normal)
            twentyFiveP.setTitle("50%", for: .normal)
        }
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
        var result = Double()
        if(isSettingOn){
            result = displayValue * 0.25
        }else{
            result = displayValue * 0.50
        }
        displayValue = result
        display.text = String(result)
        finalTipAmount.text = "$" + display.text!
        UserDefaults.standard.set(finalTipAmount.text, forKey: "amount")
    }
    @IBAction func twentyPer(_ sender: Any) {
        var result = Double()
        if(isSettingOn){
            result = displayValue * 0.2
        }else{
            result = displayValue * 0.45
        }
        displayValue = result
        display.text = String(result)
        finalTipAmount.text = "$" + display.text!
        UserDefaults.standard.set(finalTipAmount.text, forKey: "amount")
    }
    
    @IBAction func tenPer(_ sender: Any) {
        var result = Double()
        if(isSettingOn){
            result = displayValue * 0.1
        }else{
            result = displayValue * 0.35
        }
        displayValue = result
        display.text = String(result)
        finalTipAmount.text = "$" + display.text!
        UserDefaults.standard.set(finalTipAmount.text, forKey: "amount")
    }
    
    @IBAction func fivePer(_ sender: Any) {
        var result = Double()
        if(isSettingOn){
             result = displayValue * 0.05
        }else{
            result = displayValue * 0.3
        }
        
        
        displayValue = result
        display.text = String(result)
        finalTipAmount.text = "$" + display.text!
        UserDefaults.standard.set(finalTipAmount.text, forKey: "amount")
    }
    
    @IBAction func fifteenPer(_ sender: Any) {
        var result = Double()
        if(isSettingOn){
            result = displayValue * 0.15
        }else{
            result = displayValue * 0.40
        }
        displayValue = result
        display.text = String(result)
        finalTipAmount.text = "$" + display.text!
        UserDefaults.standard.set(finalTipAmount.text, forKey: "amount")
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
    
    @IBAction func clearB(_ sender: UIButton) {
        displayValue = 0
        min.text = ""
        max.text = ""
        min.placeholder = "Min"
        max.placeholder = "Max"
        Slider.minimumValue = 0
        Slider.maximumValue = 100
        Slider.value = 50
        finalTipAmount.text = "$"
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        finalTipAmount.text = UserDefaults.standard.object(forKey: "amount") as! String?
        print("view did appear \(finalTipAmount.text)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

