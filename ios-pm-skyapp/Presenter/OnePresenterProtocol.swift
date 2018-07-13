//
//  OnePresenterProtocol.swift
//  ios-pm-skyapp
//
//  Created by PM Academy 3 on 7/13/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import Foundation

protocol OnePresenterProtocol: class {
    
    var view: OneViewProtocol! { get set }
    
    func loadService()
}
