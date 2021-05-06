//
//  FriendTableViewCell.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/04/25.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
  
  let friendImageContainerView = UIView()
  let friendImageView = UIImageView()
  let friendNameLabel = UILabel().then {
    $0.textColor = UIColor(cgColor: CGColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1))
    $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
  }
  let friendMessageLabel = UILabel().then {
    $0.textColor = UIColor(cgColor: CGColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1))
    $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
  }
  weak var viewController: UIViewController?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
  
  
  func layout() {
    self.contentView.add(friendImageContainerView) {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.contentView.snp.centerY)
        $0.leading.equalTo(self.contentView.snp.leading).offset(16)
        $0.height.equalTo(41)
        $0.width.equalTo(44)
      }
    }
    self.friendImageContainerView.add(friendImageView) {
      $0.snp.makeConstraints {
        $0.edges.equalTo(self.friendImageContainerView.snp.edges)
      }
    }
    self.contentView.add(friendNameLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.contentView.snp.top).offset(10)
        $0.leading.equalTo(self.friendImageContainerView.snp.trailing).offset(11)
      }
    }
    self.contentView.add(friendMessageLabel) {
      $0.snp.makeConstraints {
        $0.bottom.equalTo(self.contentView.snp.bottom).offset(-11)
        $0.leading.equalTo(self.friendNameLabel.snp.leading)
      }
    }
  }
  
  func setData(friendImageName: String, friendName: String, friendMessage: String) {
    if let image = UIImage(named: friendImageName) {
      self.friendImageView.image = image
    }
    self.friendNameLabel.text = friendName
    self.friendMessageLabel.text = friendMessage
  }
  
}
