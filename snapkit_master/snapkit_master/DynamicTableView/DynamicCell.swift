

import UIKit
import SnapKit
import Kingfisher

class DynamicCell: UITableViewCell {
    
    static let reuseIdentifier = "DynamicCell"
    
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
    
    
    var userDesc: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
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
    
    func bind(model:DynamicModel){
        self.userName.text = model.name
        self.userImage.kf.setImage(with: URL(string: model.imageUrl ?? ""))
        self.userDesc.text = model.desc
    }
}


extension DynamicCell {
    func setupUI(){
        self.addSubview(self.userImage)
        self.addSubview(self.userName)
        self.addSubview(self.userDesc)

        userName.backgroundColor = .yellow
        userImage.backgroundColor = .red
        userDesc.backgroundColor = .orange
        
        userImage.snp.makeConstraints({ (make) in make.top.left.equalTo(10)
            make.width.height.equalTo(40) })
        
        userName.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(userImage.snp.right).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(21)
        }
        
        userDesc.snp.makeConstraints { (make) in make.top.equalTo(userName.snp.bottom).offset(5)
            make.left.equalTo(userImage.snp.right).offset(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
            
        }

    }
}
