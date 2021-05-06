//
//  CategoryCollectionViewCell.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/05/06.
//

import SnapKit
import Then
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Components
  let identifier = "CategoryCollectionViewCell"
  
  var categoryImageView = UIImageView()
  var categoryTitleLabel = UILabel().then {
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 11, weight: .regular)
  }
  
  // MARK: - Helpers
  func bind(imageName: String, categoryName: String) {
    if let image = UIImage(named: imageName) {
      self.categoryImageView.image = image
    }
    self.categoryTitleLabel.text = categoryName
  }
  
  func layout() {
    contentView.backgroundColor = .clear
    contentView.add(categoryImageView) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.contentView.snp.centerX)
        $0.top.equalTo(self.contentView.snp.top).offset(19)
        $0.height.width.equalTo(self.contentView.frame.width*20/70)
      }
    }
    contentView.add(categoryTitleLabel) {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.contentView.snp.centerX)
        $0.top.equalTo(self.categoryImageView.snp.bottom).offset(8)
      }
    }
  }
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
}
