//
//  OneViewController.swift
//  ios-pm-skyapp
//
//  Created by PM Academy 3 on 7/13/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class OneViewController: TemplateViewController {

    var presenter: OnePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.closeNavigationButton()
        presenter.loadService()
    }
    
    override func loadData() {
        // Service
        self.data = [String]()
        
    }
    
    func showLoading() {
        
    }
}

extension OneViewController: OneViewProtocol {
    func setData() {
        
    }
}
