//
//  SampleNetworkViewController.swift
//  28th_BESOPT_4thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/08.
//

import Alamofire
import UIKit

class SampleNetworkViewController: UIViewController {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func getButtonClicked(_ sender: Any) {
    GetPersonDataService.shared.getPersonDataInformation { (response) in
      switch response {
      case .success(let personData):
        if let data = personData as? Person {
          self.nameLabel.text = data.name
          self.messageLabel.text = data.message
        }
      case .requestErr(let message):
        print("requestErr", message)
      case .pathErr:
        print("pathErr")
      case .serverErr:
        print("serverErr")
      case .networkFail:
        print("networkFail")
      }
    }
  }
}
