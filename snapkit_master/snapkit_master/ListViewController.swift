//
//  MainViewController.swift
//  snapkit_master
//
//  Created by 디엠에듀 on 2020/01/17.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    let cellName = "list"
    var didSetupConstraints = false
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let viewControllers = [
        BasicTableViewController(),
        SimpleMenuViewController(),
        RectangleViewController()
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
        self.initTableView()
        
    }
    
    
    
}


extension ListViewController  {
    
    func initUI(){
        self.title = "SnapkitExample"
        self.view.addSubview(self.tableView)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                
            }
            didSetupConstraints = true
            
        }
        super.updateViewConstraints() }
    
    
}




// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        cell.textLabel?.text = "\(viewControllers[indexPath.row])"
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    
    public func initTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 44
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellName)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = viewControllers[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
