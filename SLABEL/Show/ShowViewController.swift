//
//  ShowViewController.swift
//  SLABEL
//
//  Created by 김태훈 on 2021/01/20.
//

import UIKit

class ShowViewController: BaseViewController {

    var bigIdx:Int = 0
    var smallIdx:Int = 0
    
    var headerText: [String] = ["정석학술정보관","하이테크센터","60주년기념관"]
    var imageName: [String] = ["mainPage0","mainPage1","mainPage2","mainPage0"]
    var titleText: [[String]] = [["일반열람실", "그룹스터디룸", "정석라운지"],["공대도서관", "해동라운지", "IT카페"],["월천라운지", "인현재"]]
    var count1: [[Int]] = [[24,9,9],[17,16,16],[16,16],[4]]
    var count2: [[Int]] = [[54,15,17],[23,12,56],[28,12],[1]]
    var count3: [[Int]] = [[78,24,26],[50,28,72],[44,28],[4]]
    var downImageName: [[String]] = [["image2","image0","image1"],["image3","image4","image5"],["image6","image4"]]
    
    @IBOutlet weak var downImage: UIImageView!
    @IBOutlet weak var upperImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var countLabel1: UILabel!
    @IBOutlet weak var countLabel2: UILabel!
    @IBOutlet weak var countLabel3: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    init(_ bigIdx:Int,_ smallIdx:Int) {
        self.bigIdx = bigIdx
        self.smallIdx = smallIdx
        super.init(nibName: "ShowViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        titleLabel.text = titleText[bigIdx][smallIdx]
        titleLabel.sizeToFit()
        titleLabel.font = UIFont.NanumSquare(.bold, size: 14)
        titleLabel.textColor = .white
        
        label1.textColor = .white
        label2.textColor = .white
        label3.textColor = .white
        label1.adjustsFontSizeToFitWidth = true
        label2.adjustsFontSizeToFitWidth = true
        label3.adjustsFontSizeToFitWidth = true
        countLabel1.text = "\(count1[bigIdx][smallIdx])"
        countLabel2.text = "\(count2[bigIdx][smallIdx])"
        countLabel3.text = "\(count3[bigIdx][smallIdx])"
        
        upperImage.image = UIImage(named: imageName[bigIdx])
        downImage.image = UIImage(named: downImageName[bigIdx][smallIdx])
        
        progress.transform = CGAffineTransform(scaleX: 1, y: 2)
        progress.tintColor = UIColor.suspectColor
        progress.progress = Float(count1[bigIdx][smallIdx]) / Float(count3[bigIdx][smallIdx])
        
        view1.backgroundColor = UIColor.occupyColor
        view2.backgroundColor = UIColor.suspectColor
        view3.backgroundColor = UIColor.menuColor
        
        view1.layer.cornerRadius = 5
        view2.layer.cornerRadius = 5
        view3.layer.cornerRadius = 5
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = headerText[bigIdx]
    }
    

}
