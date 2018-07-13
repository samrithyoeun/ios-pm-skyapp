//
//  OnePresenter.swift
//  ios-pm-skyapp
//
//  Created by PM Academy 3 on 7/13/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import Foundation

class OnePresenter: OnePresenterProtocol {
    
    var view: OneViewProtocol!
    
    func loadService() {
        
        // success
        view.setData()
    }
}
