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
  
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    panDownToDismiss()
  }
  
  // MARK: - Properties
  let closeButton = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "profileCloseBtn"), for: .normal)
    $0.addTarget(self, action: #selector(closeButtonClicked), for: .touchUpInside)
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
  
  // MARK: - Helpers
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
  
  func panDownToDismiss() {
    let panAction = UIPanGestureRecognizer(target: self, action: #selector(swipeDown))
    self.view.addGestureRecognizer(panAction)
  }
  
  @objc func printClickedLog() {
    print("눌렸습니다.")
  }
  
  @objc func closeButtonClicked() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc func swipeDown(_ sender: UIPanGestureRecognizer) {
    // flicker 속도 기준점. 아이폰에서 쓸 경우엔 300정도이지만 시뮬레이터는 마우스 속도가 워낙 빨라 2000으로 설정.
    let speedThreshold: CGFloat = 2000
    let velocity = sender.velocity(in: view)
    let location = sender.translation(in: view)
    let firstLocation = CGPoint(x: 0, y: 0)
    let interval = location.y - firstLocation.y
    if velocity.y.magnitude > speedThreshold {
      dismiss(animated: true, completion: nil)
    }
    else {
      if sender.state == .changed && interval > 0 {
        view.frame = CGRect(x: 0, y: interval, width: view.frame.width, height: view.frame.height)
      }
      else if sender.state == .ended {
        if interval > view.frame.height/2 {
          dismiss(animated: true, completion: nil)
        }
        else {
          UIView.animate(withDuration: 0.2, animations:
                          {self.view.frame = CGRect(x: 0,
                                                    y: 0,
                                                    width: self.view.frame.width,
                                                    height: self.view.frame.height)})
          
        }
      }
    }
  }
}
