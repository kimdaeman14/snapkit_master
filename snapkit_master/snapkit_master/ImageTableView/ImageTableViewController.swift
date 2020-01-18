//
//  ImageTableViewController.swift
//  snapkit_master
//
//  Created by Jaycee on 2020/01/18.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ImageTableViewController: UIViewController {
    
    var didSetupConstraints = false
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
    let dummyList: [ImageModel] = [
        ImageModel(name: "이낙연(사진) 전 국무총리가 현 거주지인 서울 서초구 잠원동 소재 아파트의 전입 시기 관련해 “착오가 있었다”며 직접 해명했다.", imageUrl: "https://www.rd.com/wp-content/uploads/2017/08/01-How-to-Pick-the-Best-Dog-Breed-for-You_149471132-dezi-1024x683.jpg"),
        ImageModel(name: "지난해 말 잉글랜드 프로축구 프리미어리그(EPL) 첼시전에서 인종차별을 받았던 손흥민(28·토트넘)이 또다시 인종차별의 희생양이 된 것 아니냐는 지적이 나왔다.", imageUrl: "https://www.rd.com/wp-content/uploads/2017/08/02-How-to-Pick-the-Best-Dog-Breed-for-You_564897637-Grisha-Bruev-1024x683.jpg"),
        ImageModel(name: "세계 축구 팬들이 댓글을 남겼다.", imageUrl: "https://www.rd.com/wp-content/uploads/2017/08/04-How-to-Pick-the-Best-Dog-Breed-for-You_141945937-Olena-Brodetska-1024x683.jpg"),
        ImageModel(name: "J리그 요코하마와 계약이 종료된 윤일록이 프랑스 리그1 6위를 달리는 몽펠리에에 '깜짝' 입단했다. 요코하마 퇴단 이후 K리그 복귀설이 돌던 상황이라 뜻밖의 이적 소식이다. 지난 2018년 FC서울 떠나 요코하마에 입단했던 윤일록은 지난해 제주 유나이티드로 임대되어 한 시즌 동안 34경기에 나서 11골을 기록했다. 몽펠리에는 윤일록을 이적료 없이 영입했고, 등번호 24번 유니폼을 받은 윤일록의 영상을 공개하며 입단 소식을 알렸다. ", imageUrl: "https://www.rd.com/wp-content/uploads/2017/08/07-How-to-Pick-the-Best-Dog-Breed-for-You_538300024-Africa-Studio-1024x683.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.initTableView()
    }
    
}

extension ImageTableViewController {
    
    func initUI(){
        self.view.addSubview(self.tableView)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if(!didSetupConstraints){
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    func initTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 80
        self.tableView.register(ImageViewCell.self, forCellReuseIdentifier: ImageViewCell.reuseIdentifier)
    }
}

extension ImageTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewCell.reuseIdentifier, for: indexPath) as! ImageViewCell
        cell.bind(model: self.dummyList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


struct ImageModel {
    var name:String?
    var imageUrl:String?
}
