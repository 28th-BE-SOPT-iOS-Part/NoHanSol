//
//  ViewController.swift
//  28th_BESOPT_5thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/28.
//
import Lottie
import UIKit

class ViewController: UIViewController {
  
  lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    activityIndicator.center = self.view.center
    activityIndicator.color = .purple
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = .medium
    
    activityIndicator.stopAnimating()
    return activityIndicator
  }()
  
  lazy var lottieView: AnimationView = {
    let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
    animationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    animationView.center = self.view.center
    animationView.contentMode = .scaleAspectFill
    animationView.stop()
    animationView.isHidden = true
    return animationView
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(activityIndicator)
    self.view.addSubview(lottieView)
  }
  
  @IBAction func startButtonClicked(_ sender: Any) {
//    activityIndicator.startAnimating()
    lottieView.isHidden = false
    lottieView.play()
  }
  @IBAction func stopButtonClicked(_ sender: Any) {
//    activityIndicator.stopAnimating()
    lottieView.isHidden = true
    lottieView.stop()
  }
  
  
  
}

