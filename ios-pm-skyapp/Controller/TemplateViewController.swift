//
//  TemplateViewController.swift
//  ios-pm-skyapp
//
//  Created by PM Academy 3 on 7/13/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class TemplateViewController: UIViewController {

    var data: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    func closeNavigationButton() {
        
    }
    
    func backNavigationButton() {
        
    }
    
    func loadData() {
        
    }
}

extension TemplateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
