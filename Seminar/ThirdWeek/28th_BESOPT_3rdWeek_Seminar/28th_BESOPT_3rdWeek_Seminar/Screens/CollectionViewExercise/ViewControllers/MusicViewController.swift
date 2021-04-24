//
//  MusicViewController.swift
//  28th_BESOPT_3rdWeek_Seminar
//
//  Created by 노한솔 on 2021/04/24.
//

import UIKit

class MusicViewController: UIViewController {
  
  @IBOutlet weak var musicCollectionView: UICollectionView!
  
  var musicList: [MusicListModel] = []
  let musicCoverNames: [String] = ["musicAlbum1", "musicAlbum2","musicAlbum3","musicAlbum4"]
  let musicTitleNames: [String] = ["가습기","Thick and Thin","시공간","NISEKOI"]
  let musicSingerNames: [String] = ["한요한","LANY","기리보이","Futuristic Swaver"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setMusicList()
    musicCollectionView.delegate = self
    musicCollectionView.dataSource = self
  }
  
  func setMusicList() {
    for i in 0..<4 {
      self.musicList.append(MusicListModel(coverName: musicCoverNames[i],
                                           musicTitle: musicTitleNames[i],
                                           singerName: musicSingerNames[i]))
    }
  }

}

extension MusicViewController: UICollectionViewDelegate {
  
}

extension MusicViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width
    let cellwidth = width * 177/375
    let cellheight = cellwidth * 205/177
    return CGSize(width: cellwidth, height: cellheight)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 3
  }
}

extension MusicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.musicList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let musicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as? MusicCollectionViewCell else {
      return UICollectionViewCell()
    }
    musicCell.setData(imageTitle: self.musicList[indexPath.row].coverName,
                      musicName: self.musicList[indexPath.row].musicTitle,
                      singerName: self.musicList[indexPath.row].singerName)
    return musicCell
  }
  
  
}
