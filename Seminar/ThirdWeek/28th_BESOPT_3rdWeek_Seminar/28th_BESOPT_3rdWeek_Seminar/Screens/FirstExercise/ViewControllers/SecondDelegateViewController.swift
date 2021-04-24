//
//  SecondDelegateViewController.swift
//  28th_BESOPT_3rdWeek_Seminar
//
//  Created by 노한솔 on 2021/04/24.
//

import UIKit

class SecondDelegateViewController: UIViewController {
  
  @IBOutlet weak var dataTextField: UITextField!
  @IBOutlet weak var dataLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataTextField.delegate = self
    
  }
}

extension SecondDelegateViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.dataLabel.text = self.dataTextField.text
    return true
  }
}
