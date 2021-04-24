//
//  TableExerciseViewController.swift
//  28th_BESOPT_3rdWeek_Seminar
//
//  Created by 노한솔 on 2021/04/24.
//

import UIKit

class TableExerciseViewController: UIViewController {
  
  @IBOutlet weak var ounceTableView: UITableView!
  let serviceImageNames: [String] =
    ["soptAppIcon1","soptAppIcon2","soptAppIcon3",
     "soptAppIcon4","soptAppIcon5","soptAppIcon6","soptAppIcon7"]
  let serviceNames: [String] =
    ["OUNCE - 집사를 위한 똑똑한 기록장", "포켓유니브", "MOMO",
     "Weathy(웨디)", "BeMe", "placepic","몽글(Mongle)"]
  let serviceDescription: [String] =
    ["우리 고양이의 까다로운 입맛 정리 서비스","MZ세대를 위한, 올인원 대학생활 관리 플랫폼","책 속의 문장과 함께 쓰는 일기",
     "나에게 돌아오는 맞춤 날씨 서비스","나를 알아가는 질문 다이어리","우리들끼리 공유하는 최애장소, 플레이스픽",
     "우리가 만드는 문장 큐레이션 플랫폼, 몽글"]
  var serviceList: [ServiceListDataModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    inputDataInModel()
    self.ounceTableView.delegate = self
    self.ounceTableView.dataSource = self
    self.ounceTableView.separatorStyle = .none
  }
  
  func inputDataInModel() {
    for i in 0..<7 {
      self.serviceList.append(ServiceListDataModel(iconImageName: self.serviceImageNames[i], name: self.serviceNames[i], description: self.serviceDescription[i]))
    }
  }
}

extension TableExerciseViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 106
  }
  
}

extension TableExerciseViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.serviceList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: "OunceTableViewCell") as? OunceTableViewCell else {
      return UITableViewCell()
    }
    serviceCell.setData(imageName: self.serviceList[indexPath.row].iconImageName,
                        name: self.serviceList[indexPath.row].name,
                        description: self.serviceList[indexPath.row].description)
    return serviceCell
  }
  
  
}
