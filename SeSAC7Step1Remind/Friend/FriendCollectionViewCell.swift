//
//  FriendCollectionViewCell.swift
//  SeSAC7Step1Remind
//
//  Created by 박현진 on 7/17/25.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {

    @IBOutlet var profileImagView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImagView.backgroundColor = .yellow
        profileImagView.contentMode = .scaleAspectFill
        
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 17)
        
        
    }

}
