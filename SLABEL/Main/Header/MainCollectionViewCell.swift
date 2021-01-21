//
//  MainCollectionViewCell.swift
//  SLABEL
//
//  Created by 김태훈 on 2021/01/20.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var border: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.font = UIFont.NanumSquare(.regular, size: 14)
        label.textColor = .white
        
        border.backgroundColor = .lightGray
    }

}
