//
//  MainViewController.swift
//  28th_BESOPT_3rdWeek_Seminar
//
//  Created by 노한솔 on 2021/04/24.
//

import UIKit

class MainViewController: UIViewController, SampleProtocol {
  func dataSend(data: String) {
    dataLabel.text = data
  }
  
  
  @IBOutlet weak var dataLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  @IBAction func nextButtonClicked(_ sender: Any) {
    guard let nextVC = self.storyboard?.instantiateViewController(identifier: "DelegateViewController") as? DelegateViewController else {return}
    nextVC.delegate = self
    self.navigationController?.pushViewController(nextVC, animated: true)
  }
  
  @IBAction func toThridButtonClicked(_ sender: Any) {
    guard let thirdVC = self.storyboard?.instantiateViewController(identifier: "SecondDelegateViewController") as? SecondDelegateViewController else {return}
    
    self.navigationController?.pushViewController(thirdVC, animated: true)
  }
}
