//
//  MoneySpentViewController.swift
//  try
//
//  Created by Junyi Zhang on 3/11/20.
//  Copyright © 2020 Junyi Zhang. All rights reserved.
//

import UIKit
protocol canReceive {
    func passDataBack(data: Double)
}

class MoneySpentViewController: UIViewController {

    var delegate:canReceive?
    @IBOutlet weak var spendingTxt: UITextField!
    var spendingValueFinal = 0.00
    @IBOutlet weak var warningLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func SubmitClicked(_ sender: Any) {
        if let spendingValue = Double(spendingTxt.text!) {
            if spendingValue <= 0 {
                warningLabel.text = "Please enter a valid number!"
            } else {
                warningLabel.text = ""
                delegate?.passDataBack(data: spendingValue)
                dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            warningLabel.text = "Please enter a valid number!"
        }
        
    }

    

}
