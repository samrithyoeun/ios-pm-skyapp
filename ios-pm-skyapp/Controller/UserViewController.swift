//
//  UserViewController.swift
//  ios-pm-skyapp
//
//  Created by Samrith Yoeun on 6/21/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var userData: [String] = []
    
    @IBOutlet weak var userDetailLabel: UILabel!

   
    override func viewDidLoad() {
    
        if !userData.isEmpty {
            userDetailLabel.text = "You have log in with \n username : \(userData[0]) \n password : \(userData[1])"
        }
    }
    
}
