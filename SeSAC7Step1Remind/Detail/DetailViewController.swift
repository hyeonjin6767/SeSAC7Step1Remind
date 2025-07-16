//
//  DetailViewController.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/16/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    
    //1단계
    var name = ""
    var message: String? = "" //nil도 들어갈 수 있는 형태
    var phone: Int? = 0
    
    //반찬"통"용 공간 //통째 받아오기
    var profile: Friends = Friends(name: "", message: nil, profile_image: nil, phone: nil, like: false) //빈공간 만들어주기
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundColor()
        
        //3단계
        //myLabel.text = "\(name), \(message ?? "상메 없음"), \(phone ?? 0)"
        //통째로 받은거 사용
        myLabel.text = "\(profile.name), \(profile.message ?? "상메 없음"), \(profile.phone ?? 0)"
        
    }
     
}
