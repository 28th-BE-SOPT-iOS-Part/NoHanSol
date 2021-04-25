//
//  MusicCollectionViewCell.swift
//  28th_BESOPT_3rdWeek_Seminar
//
//  Created by 노한솔 on 2021/04/24.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var musicImageView: UIImageView!
  @IBOutlet weak var musicTitleLabel: UILabel!
  @IBOutlet weak var musicSingerLabel: UILabel!
  
  func setData(imageTitle: String, musicName: String, singerName: String) {
    if let image = UIImage(named: imageTitle) {
      musicImageView.image = image
    }
    musicTitleLabel.text = musicName
    musicSingerLabel.text = singerName
  }
}
