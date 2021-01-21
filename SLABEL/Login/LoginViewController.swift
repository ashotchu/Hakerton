//
//  LoginViewController.swift
//  SLABEL
//
//  Created by 김태훈 on 2021/01/19.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser


class LoginViewController: BaseViewController {

    @IBOutlet weak var adminButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

//        for family: String in UIFont.familyNames
//        {
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
//            }
//        }
        
        adminButton.layer.cornerRadius = 12
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func adminTouchDown(_ sender: Any) {
        AuthApi.shared.loginWithKakaoAccount(authType: .Reauthenticate) {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    self.navigationController?.pushViewController(MainViewController(true), animated: true)
                    //do something
                    _ = oauthToken
                }
            }
    }
    
}
