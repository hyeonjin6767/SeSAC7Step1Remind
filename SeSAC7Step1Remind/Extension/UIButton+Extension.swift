//
//  UIButton+Extension.swift
//  SeSAC7Step1Remind
//
//  Created by 박현진 on 7/16/25.
//

import UIKit

extension UIButton {
    //함수 이름에도 버튼을 제외해주자 //호출할때 앞에 버튼에서 호출하니까 굳이 또 버튼이라는 단어를 사용할 필요X
    func configure(title: String) {
        //앞에 self 붙여서 나야나 //클래스의 초기화구문 init에서도 //원래 인스턴스 프로퍼티 앞에 다 셀프가 생략되어 있는거임 :"자기 자신의 인스턴스"(자기자리를 찾아서 들어오는)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for:  .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
