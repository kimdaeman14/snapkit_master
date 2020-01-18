

import UIKit
import SnapKit
import Kingfisher

class DynamicTableViewController: UIViewController {
    var didSetupConstraints = false
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
    let dummyList: [DynamicModel] = [
        DynamicModel(name: "이낙연",
                     imageUrl: "https://www.rd.com/wp-content/uploads/2017/08/01-How-to-Pick-the-Best-Dog-Breed-for-You_149471132-dezi-1024x683.jpg",
                     desc: "이낙연(사진) 전 국무총리가 현 거주지인 서울 서초구 잠원동 소재 아파트의 전입 시기 관련해 “착오가 있었다”며 직접 해명했다.이 전 총리는 18일 “제 아파트와 관련해 착오가 있었기에 알려드린다”로 시작하는 글을 자신의 페이스북에 올렸다."),
        DynamicModel(name: "손흥민",
                     imageUrl: "https://www.rd.com/wp-content/uploads/2017/08/04-How-to-Pick-the-Best-Dog-Breed-for-You_141945937-Olena-Brodetska-1024x683.jpg",
                     desc: "지난해 지적이 나왔다."),
        
        DynamicModel(name: "해외축구",
                     imageUrl: "https://www.rd.com/wp-content/uploads/2017/08/01-How-to-Pick-the-Best-Dog-Breed-for-You_149471132-dezi-1024x683.jpg",
                     desc: "해당 글이 게시된 지 일주일이 지난 18일 현재 1만 6000명이 넘는 세계 축구 팬들이 댓글을 남겼다."),
        
        DynamicModel(name: "윤일록",
                     imageUrl: "https://www.rd.com/wp-content/uploads/2017/08/07-How-to-Pick-the-Best-Dog-Breed-for-You_538300024-Africa-Studio-1024x683.jpg",
                     desc: "J리그 요코하마와 계약이 종료된 윤일록이 프랑스 리그1 6위를 달리는 몽펠리에에 '깜짝' 입단했다. 요코하마 퇴단 이후 K리그 복귀설이 돌던 상황이라 뜻밖의 이적 소식이다. 지난 2018년 FC서울 떠나 요코하마에 입단했던 윤일록은 지난해 제주 유나이티드로 임대되어 한 시즌 동안 34경기에 나서 11골을 기록했다. 몽펠리에는 윤일록을 이적료 없이 영입했고, 등번호 24번 유니폼을 받은 윤일록의 영상을 공개하며 입단 소식을 알렸다. ")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.initTableView()
    }
    
}

extension DynamicTableViewController {
    
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
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
        self.tableView.register(DynamicCell.self, forCellReuseIdentifier: DynamicCell.reuseIdentifier)
    }
}

extension DynamicTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DynamicCell.reuseIdentifier, for: indexPath) as! DynamicCell
        cell.bind(model: dummyList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


struct DynamicModel {
    var name:String?
    var imageUrl:String?
    var desc:String?
}

