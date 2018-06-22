//
//  ViewController.swift
//  ios-pm-skyapp
//
//  Created by Samrith Yoeun on 6/21/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let username = "hello"
    let password = "world"
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.setIcon(with: "user.png")
        passwordTextField.setIcon(with: "passwords.png")
    }
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        if let username = usernameTextField.text , let passwords = passwordTextField.text {
            if username == self.username && passwords == self.password {
                print("hello world")
                performSegue(withIdentifier: "user log in", sender: self)
            } else {
                let alert = UIAlertController(title: "Attention", message: "Wrong Username or password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    print("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userViewController = segue.destination as? UserViewController{
            userViewController.userData.insert(username, at: 0)
            userViewController.userData.insert(password, at: 1)
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








