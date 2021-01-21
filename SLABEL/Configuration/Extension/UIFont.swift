//
//  UIFont.swift
//  SLABEL
//
//  Created by 김태훈 on 2021/01/19.
//

import Foundation
import UIKit

extension UIFont {
    public enum NanumSquareType: String {
        case regular = "R"
        case light = "L"
        case bold = "B"
        case extraBold = "EB"
    }
    
    static func NanumSquare(_ type:NanumSquareType,size: CGFloat) -> UIFont {
        print(type.rawValue)
        //NanumSquareBold.ttf
        print("NanumSquare\(type.rawValue)")
        print(UIFont(name: "NanumSquare\(type.rawValue)", size: size))
        return UIFont(name: "NanumSquare\(type.rawValue)", size: size)!
    }
}
