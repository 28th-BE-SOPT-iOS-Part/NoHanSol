//
//  KakaoMainViewController.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/04/13.
//

import SnapKit
import Then
import UIKit

class KakaoMainViewController: UIViewController {
  
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
  }
  
  // MARK: - Properties
  let friendLabel = UILabel().then {
    $0.text = "친구"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
  }
  let profileContainerView = UIView()
  let profileImage = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "friendtabProfileImg"), for: .normal)
    $0.addTarget(self, action: #selector(popUpProfile), for: .touchUpInside)
  }
  
  // MARK: - Helpers
  func layout() {
    self.view.add(self.friendLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.snp.top).offset(59)
        $0.leading.equalTo(self.view.snp.leading).offset(14)
      }
    }
    self.view.add(self.profileContainerView) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.friendLabel.snp.bottom).offset(18)
        $0.leading.equalTo(self.friendLabel.snp.leading)
        $0.width.height.equalTo(59)
      }
    }
    self.profileContainerView.add(self.profileImage) {
      $0.snp.makeConstraints {
        $0.edges.equalTo(self.profileContainerView)
      }
    }
  }
  
  @objc func popUpProfile() {
    guard let profileVC = self.storyboard?.instantiateViewController(identifier: "KakaoProfileViewController") as? KakaoProfileViewController else { return }
    profileVC.modalPresentationStyle = .overFullScreen
    self.present(profileVC, animated: true, completion: nil)
  }
}
