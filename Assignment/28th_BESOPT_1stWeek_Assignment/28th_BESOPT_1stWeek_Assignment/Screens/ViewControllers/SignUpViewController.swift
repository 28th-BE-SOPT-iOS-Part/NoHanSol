//
//  SignUpViewController.swift
//  28th_BESOPT_1stWeek_Assignment
//
//  Created by 노한솔 on 2021/04/05.
//

import SnapKit
import TextFieldEffects
import Then
import UIKit

class SignUpViewController: UIViewController {
    
  //MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    self.navigationController?.navigationBar.isHidden = true
  }
  
  //MARK: - Properties
  let titleLabel = UILabel().then {
    $0.textColor = .black
    $0.text = "카카오톡을 시작합니다"
    $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    $0.textAlignment = .center
  }
  let emailTextField = HoshiTextField().then {
    $0.attributedPlaceholder = NSAttributedString(string: "이메일 또는 전화번호",
                                                  attributes: [NSAttributedString.Key.font :
                                                                UIFont.systemFont(ofSize: 15)])
    $0.placeholderColor = .placeholderText
    $0.borderStyle = .line
    $0.borderInactiveColor = .placeholderText
    $0.clearButtonMode = .whileEditing
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
  }
  let passwordTextField = HoshiTextField().then {
    $0.attributedPlaceholder = NSAttributedString(string: "비밀번호",
                                                  attributes: [NSAttributedString.Key.font :
                                                                UIFont.systemFont(ofSize: 15)])
    $0.placeholderColor = .placeholderText
    $0.borderStyle = .line
    $0.borderInactiveColor = .placeholderText
    $0.clearButtonMode = .whileEditing
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.isSecureTextEntry = true
  }
  let confirmPasswordTextField = HoshiTextField().then {
    $0.attributedPlaceholder = NSAttributedString(string: "비밀번호 확인",
                                                  attributes: [NSAttributedString.Key.font :
                                                                UIFont.systemFont(ofSize: 15)])
    $0.placeholderColor = .placeholderText
    $0.borderStyle = .line
    $0.borderInactiveColor = .placeholderText
    $0.clearButtonMode = .whileEditing
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.isSecureTextEntry = true
  }
  let signUpButton = UIButton().then {
    $0.setTitle("새로운 카카오계정 만들기", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    $0.backgroundColor = .systemGray6
    $0.addTarget(self, action: #selector(touchUpLogin), for: .touchUpInside)
  }
  
  
  //MARK : - Helpers
  func layout() {
    self.view.add(self.titleLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.snp.top).offset(100)
        $0.centerX.equalTo(self.view.snp.centerX)
      }
    }
    self.view.add(self.emailTextField) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.titleLabel.snp.bottom).offset(105)
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.leading.equalTo(self.view.snp.leading).offset(20)
        $0.trailing.equalTo(self.view.snp.trailing).offset(-20)
        $0.height.equalTo(55)
      }
    }
    self.view.add(self.passwordTextField) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.emailTextField.snp.bottom).offset(10)
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.leading.equalTo(self.view.snp.leading).offset(20)
        $0.trailing.equalTo(self.view.snp.trailing).offset(-20)
        $0.height.equalTo(55)
      }
    }
    self.view.add(self.confirmPasswordTextField) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.passwordTextField.snp.bottom).offset(10)
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.leading.equalTo(self.view.snp.leading).offset(20)
        $0.trailing.equalTo(self.view.snp.trailing).offset(-20)
        $0.height.equalTo(55)
      }
    }
    self.view.add(self.signUpButton) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.confirmPasswordTextField.snp.bottom).offset(30)
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.leading.equalTo(self.view.snp.leading).offset(20)
        $0.trailing.equalTo(self.view.snp.trailing).offset(-20)
        $0.height.equalTo(40)
      }
    }
  }
  @objc func touchUpLogin() {
    if self.emailTextField.hasText &&
        self.passwordTextField.hasText &&
        self.confirmPasswordTextField.hasText {
      guard let confirmVC = self.storyboard?.instantiateViewController(
              identifier: "ConfirmViewController") as? ConfirmViewController else { return }
      confirmVC.modalPresentationStyle = .fullScreen
      confirmVC.email = self.emailTextField.text
      self.present(confirmVC, animated: true, completion: {
                    self.navigationController?.popViewController(animated: false)})
    }
    else {
      let alert = UIAlertController(title: "회원가입 실패", message: "이메일, 비밀번호를 입력해주세요😭", preferredStyle: UIAlertController.Style.alert)
      let closeAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
      alert.addAction(closeAction)
      present(alert, animated: true, completion: nil)
    }
  }
}
