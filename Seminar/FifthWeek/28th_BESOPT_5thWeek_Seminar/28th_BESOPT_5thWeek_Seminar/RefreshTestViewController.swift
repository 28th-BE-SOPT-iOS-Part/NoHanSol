//
//  RefreshTestViewController.swift
//  28th_BESOPT_5thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/29.
//

import UIKit
import Lottie

class RefreshTestViewController: UIViewController {
  
  @IBOutlet weak var refreshTableView: UITableView!
  final let numberOfCell = 10
  let refreshControl = UIRefreshControl()
  
  lazy var lottieView: AnimationView = {
    let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
    animationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    let centerX = UIScreen.main.bounds.width/2
    animationView.center = CGPoint(x: centerX, y: 40)
    animationView.contentMode = .scaleAspectFill
    animationView.stop()
    animationView.isHidden = true
    return animationView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    refreshTableView.delegate = self
    refreshTableView.dataSource = self
    initRefresh()
  }
  
  func initRefresh() {
    refreshControl.addTarget(self, action: #selector(self.refreshTable(refresh:)), for: .valueChanged)
    refreshControl.addSubview(lottieView)
    refreshControl.tintColor = .clear
    refreshTableView.refreshControl = refreshControl
  }
  
  @objc func refreshTable(refresh: UIRefreshControl) {
    print("새로고침 시작")
    lottieView.isHidden = false
    lottieView.play()
    
    DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
      self.refreshTableView.reloadData()
      self.lottieView.isHidden = true
      self.lottieView.stop()
      refresh.endRefreshing()
    }
  }
  
}
extension RefreshTestViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }
}
extension RefreshTestViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.numberOfCell
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "RefreshTableViewCell", for: indexPath) as? RefreshTableViewCell else { return UITableViewCell() }
    cell.titleLabel.text = "\(indexPath.row)"
    cell.awakeFromNib()
    return cell
  }
  
  
}
