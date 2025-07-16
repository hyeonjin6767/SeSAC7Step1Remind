//
//  FriendViewController.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/16/25.
//

import UIKit

class FriendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = FriendsInfo().list
    
    //테이블뷰의 아웃렛 필요
    
    @IBOutlet var mySearchBar: UISearchBar!
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        configureBackgroundColor()
        configureTableView()
    }
    //셀 높이 설정 함수는 따로 만들어줘
    func configureTableView() {
        print(#function)
        
        //부하직원 하나하나씩 인식시켜줘야지 부하직원들의 메서드들 사용 가능! //중요
        //테이블뷰컨에는 자동으로 연결되어 있어서 자동으로 인식되었는데 그냥 테이블뷰는 자동 연결 안되어 있어서 수동으로 꼭 인식시켜줘야 함
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.backgroundColor = .clear //배경을 없애면 디자인에 따라 경계지는거 방지
        
        myTableView.rowHeight = 200
        let xib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        myTableView.register(xib, forCellReuseIdentifier: "NoProfileTableViewCell")
    
    }
    
    //"테이블뷰"에서는("테이블뷰컨" 아님 주의!)
    //넘버오브어쩌구, 셀포엣, 하잇포 등등의 메서드들은 왜 안나오지? //이건 테이블뷰컨이 아니니까
    //테이블뷰는 부하직원이라 하자 : 사실 넘버오브는 부하직원(테이블뷰)의 부하직원들(UITableViewDelegate, UITableViewDataSource)이 갖고 있던거였음.
    //테블뷰 단독사용시 별도 정의가 필요 // UITableViewDelegate, UITableViewDataSource라는 넘버오브어쩌구(메서드)를 갖고 있는 2마리의 부하직원이 필요 //메서드 호출해서 사용
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function) //안찍힘.. //한 단계가 빠짐 : 부하직원들을 "인식"시켜줘야함
        //return FriendsInfo().list.count //매번 공간을 만드는 형식이라 안좋아 //그래서 아래처럼 뷰디드로드 위에서 인스턴스 생성 후 접근
        return list.count
    }
    //func앞에 오버라이드가 사라짐
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)  //안찍힘..

        let cell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath) as! NoProfileTableViewCell
        let row = list[indexPath.row]
        cell.nameLabel.text = row.name
        cell.messageLabel.text = row.message
        
        if row.phone != nil {
            cell.phoneLabel.text = "\(row.phone!)"
        } else {
            cell.phoneLabel.text = "연락처 없음"
        }
        
        if row.like {
            let image = UIImage(systemName: "heart.fill")
            cell.likeButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(systemName: "heart")
            cell.likeButton.setImage(image, for: .normal)
        }
        
        cell.backgroundColor = .clear
        return cell
        
    }
    //셀 선택시 화면 전환
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        
        //값 전달 2단계
        //vc.name = "JACK"
        vc.name = list[indexPath.row].name
        vc.message =  list[indexPath.row].message
        vc.phone = list[indexPath.row].phone
        //위에 3개의 반찬들의 반찬통 자체를 넘기면 안되나
        vc.profile = list[indexPath.row] //통째로 보내기
   
        
        present(vc, animated: true)
    }
    
}
