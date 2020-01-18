//
//  ViewController.swift
//  snapkit_master
//
//  Created by 디엠에듀 on 2020/01/17.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit
import SnapKit


class BasicTableViewController: UIViewController {
  let cellName = "cell"
  var didSetupConstraints = false
  
  let menuList = Array(100000000...100000020).map{"\($0)"}
  
  
  let tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.initUI()
    self.initTableView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}





extension BasicTableViewController {
  func initUI(){
    self.title = "BasicTableViewController"
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



extension BasicTableViewController: UITableViewDelegate, UITableViewDataSource {
  func goViewController(vc: UIViewController) {
    self.navigationController?.pushViewController(vc, animated: true) }
  
  public func initTableView() {
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.rowHeight = 44
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellName)
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuList.count
    
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellName)!
    cell.textLabel?.text = self.menuList[indexPath.row]
    return cell
    
  }
  
}






