//
//  SimpleMenuViewController.swift
//  snapkit_master
//
//  Created by 디엠에듀 on 2020/01/17.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit
import SnapKit

class SimpleMenuViewController: UIViewController {
  
  
  private let button1 = SimpleButton(frame: .init(), title: "감자", color: .orange)
  private let button2 = SimpleButton(frame: .init(), title: "고구마", color: .brown)
  private let button3 = SimpleButton(frame: .init(), title: "당근", color: .darkGray)
  private let button4 = SimpleButton(frame: .init(), title: "바나나", color: .magenta)


  override func viewDidLoad() {
    super.viewDidLoad()
    initUI()
    setLayout()
  }
  
  
}







extension SimpleMenuViewController {
  
  func initUI(){
    self.title = "SimpleMenuViewController"
    self.view.backgroundColor = .white
    self.view.addSubview(button1)
    self.view.addSubview(button2)
    self.view.addSubview(button3)
    self.view.addSubview(button4)
  }
  
  
  func setLayout(){
    self.button1.snp.makeConstraints { make in
      make.center.equalTo(self.view)
      make.leading.equalTo(self.view)
      make.trailing.equalTo(self.button2.snp.leading)
      make.height.equalTo(50)
    }
    
    self.button2.snp.makeConstraints { make in
      make.center.equalTo(self.button1)
      make.leading.equalTo(self.button1.snp.trailing)
      make.trailing.equalTo(self.button3.snp.leading)
      make.size.equalTo(self.button1)
    }
    
    self.button3.snp.makeConstraints { make in
      make.center.equalTo(self.button1)
      make.leading.equalTo(self.button3.snp.trailing)
      make.trailing.equalTo(self.button4.snp.leading)
      make.size.equalTo(self.button1)
    }
    
    self.button4.snp.makeConstraints { make in
      make.center.equalTo(self.button1)
      make.leading.equalTo(self.button3.snp.trailing)
      make.trailing.equalTo(self.view)
      make.size.equalTo(self.button1)
    }
  }
}
