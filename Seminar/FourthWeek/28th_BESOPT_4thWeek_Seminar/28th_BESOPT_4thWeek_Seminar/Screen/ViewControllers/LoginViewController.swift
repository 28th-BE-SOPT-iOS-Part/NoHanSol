//
//  LoginViewController.swift
//  28th_BESOPT_4thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/08.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var idTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func loginButtonClicked(_ sender: Any) {
    self.makeRequestAlert(title: "알림",
                   message: "로그인 성공",
                   okAction: { _ in
                    self.loginAction()
    })
  }
  
  func loginAction() {
    LoginService.shared.login(email: self.idTextField.text!,
                              password: self.passwordTextField.text!) {
      result in
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
