//
//  TestViewController.swift
//  SeSAC7Step1Remind
//
//  Created by 박현진 on 7/16/25.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    //화면 전환하면서 데이터를 전달하기 위한 순서1. 데이터를 담을 공간을 만든다.
    var contents: String = "고래밥" //빈 값으로라도 초기화는 필수(클래스 안 이니까)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //화면 전환하면서 데이터를 전달하기 위한 순서3.
        nameLabel.text = contents
        
    }
    
}
