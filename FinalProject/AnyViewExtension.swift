//
//  AnyViewExtension.swift
//  FinalProject
//
//  Created by Vido Valianto on 3/26/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    
    func loadImageUrl(url: String) {
        print("URL \(url)")
        self.af_setImage(withURL: URL(string: url)!, placeholderImage: UIImage(named: "logo_3"))
    }
}

extension UILabel {
    
    func colorCode(){
        if self.text == "Campur"{
            print("masuk sini")
            self.textColor = UIColor(hexString: "#9845BF")
        }
        else if self.text == "Putra"{
            self.textColor = UIColor(hexString: "#2385BF")
        }
        else if self.text == "Putri"{
            self.textColor = UIColor(hexString: "#E763D4")
        }
    }
}

extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        let red, green, blue, alpha: CGFloat
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            return nil
        }
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}
