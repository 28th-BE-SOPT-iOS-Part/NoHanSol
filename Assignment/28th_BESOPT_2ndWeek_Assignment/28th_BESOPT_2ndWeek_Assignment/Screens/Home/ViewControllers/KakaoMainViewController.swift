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
    putInFriendList()
    registerCell()
    self.friendTableView.delegate = self
    self.friendTableView.dataSource = self
    self.friendTableView.estimatedRowHeight = CGFloat(self.friendList.count*50)
    self.friendTableView.rowHeight = UITableView.automaticDimension
    self.friendTableView.separatorStyle = .none
  }
  
  // MARK: - Properties
  var friendList: [FriendListModel] = []
  let friendLabel = UILabel().then {
    $0.text = "친구"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
  }
  let profileContainerView = UIView()
  let profileImageContainerView = UIView()
  let profileImage = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "friendtabProfileImg"), for: .normal)
    $0.addTarget(self, action: #selector(popUpProfile), for: .touchUpInside)
  }
  let profileNameLabel = UILabel().then {
    $0.text = "김솝트"
    $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    $0.textColor = UIColor(cgColor: CGColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1))
  }
  let profileMessageLabel = UILabel().then {
    $0.text = "상태메시지는 여기에"
    $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
    $0.textColor = UIColor(cgColor: CGColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1))
  }
  let seperatorView = UIView().then {
    $0.backgroundColor = UIColor(cgColor:
                                  CGColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1))
  }
  let friendTableView = UITableView().then {
    $0.separatorStyle = .none
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
        $0.leading.equalTo(self.view.snp.leading)
        $0.trailing.equalTo(self.view.snp.trailing)
        $0.height.equalTo(73)
      }
    }
    self.profileContainerView.add(self.profileImageContainerView) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.profileContainerView.snp.top).offset(5)
        $0.leading.equalTo(self.friendLabel.snp.leading)
        $0.width.height.equalTo(59)
      }
    }
    self.profileImageContainerView.add(self.profileImage) {
      $0.snp.makeConstraints {
        $0.edges.equalTo(self.profileImageContainerView)
      }
    }
    self.profileContainerView.add(self.profileNameLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.profileContainerView.snp.top).offset(15)
        $0.leading.equalTo(self.profileImage.snp.trailing).offset(10)
      }
    }
    self.profileContainerView.add(self.profileMessageLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.profileNameLabel.snp.bottom).offset(9)
        $0.leading.equalTo(self.profileNameLabel.snp.leading)
      }
    }
    self.view.add(self.seperatorView) {
      $0.snp.makeConstraints {
        $0.bottom.equalTo(self.profileContainerView.snp.bottom)
        $0.width.equalTo(self.view.snp.width)
        $0.height.equalTo(1)
        $0.centerX.equalTo(self.view.snp.centerX)
      }
    }
    self.view.add(friendTableView) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.profileContainerView.snp.bottom)
        $0.leading.equalTo(self.view.snp.leading)
        $0.trailing.equalTo(self.view.snp.trailing)
        $0.bottom.equalTo(self.view.snp.bottom)
      }
    }
  }
  
  private func registerCell() {
    friendTableView.register(FriendTableViewCell.self,
                             forCellReuseIdentifier: FriendTableViewCell.reuseIdentifier)
  }
  
  func putInFriendList() {
    self.friendList.append(contentsOf:
                            [FriendListModel(friendImageName: "profileImage1", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage2", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage3", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage4", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage5", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage6", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage7", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage8", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage9", friendName: "안솝트", friendMessage: "배고파요"),
                             FriendListModel(friendImageName: "profileImage10", friendName: "안솝트", friendMessage: "배고파요")])
  }
  
  @objc func popUpProfile() {
    guard let profileVC = self.storyboard?.instantiateViewController(identifier: "KakaoProfileViewController") as? KakaoProfileViewController else { return }
    profileVC.modalPresentationStyle = .overFullScreen
    self.present(profileVC, animated: true, completion: nil)
  }
}

extension KakaoMainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}
extension KakaoMainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.friendList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let friendCell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as? FriendTableViewCell else {
      return UITableViewCell()
    }
    friendCell.awakeFromNib()
    friendCell.setData(friendImageName: self.friendList[indexPath.row].friendImageName, friendName: self.friendList[indexPath.row].friendName, friendMessage: self.friendList[indexPath.row].friendMessage)
    return friendCell
  }
  
  
}
