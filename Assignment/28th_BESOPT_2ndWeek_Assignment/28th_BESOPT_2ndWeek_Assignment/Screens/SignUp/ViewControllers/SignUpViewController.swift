//
//  SignUpViewController.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/04/13.
//

import SnapKit
import TextFieldEffects
import Then
import UIKit

class SignUpViewController: UIViewController {
    
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    self.navigationController?.navigationBar.isHidden = true
  }
  
  // MARK: - Properties
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
  
  
  // MARK: - Helpers
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
    // 1. 텍스트필드 모두 텍스트가 입력되었을 떄
    if self.emailTextField.hasText &&
        self.passwordTextField.hasText &&
        self.confirmPasswordTextField.hasText {
      // 1-1. 텍스트필드 모두 텍스트가 입력되었지만 패스워드와 확인패스워드가 불일치할 때
      if self.passwordTextField.text != self.confirmPasswordTextField.text {
        let alert = UIAlertController(title: "회원가입 실패",
                                      message: "다른 패스워드를 입력하셨네요😭",
                                      preferredStyle: UIAlertController.Style.alert)
        let closeAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(closeAction)
        present(alert, animated: true, completion: {
          self.passwordTextField.text = nil
          self.confirmPasswordTextField.text = nil
        })
      }
      // 1-2. 텍스트필드 모두 텍스트가 입력되고 패스워드도 일치할 때
      else {
        guard let kakaoVC = self.storyboard?.instantiateViewController(
                identifier: "KakaoMainViewController") as? KakaoMainViewController else { return }
        kakaoVC.modalPresentationStyle = .fullScreen
        self.present(kakaoVC, animated: true, completion: {
                      self.navigationController?.popViewController(animated: false)})
      }
    }
    // 2. 텍스트필드에 하나라도 입력값이 없을 때 UIAlertController를 띄워 노티를 제공
    else {
      let alert = UIAlertController(title: "회원가입 실패",
                                    message: "이메일, 비밀번호를 입력해주세요😭",
                                    preferredStyle: UIAlertController.Style.alert)
      let closeAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
      alert.addAction(closeAction)
      present(alert, animated: true, completion: {
        self.emailTextField.text = nil
        self.passwordTextField.text = nil
        self.confirmPasswordTextField.text = nil
      })
    }
  }
}
