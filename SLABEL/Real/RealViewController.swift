//
//  RealViewController.swift
//  SLABEL
//
//  Created by 김태훈 on 2021/01/21.la
//

import UIKit
import Firebase


class RealViewController: BaseViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var countLabel1: UILabel!
    @IBOutlet weak var countLabel2: UILabel!
    @IBOutlet weak var countLabel3: UILabel!
    
    @IBOutlet weak var underlabel1: UILabel!
    @IBOutlet weak var underlabel2: UILabel!
    @IBOutlet weak var underlabel3: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var cell1: UIView!
    @IBOutlet weak var cell2: UIView!
    @IBOutlet weak var cell3: UIView!
    @IBOutlet weak var cell4: UIView!

    @IBOutlet weak var border: UIView!
    @IBOutlet weak var enter: UIButton!
    var occupy: Int = 0
    var available: Int = 4
    var all: Int = 4
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.font = UIFont.NanumSquare(.bold, size: 14)
        label2.font = UIFont.NanumSquare(.bold, size: 13)
        label3.font = UIFont.NanumSquare(.bold, size: 13)
        label4.font = UIFont.NanumSquare(.bold, size: 13)
        
        countLabel1.font = UIFont.NanumSquare(.regular, size: 13)
        countLabel2.font = UIFont.NanumSquare(.regular, size: 13)
        countLabel3.font = UIFont.NanumSquare(.regular, size: 13)
        
        countLabel1.text = "\(occupy)"
        countLabel2.text = "\(available)"
        countLabel3.text = "\(all)"
        
        underlabel1.font = UIFont.NanumSquare(.regular, size: 12)
        underlabel2.font = UIFont.NanumSquare(.regular, size: 12)
        underlabel3.font = UIFont.NanumSquare(.regular, size: 12)
        
        view1.layer.cornerRadius = 5
        view2.layer.cornerRadius = 5
        view3.layer.cornerRadius = 5
        
        view1.backgroundColor = UIColor.occupyColor
        view2.backgroundColor = UIColor.suspectColor
        view3.backgroundColor = UIColor.menuColor
        
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 2)
        progressBar.backgroundColor = UIColor.suspectColor
        progressBar.progress = Float(occupy) / Float(all)
        
        enter.backgroundColor = UIColor.mainColor
        enter.layer.cornerRadius = 5
        enter.layer.borderWidth = 1
        enter.layer.borderColor = UIColor.mainColor.cgColor
        enter.transform = CGAffineTransform(scaleX: 1.5, y: 1)
        
        border.backgroundColor = UIColor.mainColor
        border.layer.cornerRadius = border.bounds.width / 8
        
        cell1.layer.cornerRadius = 9
        cell2.layer.cornerRadius = 9
        cell3.layer.cornerRadius = 9
        cell4.layer.cornerRadius = 9
        
        cell1.backgroundColor = UIColor.menuColor
        cell2.backgroundColor = UIColor.menuColor
        cell3.backgroundColor = UIColor.menuColor
        cell4.backgroundColor = UIColor.menuColor
        
        FirebaseApp.configure()

        db = Firestore.firestore()
        var distance = 0
        
        db.collection("distance").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    distance = document.document.data()["d"]
                }
            }
                                              
        }
        if distance > 130 {
            cell2.backgroundColor = UIColor.lightGray
        } else if distance >= 95 && distance <= 130 {
            cell2.backgroundColor = UIColor.suspectColor
        } else {
            cell2.backgroundColor = UIColor.menuColor
        }
        db.collection("weight").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "학교 교내"
    }

}
