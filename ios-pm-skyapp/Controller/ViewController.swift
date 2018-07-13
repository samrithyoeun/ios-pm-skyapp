//
//  ViewController.swift
//  ios-pm-skyapp
//
//  Created by Samrith Yoeun on 6/21/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let user = User(username: "hello", password: "world")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.setIcon(with: "user.png")
        passwordTextField.setIcon(with: "passwords.png")
        
        if let userInfo = KeychainManager.shared.getUserInfoFromKeyChain() {
            print(userInfo)
            login(user: userInfo)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        if let username = usernameTextField.text , let passwords = passwordTextField.text {
            let user = User(username: username, password: passwords)
            login(user: user)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userViewController = segue.destination as? UserViewController{
            userViewController.user = self.user
        }
    }
    
    private func login(user: User) {
        if user.username == self.user.username && user.password == self.user.password {
            KeychainManager.shared.setUserInfoToKeychain(user: user)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "user log in", sender: self)
            }
            
        } else {
            alert(message: "Wrong username / password", title: "Attention!")
        }
    }
    
}

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
