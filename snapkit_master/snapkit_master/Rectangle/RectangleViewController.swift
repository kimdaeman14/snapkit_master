//
//  RectangleViewController.swift
//  snapkit_master
//
//  Created by Jaycee on 2020/01/18.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit
import SnapKit

class RectangleViewController: UIViewController {
    
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



extension RectangleViewController {
    
    func initUI(){
        self.title = "RectangleViewController"
        self.view.backgroundColor = .white
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(button4)
    }
    
    
    func setLayout(){
        self.button1.snp.makeConstraints { make in
            make.leading.equalTo(self.view)
            make.top.equalTo(self.view)
            make.trailing.equalTo(self.button2.snp.leading)
            make.width.equalTo(self.button2)
            make.height.equalTo(self.button3)
            make.bottom.equalTo(self.button3.snp.top)
        }
        
        self.button2.snp.makeConstraints { make in
            make.trailing.equalTo(self.view)
            make.top.equalTo(self.view)
            make.leading.equalTo(self.button1.snp.trailing)
            make.width.equalTo(self.button1)
            make.height.equalTo(self.button4)
            make.bottom.equalTo(self.button4.snp.top)
            
        }
        
        self.button3.snp.makeConstraints { make in
            make.leading.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.trailing.equalTo(self.button4.snp.leading)
            make.width.equalTo(self.button4)
        }
        
        self.button4.snp.makeConstraints { make in
            make.trailing.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.leading.equalTo(self.button3.snp.trailing)
        }
    }
}
