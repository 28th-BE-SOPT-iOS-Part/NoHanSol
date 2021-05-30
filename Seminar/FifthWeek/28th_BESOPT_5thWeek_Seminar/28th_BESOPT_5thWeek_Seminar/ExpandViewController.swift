//
//  ExpandViewController.swift
//  28th_BESOPT_5thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/29.
//

import UIKit

class ExpandViewController: UIViewController {
  
  @IBOutlet weak var arrowImageView: UIImageView!
  @IBOutlet weak var menuViewHeight: NSLayoutConstraint!
  @IBOutlet weak var menuView: UIView!
  
  var isOpened: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  @IBAction func expandButtonClicked(_ sender: Any) {
    UIView.animate(withDuration: 0.5) {
      if self.isOpened {
        self.close()
      }
      else {
        self.open()
      }
    }
  }
  
  func open() {
    print("open")
    menuViewHeight.constant = 200
    arrowImageView.transform = CGAffineTransform(rotationAngle: .pi)
    self.view.layoutIfNeeded()
    isOpened = true
  }
  func close() {
    print("close")
    menuViewHeight.constant = 100
    arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
    self.view.layoutIfNeeded()
    isOpened = false
  }
}
