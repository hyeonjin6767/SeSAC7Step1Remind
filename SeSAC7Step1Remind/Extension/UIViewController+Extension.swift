//
//  UIViewController+Extension.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/16/25.
//

import UIKit

//모든 뷰컨은 UIViewController를 상속을 받고 있으니까 extension
//반복을 줄일 수는O
extension UIViewController {
    
    func configureBackgroundColor() {
        
        view.backgroundColor = .brown
    }
    
    //버튼 디자인도 바꿔보자
    //이렇게 해도 되긴 하는데 아쉬운 점이 있다 어떤 문제???
    //뷰컨이 1000개 이면...함수를 사용 안할 수도 있고,버튼이 없을 수도 //10개에만 버튼이 있고 990는 버튼이 없으면 990개는 안쓰는 짐을 갖고 있는 셈 : 필수 기능은 아니니까
    //UIButton+Extension.swift이라는 버튼용으로 따로 만들어
    
//    func configureButton(_ button: UIButton, title: String) {
//        
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(.black, for:  .normal)
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 10
//        button.clipsToBounds = true
//    }
    
}
