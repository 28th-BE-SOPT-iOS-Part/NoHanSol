//
//  OunceTableViewCell.swift
//  28th_BESOPT_3rdWeek_Seminar
//
//  Created by 노한솔 on 2021/04/24.
//

import UIKit

class OunceTableViewCell: UITableViewCell {
  
  let identifier = "OunceTableViewCell"
  
  @IBOutlet weak var appImageView: UIImageView!
  @IBOutlet weak var appNameLabel: UILabel!
  @IBOutlet weak var appDescriptionLabel: UILabel!
  @IBOutlet weak var downloadButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  @IBAction func downloadButtonClicked(_ sender: Any) {
  }
  func setData(imageName: String,
               name: String,
               description: String) {
    if let image = UIImage(named: imageName) {
      appImageView.image = image
    }
    appNameLabel.text = name
    appDescriptionLabel.text = description
  }
  
}
