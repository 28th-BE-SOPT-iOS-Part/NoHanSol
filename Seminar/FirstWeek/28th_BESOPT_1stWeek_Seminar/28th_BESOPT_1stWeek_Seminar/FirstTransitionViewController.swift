//
//  FirstTransitionViewController.swift
//  28th_BESOPT_1stWeek_Seminar
//
//  Created by 노한솔 on 2021/04/03.
//

import UIKit
import Then

class FirstTransitionViewController: UIViewController {
  
  @IBOutlet weak var transitionButton: UIButton!
  @IBOutlet weak var contextTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    self.contextTextField.delegate = self
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  @IBAction func touchUpTransition(_ sender: Any) {
    if self.contextTextField.hasText {
      guard let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondTransitionViewController") as? SecondTransitionViewController else { return }
      secondVC.message = contextTextField.text
      secondVC.modalPresentationStyle = .fullScreen
      //    self.present(secondVC, animated: true, completion: nil)
      self.navigationController?.pushViewController(secondVC, animated: true)
    }
    else {
      let alert = UIAlertController(title: "넘어갈 수 없어요", message: "텍스트를 입력해주세요😭", preferredStyle: UIAlertController.Style.alert)
      let closeAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
      alert.addAction(closeAction)
      present(alert, animated: true, completion: nil)
    }
  }
  
  func layout() {
    self.view.backgroundColor = .orange
    self.transitionButton.then {
      $0.setTitle("넘어가기", for: .normal)
      $0.setTitleColor(.white, for: .normal)
    }
    self.contextTextField.then {
      $0.placeholder = "전달하고 싶은 내용"
      $0.keyboardType = .default
      $0.clearButtonMode = .whileEditing
      $0.enablesReturnKeyAutomatically = true
      $0.autocorrectionType = .no
      $0.autocapitalizationType = .none
      $0.returnKeyType = .done
    }
  }
}

extension FirstTransitionViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    self.view.endEditing(true)
  }
  @objc func keyboardWillShow(_ sender: Notification) {
    self.view.frame.origin.y = -150
  }
  @objc func keyboardWillHide(_ sender: Notification) {
    self.view.frame.origin.y = 0
  }
}
