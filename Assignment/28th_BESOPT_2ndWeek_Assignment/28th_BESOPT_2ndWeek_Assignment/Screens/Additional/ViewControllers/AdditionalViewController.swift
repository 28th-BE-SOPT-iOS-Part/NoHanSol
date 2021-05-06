//
//  AdditionalViewController.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/05/06.
//

import SnapKit
import Then
import UIKit

class AdditionalViewController: UIViewController {
  
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    register()
    self.categoryCollectionView.delegate = self
    self.categoryCollectionView.dataSource = self
  }
  
  // MARK: - Components
  let titleContainerView = UIView()
  let profileContainerView = UIView()
  let separatorView = UIView()
  let categoryCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = false
    return collectionView
  }()
  let titleLabel = UILabel()
  let settingButton = UIButton()
  let profileImageView = UIImageView()
  let profileNameLabel = UILabel()
  let profileEmailLabel = UILabel()
  
  var categoryNameList = ["메일", "캘린더", "서랍", "카카오콘", "메이커스", "선물하기", "이모티콘", "프렌즈",
                          "쇼핑", "스타일", "주문하기", "멜론티켓", "게임", "뮤직", "헤어샵", "전체서비스"]
}
// MARK: - Extensions
// MARK: - Helpers
extension AdditionalViewController {
  func layoutTitleContainerView() {
    self.view.add(titleContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        $0.leading.equalTo(self.view.snp.leading)
        $0.trailing.equalTo(self.view.snp.trailing)
        $0.height.equalTo(self.view.frame.width*52/375)
      }
    }
  }
  func layoutProfileContainerView() {
    self.view.add(self.profileContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.top.equalTo(self.titleContainerView.snp.bottom)
        $0.leading.equalTo(self.view.snp.leading)
        $0.trailing.equalTo(self.view.snp.trailing)
        $0.height.equalTo(self.view.frame.width*63/375)
      }
    }
  }
  func layoutSeparatorView() {
    let separatorColor = CGColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
    self.view.add(self.separatorView) {
      $0.backgroundColor = UIColor(cgColor: separatorColor)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.profileContainerView.snp.bottom)
        $0.leading.equalTo(self.view.snp.leading).offset(18)
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.height.equalTo(1)
      }
    }
  }
  func layoutCategoryCollectionView() {
    self.view.add(categoryCollectionView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.top.equalTo(self.separatorView.snp.bottom).offset(19)
        $0.leading.equalTo(self.view.snp.leading).offset(19)
        $0.trailing.equalTo(self.view.snp.trailing).offset(-19)
        $0.bottom.equalTo(self.view.snp.bottom)
      }
    }
  }
  func layoutTitleLabel() {
    self.titleContainerView.add(self.titleLabel) {
      $0.text = "더보기"
      $0.textColor = .textBlack
      $0.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.titleContainerView.snp.centerY)
        $0.leading.equalTo(self.titleContainerView.snp.leading).offset(14)
      }
    }
  }
  func layoutSettingButton() {
    self.titleContainerView.add(self.settingButton) {
      $0.setBackgroundImage(UIImage(named: "settingIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.titleContainerView.snp.centerY)
        $0.trailing.equalTo(self.titleContainerView.snp.trailing).offset(-15)
        $0.height.width.equalTo(self.titleLabel.snp.height)
      }
    }
  }
  func layoutProfileImageView() {
    self.profileContainerView.add(self.profileImageView) {
      $0.image = UIImage(named: "friendtabProfileImg")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.profileContainerView.snp.top).offset(8)
        $0.leading.equalTo(self.titleLabel.snp.leading)
        $0.height.width.equalTo(self.view.frame.width*43/375)
      }
    }
  }
  func layoutProfileNameLabel() {
    self.profileContainerView.add(self.profileNameLabel) {
      $0.text = "김솝트"
      $0.textColor = .textBlack
      $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.profileContainerView.snp.top).offset(13)
        $0.leading.equalTo(self.profileContainerView.snp.leading).offset(64)
      }
    }
  }
  func layoutProfileEmailLabel() {
    self.profileContainerView.add(self.profileEmailLabel) {
      $0.text = "apple@sopt.org"
      $0.textColor = .greyish
      $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
      $0.snp.makeConstraints {
        $0.bottom.equalTo(self.profileContainerView.snp.bottom).offset(-15)
        $0.leading.equalTo(self.profileNameLabel.snp.leading)
      }
    }
  }
  func layout() {
    layoutTitleContainerView()
    layoutProfileContainerView()
    layoutSeparatorView()
    layoutCategoryCollectionView()
    layoutTitleLabel()
    layoutSettingButton()
    layoutProfileImageView()
    layoutProfileNameLabel()
    layoutProfileEmailLabel()
  }
  func register() {
    self.categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
  }
}
// MARK: - UICollectionViewDelegate
extension AdditionalViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width*70/375, height: self.view.frame.width*70/375)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 3
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 19
  }
  
  
}
// MARK: - UICollcetionViewDataSource
extension AdditionalViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.categoryNameList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {
      return UICollectionViewCell()
    }
    categoryCell.awakeFromNib()
    categoryCell.bind(imageName: "messageTabIcon", categoryName: self.categoryNameList[indexPath.row])
    return categoryCell
  }
}
