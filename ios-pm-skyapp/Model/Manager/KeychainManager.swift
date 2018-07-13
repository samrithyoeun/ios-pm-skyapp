//
//  KeychainManager.swift
//  ios-pm-skyapp
//
//  Created by Samrith Yoeun on 7/13/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import Foundation
import KeychainSwift

class KeychainManager {
    
    static let shared = KeychainManager()
    let keychain = KeychainSwift()
    
    func setUserInfoToKeychain(user: User?) {
        if let user = user {
            keychain.set(user.username! , forKey: "username")
            keychain.set(user.password! , forKey: "password")
        }
    }
    
    func getUserInfoFromKeyChain() -> User? {
        let username = keychain.get("username")
        let password = keychain.get("password")
        
        if let username = username, let password = password {
            return User(username: username, password: password)
        } else {
            return nil
        }
    }
    
}
