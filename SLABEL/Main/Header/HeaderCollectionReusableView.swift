//
//  HeaderCollectionReusableView.swift
//  SLABEL
//
//  Created by 김태훈 on 2021/01/20.
//

//정석학술정보관(일반열람실, 그룹스터디룸, 정석라운지)
//하이테크센터(1113호, 공대도서관, 해동라운지, IT카페)
//60주년기념관(월천라운지, 인현재)
//5호관(인문스터디룸, 인문독서실)
//6호관(돔)
//서호관(서호독서당)

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    var label: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "", attributes: [
            NSAttributedString.Key.font : UIFont.NanumSquare(.bold, size: 14),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        return label
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.menuColor
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        return button
    }()
    
    func configure(_ text: String) {
        label.text = text
        addSubview(label)
    }
    
    func buttonConfigure(_ image:String) {
        button.setImage(UIImage(systemName: "\(image)"), for: .normal)
        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 20, y: 5, width: frame.width * 0.6, height: 30)
        button.frame = CGRect(x: frame.width * 0.85,y: 5,width: 20,height: 20)
    }
    
    
}
