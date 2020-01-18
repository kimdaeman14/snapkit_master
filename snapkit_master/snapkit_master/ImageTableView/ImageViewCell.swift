//
//  ImageViewCell.swift
//  snapkit_master
//
//  Created by Jaycee on 2020/01/18.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ImageViewCell: UITableViewCell {
    
    static let reuseIdentifier = "imageCell"
    
    let userImage: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    var userName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .red
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func bind(model:ImageModel){
        self.userName.text = model.name
        self.userImage.kf.setImage(with: URL(string: model.imageUrl ?? ""))
    }
}


extension ImageViewCell {
    func setupUI(){
        self.addSubview(self.userImage)
        self.addSubview(self.userName)
        
        userName.numberOfLines = 0
        
        userName.backgroundColor = .yellow
        userImage.backgroundColor = .red
        
        userImage.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(userImage.snp.height)
        }
        
        userName.snp.makeConstraints { make in
            make.leading.equalTo(userImage.snp.trailing).offset(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.trailing.equalTo(-10)
        }
    }
}
