//
//  ViewController.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/16/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var goFriendButton: UIButton!
    @IBOutlet var presentTestButton: UIButton!
    @IBOutlet var pushTestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundColor()
        //goFriendButton가 2번 반복되는거 거슬려..
        //버튼안에 버튼이 들어가고 있는 꼴 //그래서 매개변수 중에 버튼을 제외하자
        
        goFriendButton.configure(title: "Go Friend")
        presentTestButton.configure(title: "Present")
        pushTestButton.configure(title: "Push")
        
        /*
        configureBackgroundColor()
        configureButton(goFriendButton, title: "Go Friend")
        configureButton(presentTestButton, title: "Present")
        configureButton(pushTestButton, title: "Push")
         */

        //"액션을 드래그 대신 "코드"로 연결해보자"
        //"addTarget"는 옛날 objective-C 코드가 남아 있음 //함수 호출 연산자인 함수명 끝에 "괄호"는 생략하고 "함수 이름"만(미리 실행되는걸 방지하기 위해 "연결"만 해준다는 의미로 함수 이름만 작성) //함수에 @objc도 붙여줘야
        goFriendButton.addTarget(self, action: #selector(goFriendButtonClicked), for: .touchUpInside)
        presentTestButton.addTarget(self, action: #selector(presentTestButtonClicked), for: .touchUpInside)
       
    }
    
    @objc //앞에 골뱅이(Swift Attributes : @) //objective-C의 흔적
    func goFriendButtonClicked() {
        print(#function)
        //3단계
        let sb = UIStoryboard(name: "Friend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FriendViewController") as! FriendViewController
        present(vc, animated: true)
        
    }

    @objc func presentTestButtonClicked() {
        print(#function)
        //let sb = UIStoryboard(name: "Main", bundle: nil) //같은 뷰컨 안에 있는 경우(Main에 있는 경우)는 1단계 생략가능 //같은 스토리보드에서 다른 뷰컨으로 이동할 때 생략가능
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        
        
        //vc.nameLabel.text = "닉네임 \(Int.random(in: 1...100))" //이게 에러가 나야 정상
        //"시점"의 문제: 이 코드가 실행될 시점에는 아웃렛이 다 만들어져 있어야 문제가 없음 //근데, 아웃렛은 생각보다 늦게 만들어져서 에러 발생.(아웃렛이 있어야 글자를 넣지 그래서 없다는 nil 에러)
        //그래서 화면 전환을 할 때는 아웃렛을 가져오지 않도록 개발을 하자 : 우회적인 방법으로 해
        //그럼 다음화면에 값을 전달하고 싶을 땐?
        
        
        //화면 전환하면서 데이터를 전달하기 위한 순서2. contents라는 다음 화면의 공간에 내용을 넣어주기
        vc.contents = "닉네임 \(Int.random(in: 1...100))"
        
        present(vc, animated: true)
    }
    
    //테이블뷰컨의 한계?
}
