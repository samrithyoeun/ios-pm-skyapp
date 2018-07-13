//
//  UserViewController.swift
//  ios-pm-skyapp
//
//  Created by Samrith Yoeun on 6/21/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit
import KeychainSwift

class UserViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var userDetailLabel: UILabel!
    
    var user = User(username: nil, password: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    @IBAction func setToPlistButtonTapped(_ sender: Any) {
        PListManager.shared.setData(name: nameTextField.text!, sex: genderTextField.text!, job: jobTextField.text!)
    }
    
    @IBAction func getDataFromPlistButtonTapped(_ sender: Any) {
        PListManager.shared.loadData { (result) in
            switch result {
            case.failure(let error):
                print(error)
            case .success( let success):
                alert(message: "NAME: \(success[0]!) \n GENDER: \(success[1]!)\n JOB: \(success[2]!)", title: "Infomation")
            }
        }
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        KeychainManager.shared.setUserInfoToKeychain(user: nil)
    }
    
    private func setUpUI(){
        if let username = user.username, let password = user.password{
            userDetailLabel.text = "You have log in with \n username : \(username) \n password : \(password)"
        }
        nameTextField.setIcon(with: "user")
        genderTextField.setIcon(with: "user")
        jobTextField.setIcon(with: "user")
        
    }
    
}
