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
    var user = User(username: nil, password: nil)
    
    @IBOutlet weak var userDetailLabel: UILabel!

   
    override func viewDidLoad() {
        if let username = user.username, let password = user.password{
            userDetailLabel.text = "You have log in with \n username : \(username) \n password : \(password)"
        }
        
    }
    
}
