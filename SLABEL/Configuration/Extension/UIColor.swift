import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    
    class var mainColor: UIColor{
        return UIColor(displayP3Red: 0.213, green: 0.258, blue: 0.541, alpha: 1)
    }
    class var menuColor: UIColor {
        return UIColor(displayP3Red: 0.299, green: 0.590, blue: 0.957, alpha: 1)
    }
    class var occupyColor: UIColor {
        return UIColor(displayP3Red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    }
    class var suspectColor: UIColor {
        return UIColor(displayP3Red: 0.9, green: 0.524, blue: 0.392, alpha: 1)
    }
}
