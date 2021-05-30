//
//  AnimationViewController.swift
//  28th_BESOPT_5thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/29.
//

import UIKit

class AnimationViewController: UIViewController {
  
  @IBOutlet weak var soptImageView: UIImageView!
  @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  @IBAction func startButtonClicked(_ sender: Any) {
    self.imageTopConstraint.constant = 400
    UIView.animate(withDuration: 4) {
      self.view.layoutIfNeeded()
      self.soptImageView.alpha = 0.5
    }
  }
  
}
