//
//  SignupViewController.swift
//  28th_BESOPT_4thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/08.
//

import UIKit

class SignupViewController: UIViewController {
  
  @IBOutlet weak var idTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var checkPasswordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  @IBAction func signupButtonClicked(_ sender: Any) {
    if self.passwordTextField.text == self.checkPasswordTextField.text {
      self.makeRequestAlert(title: "알림",
                     message: "회원가입 성공",
                     okAction: { _ in
                      self.signupAction()
      })
    }
  }
  
  func signupAction() {
    SignupService.shared.signup(email: self.idTextField.text!,
                              password: self.passwordTextField.text!) {
      result in
      print(result)
      switch result {
      case .success(let message):
        if let message = message as? String {
          self.makeAlert(title: "알림", message: message)
        }
      case .requestErr(let message):
        if let message = message as? String {
          self.makeAlert(title: "알림", message: message)
        }
      default:
        print("error")
      }
    }
  }
}
