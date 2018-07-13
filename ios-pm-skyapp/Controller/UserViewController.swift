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
        setData(name: nameTextField.text!, sex: genderTextField.text!, job: jobTextField.text!)
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
        loadData()
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
    
    private func loadData(callback: (Result<[String]>) -> () ) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentDirectory = paths[0] as! String
        let path = documentDirectory.appending("Person.plist")
        let fileManager = FileManager.default
        if(!fileManager.fileExists(atPath: path)){
            if let bundlePath = Bundle.main.path(forResource: "Person", ofType: "plist"){
                print(path)
                let result = NSMutableDictionary(contentsOfFile: bundlePath)
                print("Bundle file myData.plist is -> \(result?.description)")
                do{
                    try fileManager.copyItem(atPath: bundlePath, toPath: path)
                }catch{
                    print("copy failure.")
                }
            }else{
                print("file myData.plist not found.")
            }
        }
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        print("load myData.plist is ->\(resultDictionary?.description)")
        
        let myDict = NSDictionary(contentsOfFile: path)
        if let dict = myDict{
            let name = dict.object(forKey: "name") as! String?
            let sex = dict.object(forKey: "sex") as! String?
            let job = dict.object(forKey: "job") as! String?
            callback(Result.success([name, sex, job])
        } else {
            callback(Result.failure("cannot get data"))
        }
    }
    
    private func setData(name: String, sex: String, job: String) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentDirectory = paths.object(at: 0) as! String
        let path = documentDirectory.appending("Person.plist")
        let dicts: NSMutableDictionary = [:]
        
        dicts.setObject(name , forKey: "name" as NSCopying )
        dicts.setObject(sex , forKey: "sex" as NSCopying )
        dicts.setObject(job , forKey: "job" as NSCopying )
        
        dicts.write(toFile: path, atomically: true)
    }
}
