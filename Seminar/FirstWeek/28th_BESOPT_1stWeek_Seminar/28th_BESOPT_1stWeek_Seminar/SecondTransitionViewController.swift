//
//  SecondTransitionViewController.swift
//  28th_BESOPT_1stWeek_Seminar
//
//  Created by 노한솔 on 2021/04/03.
//

import UIKit

class SecondTransitionViewController: UIViewController {
  
  @IBOutlet weak var dismissButton: UIButton!
  @IBOutlet weak var messageLabel: UILabel!
  
  var message: String?
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    setLabel()
   
  }
  @IBAction func touchUpDismiss(_ sender: Any) {
//    self.dismiss(animated: true, completion: nil)
    self.navigationController?.popViewController(animated: true)
  }
  
  func layout() {
    self.view.backgroundColor = .magenta
    self.dismissButton.then {
      $0.setTitle("뒤로가기", for: .normal)
      $0.setTitleColor(.white, for: .normal)
    }
  }
  
  func setLabel() {
    if let context = self.message {
      self.messageLabel.text = context
    }
  }
  
}
