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
    let user = User(username: "hello", password: "world")
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.setIcon(with: "user.png")
        passwordTextField.setIcon(with: "passwords.png")
        
        if let userInfo = getUserInfoFromKeyChain() {
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
                setUserInfoToKeychain(user: user)
                print("user log in")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "user log in", sender: self)
                }
                
            } else {
                let alert = UIAlertController(title: "Attention", message: "Wrong Username or password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    print("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
    }
    
    private func setUserInfoToKeychain(user: User) {
        let keychain = KeychainSwift()
        keychain.set(user.username! , forKey: "username")
        keychain.set(user.password! , forKey: "password")
    }
    
    private func getUserInfoFromKeyChain() -> User? {
        let keychain = KeychainSwift()
        let username = keychain.get("username")
        let password = keychain.get("password")
        
        if let username = username, let password = password {
            return User(username: username, password: password)
        } else {
            return nil
        }
    }
}


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

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}








