//
//  KakaoProfileViewController.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/04/13.
//

import SnapKit
import Then
import UIKit

class KakaoProfileViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    swipeDownToDismiss()
  }
  
  let closeButton = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "profileCloseBtn"), for: .normal)
    $0.addTarget(self, action: #selector(swipeDown), for: .touchUpInside)
  }
  let profileImageContainerView = UIView()
  let profileImageView = UIImageView().then {
    $0.image = UIImage(named: "profileUserImg")
  }
  let nameLabel = UILabel().then {
    $0.text = "노한솔"
    $0.textColor = .white
    $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
  }
  let seperatorLineView = UIView().then {
    $0.backgroundColor = UIColor(red: 159/255, green: 167/255, blue: 173/155, alpha: 1)
  }
  let stackContainerView = UIView()
  let stackView = UIStackView().then {
    $0.axis = .horizontal
    $0.distribution = .fillEqually
  }
  
  let talkContainerView = UIView()
  let editContainerView = UIView()
  let storyContainerView = UIView()
  
  let talkContainerButton = UIButton().then {
    $0.showsTouchWhenHighlighted = true
  }
  let editContainerButton = UIButton().then {
    $0.showsTouchWhenHighlighted = true
  }
  let storyContainerButton = UIButton().then {
    $0.showsTouchWhenHighlighted = true
  }
  
  let talkImageContainerView = UIView()
  let editImageContainerView = UIView()
  let storyImageContainerView = UIView()
  
  let talkImageView = UIImageView().then {
    $0.image = UIImage(named: "profileTalkImg")
  }
  let editImageView = UIImageView().then {
    $0.image = UIImage(named: "profileEditImg")
  }
  let storyImageView = UIImageView().then {
    $0.image = UIImage(named: "profileStoryImg")
  }
  
  let talkLabel = UILabel().then {
    $0.text = "나와의 채팅"
    $0.textColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    $0.textAlignment = .center
  }
  let editLabel = UILabel().then {
    $0.text = "프로필 편집"
    $0.textColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    $0.textAlignment = .center
  }
  let storyLabel = UILabel().then {
    $0.text = "카카오스토리"
    $0.textColor = UIColor(red: 236/255, green: 237/255, blue: 238/255, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    $0.textAlignment = .center
  }
  
  func layout() {
    self.view.backgroundColor = UIColor(red: 135/255, green: 145/255, blue: 152/255, alpha: 1)
    self.view.add(self.closeButton) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.snp.top).offset(58)
        $0.leading.equalTo(self.view.snp.leading).offset(18)
        $0.width.height.equalTo(14)
      }
    }
   
    self.view.add(self.stackContainerView) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.bottom.equalTo(self.view.snp.bottom).offset(-47)
        $0.leading.equalTo(self.view.snp.leading).offset(44)
        $0.height.equalTo(72)
      }
    }
    self.stackContainerView.add(self.stackView) {
      $0.snp.makeConstraints {
        $0.edges.equalTo(self.stackContainerView.snp.edges)
      }
    }
    
    self.stackView.addArrangedSubview(self.talkContainerView)
    self.stackView.addArrangedSubview(self.editContainerView)
    self.stackView.addArrangedSubview(self.storyContainerView)
    
    self.talkContainerView.add(self.talkContainerButton) {
      $0.snp.makeConstraints {
        $0.edges.equalTo(self.talkContainerView.snp.edges)
      }
    }
    self.editContainerView.add(self.editContainerButton) {
      $0.snp.makeConstraints {
        $0.edges.equalTo(self.editContainerView.snp.edges)
      }
    }
    self.storyContainerView.add(self.storyContainerButton) {
      $0.snp.makeConstraints {
        $0.edges.equalTo(self.storyContainerView.snp.edges)
      }
    }
    self.talkContainerView.add(self.talkImageView) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.talkContainerView.snp.centerX)
        $0.top.equalTo(self.talkContainerView.snp.top).offset(22)
        $0.height.equalTo(17.6)
        $0.width.equalTo(18.9)
      }
    }
    self.editContainerView.add(self.editImageView) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.editContainerView.snp.centerX)
        $0.top.equalTo(self.editContainerView.snp.top).offset(22)
        $0.height.equalTo(17.6)
        $0.width.equalTo(18.9)
      }
    }
    self.storyContainerView.add(self.storyImageView) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.storyContainerView.snp.centerX)
        $0.top.equalTo(self.storyContainerView.snp.top).offset(22)
        $0.height.equalTo(17.6)
        $0.width.equalTo(18.9)
      }
    }
    self.talkContainerView.add(self.talkLabel) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.talkContainerView.snp.centerX)
        $0.bottom.equalTo(self.talkContainerView.snp.bottom).offset(-13)
      }
    }
    self.editContainerView.add(self.editLabel) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.editContainerView.snp.centerX)
        $0.bottom.equalTo(self.editContainerView.snp.bottom).offset(-13)
      }
    }
    self.storyContainerView.add(self.storyLabel) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.storyContainerView.snp.centerX)
        $0.bottom.equalTo(self.storyContainerView.snp.bottom).offset(-13)
      }
    }
    self.view.add(self.seperatorLineView) {
      $0.snp.makeConstraints {
        $0.bottom.equalTo(self.stackContainerView.snp.top).offset(-12)
        $0.leading.equalTo(self.view.snp.leading)
        $0.trailing.equalTo(self.view.snp.trailing)
        $0.height.equalTo(1)
      }
    }
    self.view.add(self.nameLabel) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.bottom.equalTo(self.seperatorLineView.snp.top).offset(-42)
      }
    }
    self.view.add(self.profileImageContainerView) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.bottom.equalTo(self.nameLabel.snp.top).offset(-8)
        $0.height.width.equalTo(97)
      }
    }
    self.profileImageContainerView.add(self.profileImageView) {
      $0.snp.makeConstraints {
        $0.edges.equalTo(self.profileImageContainerView.snp.edges)
      }
    }
  }
  func swipeDownToDismiss() {
    let swipeAction = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
    swipeAction.direction = .down
    self.view.addGestureRecognizer(swipeAction)
  }
  @objc func printClickedLog() {
    print("눌렸습니다.")
  }
  @objc func swipeDown() {
    self.dismiss(animated: true, completion: nil)
  }
  
}
