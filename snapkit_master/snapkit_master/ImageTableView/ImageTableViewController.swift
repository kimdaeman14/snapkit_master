//
//  ImageTableViewController.swift
//  snapkit_master
//
//  Created by Jaycee on 2020/01/18.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit

class ImageTableViewController: UIViewController {

    var didSetupConstraints = false
    
    let cellName = "imageCell"

    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let dummyList: [ImageModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.initTableView()
    }
}

extension ImageTableViewController {
    
    func initUI(){
        
    }
    
    func initTableView(){
        
    }
}

extension ImageTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
    
}


struct ImageModel {
    
}
