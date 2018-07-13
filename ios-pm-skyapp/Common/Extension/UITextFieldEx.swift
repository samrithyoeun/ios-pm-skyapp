//
//  UITextFieldEx.swift
//  ios-pm-skyapp
//
//  Created by Samrith Yoeun on 7/13/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setIcon(with iconName : String){
        let iconWidth = 20
        let iconHeight = 20
        let imageView = UIImageView()
        let icon = UIImage(named: iconName)
        
        imageView.image = icon
        imageView.frame = CGRect(x: 10, y: 10, width: iconWidth, height: iconHeight)
        leftViewMode = UITextFieldViewMode.always
        addSubview(imageView)
        
        let paddingView = UIView(frame: CGRect(x: 10, y: 10, width: 40, height: self.frame.height))
        leftView = paddingView
    }
    
}










