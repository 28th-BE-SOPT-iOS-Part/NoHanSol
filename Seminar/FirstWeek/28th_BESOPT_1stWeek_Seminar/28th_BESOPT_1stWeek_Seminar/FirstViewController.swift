//
//  FirstViewController.swift
//  28th_BESOPT_1stWeek_Seminar
//
//  Created by 노한솔 on 2021/04/03.
//

import UIKit

class FirstViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var namePhoneLabel: UILabel!
  @IBOutlet weak var registerButton: UIButton!
  
  @IBAction func changeButtonClicked(_ sender: Any) {
    self.titleLabel.text = "변경 완료!"
    self.titleLabel.textColor = .red
  }
  @IBAction func touchUpShowLabel(_ sender: Any) {
    if self.nameTextField.hasText && self.phoneTextField.hasText {
      self.namePhoneLabel.text =
        "\(self.nameTextField.text!)의 번호는 \(self.phoneTextField.text!) 입니다!!"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
  }

  func layout() {
    self.titleLabel.text = "변경 직전의 라벨입니다."
    self.nameTextField.placeholder = "이름"
    self.phoneTextField.placeholder = "휴대폰 번호"
  }
}
