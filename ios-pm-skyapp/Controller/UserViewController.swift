//
//  UserViewController.swift
//  ios-pm-skyapp
//
//  Created by Samrith Yoeun on 6/21/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userDetailLabel: UILabel!
    
    override func viewDidLoad() {
        userDetailLabel.text = "You have sucessfully log in !"
    }
    
}
