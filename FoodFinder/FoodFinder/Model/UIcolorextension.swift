import UIKit

extension UIColor {
    
    // Setup custom colours we can use throughout the app using hex values
    static let seemuBlue = UIColor(hex: 0x00adf7)
    static let youtubeRed = UIColor(hex: 0xf80000)
    static let transparentBlack = UIColor(hex: 0x000000, a: 0.5)
    
    // Create a UIColor from RGB
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    // Create a UIColor from a hex value (E.g 0x000000)
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
}
// CREDIT TO https://www.seemuapps.com/swift-custom-uicolor-extension-add-custom-colors


func setpressedcolor(button: UIButton, pressed: Bool) {
    if pressed {
        button.backgroundColor = UIColor(red: 57, green: 118, blue: 176)
    } else {
        button.backgroundColor = UIColor(red: 117, green: 197, blue: 255)
    }
    
}
