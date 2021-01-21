//
//  InfoViewController.swift
//  SLABEL
//
//  Created by 김태훈 on 2021/01/20.
//

import UIKit
import Kingfisher
import KakaoSDKCommon
import KakaoSDKUser

class InfoViewController: BaseViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.cornerRadius = image.bounds.width * 0.5
        
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                if let url = user?.kakaoAccount?.profile?.profileImageUrl {
                    self.image.kf.setImage(with: url)
                }
                if let name = user?.kakaoAccount?.profile?.nickname {
                    self.label1.text = name
                } else {
                    self.label1.text = "사용자"
                }
            }
        }
        label1.font = UIFont.NanumSquare(.bold, size: 15)
        label1.sizeToFit()
        label2.font = UIFont.NanumSquare(.regular, size: 13)
        
        button.setAttributedTitle(NSAttributedString(string: "로그아웃", attributes: [.font: UIFont.NanumSquare(.bold, size: 16),.foregroundColor:UIColor.white]), for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.menuColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "개인 정보"
    }
    
    @IBAction func logout(_ sender: Any) {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                var nav = UINavigationController()
                var mainView = LoginViewController()
                nav.viewControllers = [mainView]
                self.navigationController?.changeRootViewController(nav)
            }
        }
    }
    
}
