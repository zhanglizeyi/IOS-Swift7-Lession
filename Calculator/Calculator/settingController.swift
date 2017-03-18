//
//  settingControllerViewController.swift
//  Calculator
//
//  Created by zhanglizeyi on 3/17/17.
//  Copyright © 2017 zhanglizeyi. All rights reserved.
//

import UIKit

class settingController: UIViewController {

    
    let on = UILabel()
    let off = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back",
                                                           style: .plain,
                                                           target: self, action: #selector(handleBack))
        
        let v = UIView()
        view.backgroundColor = .white
        view.addSubview(v)

        
        let mainL = UILabel(frame: CGRect(x: 20, y: 100, width: 350, height: 50))
        mainL.text = "Change the percentage to rich someother"
        mainL.tintColor = .orange
        mainL.isHighlighted  = true
 
       //switch
        let switchButton = UISwitch(frame: CGRect(x:150, y:150 ,width:40, height:40))
        switchButton.isOn  = true
        switchButton.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
       //onlabel
        on.text = "On"
        on.frame = CGRect(x: 155, y: 160, width: 100, height: 100)
        on.tintColor = .orange
      //offlabel
        off.text = "Off"
        off.frame = CGRect(x: 155, y: 160, width: 100, height: 100)
        off.tintColor = .orange
        
        
        self.view.addSubview(mainL)
        self.view.addSubview(on)
        self.view.addSubview(off)
        self.view.addSubview(switchButton)
        on.isHidden = false
        off.isHidden = true


        
        //constraints
        switchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        switchButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        switchButton.widthAnchor.constraint(equalToConstant: 100)
        switchButton.heightAnchor.constraint(equalToConstant: 50)
        
        on.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        on.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: 10)
        on.widthAnchor.constraint(equalToConstant: 100)
        on.heightAnchor.constraint(equalToConstant: 100)
        
        off.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        off.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: 10)
        off.widthAnchor.constraint(equalToConstant: 100)
        off.heightAnchor.constraint(equalToConstant: 100)
    }

    func switchChanged(sender: UISwitch){
        print("this is switch button changed")
        
        if(sender.isOn == true){
            on.isHidden = false
            off.isHidden = true
        }else{
            on.isHidden = true
            off.isHidden = false
        }
    }
    
    func handleBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
