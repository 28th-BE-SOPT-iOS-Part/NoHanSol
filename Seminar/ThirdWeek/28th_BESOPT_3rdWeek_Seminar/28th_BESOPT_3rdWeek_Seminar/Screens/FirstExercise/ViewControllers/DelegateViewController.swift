//
//  DelegateViewController.swift
//  28th_BESOPT_3rdWeek_Seminar
//
//  Created by 노한솔 on 2021/04/24.
//

import UIKit

protocol SampleProtocol {
  func dataSend(data: String)
}

class DelegateViewController: UIViewController {
  
  @IBOutlet weak var dataTextField: UITextField!
  var delegate : SampleProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  @IBAction func backButtonClicked(_ sender: Any) {
    if let text = dataTextField.text {
      delegate?.dataSend(data: text)
    }
    self.navigationController?.popViewController(animated: true)
  }
  
}
