//
//  FriendViewController.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/16/25.
//

import UIKit

class FriendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = FriendsInfo().list //처음에만 전체데이터고 필터링된 데이터
    
    //테이블뷰의 아웃렛 필요
    
    @IBOutlet var mySearchBar: UISearchBar!
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        configureBackgroundColor()
        configureTableView()
    }
    
    @IBAction func totalButtonClicked(_ sender: UIButton) {
        
    }
    //프로필이 있는 사람만
    @IBAction func profileButtonClicked(_ sender: UIButton) {
        print(#function)
        
        //항상 데이터를 기준으로!
        //전체 데이터가 필요
        let all = FriendsInfo().list
        var filter: [Friends] = [] //프로필 이미지가 있는 친구만 담을 공간
        for item in all {
            if item.profile_image != nil {
                filter.append(item)
                print("조건문", item)
            }
        }
        dump(filter)
        list = filter
        myTableView.reloadData() //항상 데이터 수정 후에는 리로드
    }
    //전체데이터 가져와서 //데이터 수정
    @IBAction func filterButtonClicked(_ sender: UIButton) {
        let all = FriendsInfo().list
        var filter: [Friends] = []
        for item in all {
            if item.like {
                filter.append(item)
            }
        }
        list = filter
        myTableView.reloadData()
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
    
    @objc
    func likeButtonClicked(_ sender: UIButton) {
        
        print(#function, sender.tag) //sender로 받아온 lifeButton의 태그값 활용
        dump("비포") //프린트와 같은애 출력되는 형태만 다름: 보기 깔끔
        dump(list[sender.tag]) //print("비포", list[sender.tag])
        
        //list[sender.tag].like = !list[sender.tag].like //불값은 무조건 반대값이라 not연산자(!)로 써도 같은 의미(아래 이프문을 한줄로)
        list[sender.tag].like.toggle() //토글은 스위치처럼 값을 껐다킨다해서 윗줄과 의미가 같다
        /*
        if list[sender.tag].like == true {
            list[sender.tag].like = false
        } else if list[sender.tag].like == false {
            list[sender.tag].like = true
        }
         */
        
        dump("애프터")
        dump(list[sender.tag])
        //데이터 값의 변화가 있었으니 리로드해줘야
        //myTableView.reloadData() //(처음부터 끝까지 다 리로드)cellForRowAt가 다시 실행되기 때문에 하트 버튼이 바뀜
        //셀 하나만 리로드 하는게 나음 //필요한 부분만 갱신하자
        myTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade) //특정 셀 하나만 달라지는 케이스에

    }
    
    
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
        
        
        //모든 뷰는 태그값을 가지고 있으니 활용해보자
        cell.likeButton.tag = indexPath.row //섹션이 하나일 때만 문제없이 돌아가는 로직이므로 섹션이 여러개일때는 어떻게 하면 좋을지 생각해보기!
        //좋아요 버튼 바뀌는거 해보자 //"데이터"를 변경 : 0번 셀 버튼을 클릭했다면 list[0].like의 bool값을 바꾸는것을 반복 : indexPath.row //list[indexPath.row]
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside) //addTarget은 함수명옆에 괄호열고 매개변수 안적어줘도 매개변수까지 전달해주는 역할을 함!
       
        /*
        if indexPath.row == 0 {
            cell.likeButton.tag = 0
        } else indexPath.row == 1 {//이걸 무한반복할거를 위에 한줄로
        */
        
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
