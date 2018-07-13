//
//  TwoViewController.swift
//  ios-pm-skyapp
//
//  Created by PM Academy 3 on 7/13/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class TwoViewController: TemplateViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.backNavigationButton()
    }
    
    override func loadData() {
        // Service
        self.data = [String]()
    }
}
