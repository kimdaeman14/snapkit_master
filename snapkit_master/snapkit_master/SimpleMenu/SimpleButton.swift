//
//  SimpleButton.swift
//  snapkit_master
//
//  Created by 디엠에듀 on 2020/01/17.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit


class SimpleButton: UIButton{
  
  init(frame: CGRect, title: String, color: UIColor){
    super.init(frame: frame)
    self.frame = frame
    self.setTitle(title, for: .normal)
    self.backgroundColor = color
    self.addTarget(self, action:#selector(self.buttonDidTap), for: .touchUpInside)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
  
  
  func setupUI() {
//    setTitleColor(.yellow, for: .normal)
//    layer.cornerRadius   = 25
//    layer.borderWidth    = 3.0
//    layer.borderColor    = UIColor.darkGray.cgColor
  }
  
  
  @objc func buttonDidTap() {
    print("Button Clicked")
  }
}
