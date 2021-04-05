//
//  ConfirmViewController.swift
//  28th_BESOPT_1stWeek_Assignment
//
//  Created by 노한솔 on 2021/04/05.
//

import UIKit

class ConfirmViewController: UIViewController {
  
  //MARK : - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
  }
  
  //MARK : - Properties
  var email: String?
  
  let welcomeLabel = UILabel().then {
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    $0.numberOfLines = 2
  }
  let confirmButton = UIButton().then {
    $0.setTitle("확인", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    $0.backgroundColor = .systemYellow
    $0.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
  }
  
  //MARK: - Helpers
  func layout() {
    self.view.add(self.welcomeLabel) {
      if let context = self.email {
        $0.text = "\(context)님\n환영합니다"
      }
      else {
        $0.text = ""
      }
      let attString = NSMutableAttributedString(string: self.welcomeLabel.text!)
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.lineSpacing = 10
      attString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle],
                              range: NSMakeRange(0, attString.length))
      $0.attributedText = attString
      $0.textAlignment = .center
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.snp.top).offset(270)
        $0.centerX.equalTo(self.view.snp.centerX)
      }
    }
    self.view.add(self.confirmButton) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.welcomeLabel.snp.bottom).offset(135)
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.leading.equalTo(self.view.snp.leading).offset(20)
        $0.trailing.equalTo(self.view.snp.trailing).offset(-20)
        $0.height.equalTo(40)
      }
    }
  }
  @objc func touchUpBack() {
    self.dismiss(animated: true, completion: nil)
    
  }
}
