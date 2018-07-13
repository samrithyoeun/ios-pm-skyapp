//
//  PListManager.swift
//  ios-pm-skyapp
//
//  Created by Samrith Yoeun on 7/13/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import Foundation

class PListManager {
    
    static let shared = PListManager()
    let plist = "Person.plist"
    
    func setData(name: String, sex: String, job: String) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentDirectory = paths.object(at: 0) as! String
        let path = documentDirectory.appending(plist)
        let dicts: NSMutableDictionary = [:]
        
        dicts.setObject(name , forKey: "name" as NSCopying )
        dicts.setObject(sex , forKey: "sex" as NSCopying )
        dicts.setObject(job , forKey: "job" as NSCopying )
        
        dicts.write(toFile: path, atomically: true)
    }
    
    func loadData(callback: (Result<[String?]>) -> () ) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentDirectory = paths[0] as! String
        let path = documentDirectory.appending(plist)
        let fileManager = FileManager.default
        if(!fileManager.fileExists(atPath: path)){
            if let bundlePath = Bundle.main.path(forResource: "Person", ofType: "plist"){
                do{
                    try fileManager.copyItem(atPath: bundlePath, toPath: path)
                }catch{
                    callback(Result.failure("copy failure"))
                }
            }else{
                callback(Result.failure("file myData.plist not found."))
            }
        }
        
        let myDict = NSDictionary(contentsOfFile: path)
        if let dict = myDict{
            let name = dict.object(forKey: "name") as! String?
            let sex = dict.object(forKey: "sex") as! String?
            let job = dict.object(forKey: "job") as! String?
            callback(Result.success([name, sex, job]))
        } else {
            callback(Result.failure("cannot get data"))
        }
    }
}
