//
//  ViewController.swift
//  DelegateTransfer
//
//  Created by zhanglizeyi on 1/25/17.
//  Copyright © 2017 zhanglizeyi. All rights reserved.
//

import UIKit

class RecevingVC: UIViewController, DataSentDelegate {

    @IBOutlet weak var receiveText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func userDidEnter(Data data: String) {
        receiveText.text = data;
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSendingVC" {
            let sendVC: SendingVC = segue.destination as! SendingVC
            sendVC.delegate = self
        }
    }
}

