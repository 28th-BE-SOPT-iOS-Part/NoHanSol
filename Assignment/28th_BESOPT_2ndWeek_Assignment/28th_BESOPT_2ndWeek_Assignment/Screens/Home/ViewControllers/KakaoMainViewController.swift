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
  let titleContainerView = UIView().then {
    $0.backgroundColor = .clear
  }
  let friendLabel = UILabel().then {
    $0.text = "친구"
    $0.textColor = .textBlack
    $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
  }
  let settingButton = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "settingIcon"), for: .normal)
    $0.isUserInteractionEnabled = true
    $0.addTarget(self, action: #selector(popUpMenuAction), for: .touchUpInside)
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
  let separatorView = UIView().then {
    $0.backgroundColor = UIColor(cgColor:
                                  CGColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1))
  }
  let friendTableView = UITableView().then {
    $0.separatorStyle = .none
  }
  // MARK: - Helpers
  func layout() {
    self.view.add(self.titleContainerView) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        $0.leading.equalTo(self.view.snp.leading)
        $0.trailing.equalTo(self.view.snp.trailing)
        $0.height.equalTo(self.view.frame.height*52/812)
      }
    }
    self.titleContainerView.add(self.friendLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.titleContainerView.snp.top).offset(15)
        $0.leading.equalTo(self.titleContainerView.snp.leading).offset(14)
      }
    }
    self.titleContainerView.add(self.settingButton) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.friendLabel.snp.top)
        $0.trailing.equalTo(self.titleContainerView.snp.trailing).offset(-15)
        $0.width.height.equalTo(self.friendLabel.snp.height)
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
    self.view.add(self.separatorView) {
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
                            [FriendListModel(friendImageName: "profileImage1", friendName: "안솝트", friendMessage: "신전떡볶이"),
                             FriendListModel(friendImageName: "profileImage2", friendName: "강솝트", friendMessage: "엽기떡볶이"),
                             FriendListModel(friendImageName: "profileImage3", friendName: "나솝트", friendMessage: "배떡"),
                             FriendListModel(friendImageName: "profileImage4", friendName: "노솝트", friendMessage: "응급실떡볶이"),
                             FriendListModel(friendImageName: "profileImage5", friendName: "동솝트", friendMessage: "걸작떡볶이&치킨"),
                             FriendListModel(friendImageName: "profileImage6", friendName: "단솝트", friendMessage: "크레이지떡볶이"),
                             FriendListModel(friendImageName: "profileImage7", friendName: "류솝트", friendMessage: "정원분식"),
                             FriendListModel(friendImageName: "profileImage8", friendName: "이솝트", friendMessage: "죠스떡볶이"),
                             FriendListModel(friendImageName: "profileImage9", friendName: "최솝트", friendMessage: "시장떡볶이"),
                             FriendListModel(friendImageName: "profileImage10", friendName: "박솝트", friendMessage: "떡군이네떡볶이"),
                             FriendListModel(friendImageName: "profileImage10", friendName: "우솝트", friendMessage: "청년다방"),
                             FriendListModel(friendImageName: "profileImage10", friendName: "유솝트", friendMessage: "미미네떡볶이"),
                             FriendListModel(friendImageName: "profileImage10", friendName: "백솝트", friendMessage: "홍대마늘떡볶이"),
                             FriendListModel(friendImageName: "profileImage10", friendName: "고솝트", friendMessage: "또보겠지떡볶이")])
  }
  
  func setupContextMenu() -> UIMenu {
    let chatAction = UIAction(title: "채팅하기") {action in}
    let voicetAction = UIAction(title: "보이스톡") {action in}
    let faceAction = UIAction(title: "페이스톡") {action in}
    let presentAction = UIAction(title: "선물하기") {action in}
    return UIMenu(children: [chatAction, voicetAction, faceAction, presentAction])
  }
  
  @objc func popUpProfile() {
    guard let profileVC = self.storyboard?.instantiateViewController(identifier: "KakaoProfileViewController") as? KakaoProfileViewController else { return }
    profileVC.modalPresentationStyle = .overFullScreen
    self.present(profileVC, animated: true, completion: nil)
  }
  
  @objc func popUpMenuAction(_ sender: UIButton) {
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let editAction = UIAlertAction(title: "편집", style: .default, handler: nil)
    let manageAction = UIAlertAction(title: "친구 관리", style: .default, handler: nil)
    let settingAction = UIAlertAction(title: "전체 설정", style: .default, handler: nil)
    let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    alertController.addAction(editAction)
    alertController.addAction(manageAction)
    alertController.addAction(settingAction)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil)
  }
}

extension KakaoMainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return self.view.frame.height*50/812
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
    friendCell.selectionStyle = .none
    friendCell.setData(friendImageName: self.friendList[indexPath.row].friendImageName, friendName: self.friendList[indexPath.row].friendName, friendMessage: self.friendList[indexPath.row].friendMessage)
    return friendCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let profileViewController = KakaoProfileViewController()
    profileViewController.modalPresentationStyle = .overFullScreen
    profileViewController.profileImageView.image = UIImage(named: self.friendList[indexPath.row].friendImageName)
    profileViewController.nameLabel.text = self.friendList[indexPath.row].friendName
    self.present(profileViewController, animated: true, completion: nil)
  }
  
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let blockAction = UIContextualAction(style: .destructive, title: "차단", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
    })
    blockAction.backgroundColor = .red
    let hideAction = UIContextualAction(style: .normal, title: "숨김", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
    })
    hideAction.backgroundColor = .steel
    return UISwipeActionsConfiguration(actions:[blockAction,hideAction])
  }
  
  func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
    return UIContextMenuConfiguration(identifier: nil,
                                      previewProvider: { () -> UIViewController? in
                                        let profileViewController = KakaoProfileViewController()
                                        profileViewController.profileImageView.image = UIImage(named: self.friendList[indexPath.row].friendImageName)
                                        profileViewController.nameLabel.text = self.friendList[indexPath.row].friendName
                                        return profileViewController
                                        },
                                      actionProvider: { suggestedActions in
                                        return self.setupContextMenu()
                                      })
    
  }
}
