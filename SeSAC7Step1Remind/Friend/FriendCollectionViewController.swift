//
//  FriendCollectionViewController.swift
//  SeSAC7Step1Remind
//
//  Created by 박현진 on 7/17/25.
//

import UIKit

//테이블뷰랑 똑같 - 객체 이름만 컬렉션뷰로 바뀜: row가 item으로 바뀜

class FriendCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource { //컬렉션뷰 부하직원들도 추가
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "FriendCollectionViewCell", bundle: nil)
        myCollectionView.register(xib, forCellWithReuseIdentifier: "FriendCollectionViewCell")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        //heightforitem라는건 없나? : 테이블뷰와 다르게 셀의 높이만 설정하면 안되고 "너비"도 고려해야 함
        //셀의 너비와 높이 설정 필요 //셀이 4개 있다 가정하에
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width //UI의 너비를 알려줌 :디바이스 너비-셀의 너비*4 나누기4
        let cellWidth = deviceWidth - (16 * 2) - (16 * 3) //그림 그려보기
        layout.itemSize = CGSize(width: cellWidth/4, height: cellWidth/4)//비율에 맞춰서 잡아
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumInteritemSpacing = 16 //셀과 셀 사이의 간격
        layout.minimumLineSpacing = 16 //셀의 위아래 간격
        layout.scrollDirection = .vertical //수직스크롤 수평스크롤
        myCollectionView.collectionViewLayout = layout
        
    }
    
    //테이블뷰와 같아
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.item) //indexPath.row아님 주의!
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionViewCell", for: indexPath) as! FriendCollectionViewCell
        cell.nameLabel.text = "\(indexPath)" //indexPath.row아님 주의!
        return cell
        
    }
    
}
