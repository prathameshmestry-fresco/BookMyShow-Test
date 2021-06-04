//
//  Utils.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import UIKit

class Utils {

    class func getSchemeKey(_ key: String) -> String {
        let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: plistPath!)
        return dict!["\(key)"] as! String
    }
}


extension UITableView {
    func registerNibs(_ cellIdentifiers: [String]) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
}

extension UIButton {
    
    func setBookButtonStyle() {
        self.backgroundColor = UIColor(red: 219.0/255.0, green: 54.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
    
}

extension UIView {
    
    func setViewtyle(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }
}

