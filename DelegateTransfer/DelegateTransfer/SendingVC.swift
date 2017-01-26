//
//  SendingVC.swift
//  DelegateTransfer
//
//  Created by zhanglizeyi on 1/25/17.
//  Copyright © 2017 zhanglizeyi. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func userDidEnter(Data: String)
}

class SendingVC: UIViewController {

    @IBOutlet weak var dataEnter: UITextField!
    var delegate: DataSentDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func sendButtonPressed(_ sender: AnyObject) {

        if(delegate != nil){
            if dataEnter.text != nil{
                let data = dataEnter.text
                delegate?.userDidEnter(Data: data!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
