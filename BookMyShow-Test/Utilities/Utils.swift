//
//  Utils.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import UIKit

class Utils {
    
    //MARK: Get API Path from Info Plist
    class func getSchemeKey(_ key: String) -> String {
        let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: plistPath!)
        return dict!["\(key)"] as! String
    }
}

extension UIImageView {
    
    func setCornerStyle() {
        self.layer.cornerRadius = 5.0
    }
}


extension UITableView {
    
    //MARK: Register Nib for UITableView
    func registerNibs(_ cellIdentifiers: [String]) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
}

extension UICollectionView {
    
    //MARK: Register Nib for UICollectionView
    func registerNibs(_ cellIdentifiers: [String]) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }
    }
}

extension UIButton {
    
    //MARK: UIButton Style Methods
    func setBookButtonStyle() {
        self.backgroundColor = UIColor(red: 219.0/255.0, green: 54.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
    
}

extension UIView {
    
    //MARK: UIView Style Methods
    func setViewtyle(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }
}

