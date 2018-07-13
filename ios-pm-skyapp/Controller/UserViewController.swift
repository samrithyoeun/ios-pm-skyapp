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
    let plist = "Person"
    var name = ""
    var sex = ""
    var job = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserDetailLabel()
        
        SwiftyPlistManager.shared.start(plistNames: [plist], logging: true)
    }
    
    @IBAction func setToPlistButtonTapped(_ sender: Any) {
        SwiftyPlistManager.shared.save(nameTextField.text ?? "", forKey: "name", toPlistWithName: plist) { (err) in print(err.debugDescription) }
        SwiftyPlistManager.shared.save(genderTextField.text ?? "", forKey: "sex", toPlistWithName: plist) { (err) in print(err.debugDescription) }
        SwiftyPlistManager.shared.save(jobTextField.text ?? "", forKey: "job", toPlistWithName: plist) { (err) in print(err.debugDescription) }
    }
    
    @IBAction func getDataFromPlistButtonTapped(_ sender: Any) {
        SwiftyPlistManager.shared.getValue(for: "name", fromPlistWithName: plist) { (result, err) in
            if err == nil {
                self.name = result as! String
            }
        }
        
        SwiftyPlistManager.shared.getValue(for: "sex", fromPlistWithName: plist) { (result, err) in
            if err == nil {
                self.sex = result as! String
            }
        }
        
        SwiftyPlistManager.shared.getValue(for: "job", fromPlistWithName: plist) { (result, err) in
            if err == nil {
                self.job = result as! String
            }
        }
        
        alert(message: "name: \(name) \n sex: \(sex)\n job: \(job)", title: "Infomation")
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        setUserInfoToKeychain(user: User(username: " ", password: " "))
    }
    
    private func setUpUserDetailLabel(){
        if let username = user.username, let password = user.password{
            userDetailLabel.text = "You have log in with \n username : \(username) \n password : \(password)"
        }
    }
    
    private func setUserInfoToKeychain(user: User) {
        let keychain = KeychainSwift()
        keychain.set(user.username! , forKey: "username")
        keychain.set(user.password! , forKey: "password")
    }
    
}
