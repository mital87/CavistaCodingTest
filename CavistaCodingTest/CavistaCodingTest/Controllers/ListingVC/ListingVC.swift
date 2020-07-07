//
//  ListingVC.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import ProgressHUD

class ListingVC: UIViewController {

    lazy var tblView : UITableView = {
        let tbl = UITableView()
        tbl.dataSource = self
        tbl.delegate = self
        
        tbl.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellIdentifier)
        self.view.addSubview(tbl)
        
        tbl.snp.makeConstraints { (mark) in
            mark.edges.equalTo(self.view)
        }
        return tbl
    }()
    
    lazy var imgViewer : UIView = {
        let view = CustomView()
        view.backgroundColor = Colors.appBGColor
        view.refreshCorners(cornerValue: 20)
        view.refreshShadowColor(shadowColor: .black)
        view.refreshShadowRadius(shadowRadius: 5)
        view.refreshShadowOpacity(shadowOpacity: 0.6)
        self.view.addSubview(view)

        view.snp.makeConstraints { (make) in
            make.top.equalTo(tblView.snp.topMargin)
            make.left.equalTo(20)
            make.bottom.right.equalTo(-20)
        }
        return view
    }()
    
    lazy var btnCloseViewer : CancelStyleButton = {
        let btn = CancelStyleButton()
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(btnCancelClicked), for: .touchUpInside)
        
        imgViewer.addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.size.equalTo(40)
        }
        return btn
    }()
    
    lazy var displayImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgViewer.addSubview(imgView)

        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(btnCloseViewer.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(-10)
        }
        return imgView
    }()
        
    var dataArray = [AxxessTech]()
    var isAscending = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colors.appBGColor
        self.title = "Coding Test"
        
        let btnSort = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortByType))
        self.navigationItem.rightBarButtonItem  = btnSort
        
        fetchingSampleData()
    }
    
    @objc func sortByType() {
        isAscending = !isAscending
        fetchDatafromDB()
    }
    
    //MARK: - UserDefine Methods
    
    @objc func btnCancelClicked() {
        imgViewer.isHidden = true
    }
    
    fileprivate func fetchingSampleData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if appDelegate.isNetworkAvailable {
                DatabaseManager.getSharedWriteCurrentDatabase { (db) in
                    AxxessTech.truncateTable(db)
                }
                self.importDataForAxxessTechAPI()
            } else {
                self.fetchDatafromDB()
            }
        }
    }
    
    fileprivate func fetchDatafromDB() {
        DatabaseManager.getSharedCurrentDatabase { (db) in
            if let sampleData = AxxessTech.getSampleData(db, self.isAscending) {
                self.dataArray.removeAll()
                self.dataArray = sampleData
                self.tblView.reloadData()
            }
        }
    }
}

//MARK:- UITableView DataSource & Delegate Methods

extension ListingVC : UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellIdentifier, for: indexPath) as! CustomCell
        aCell.cellData = dataArray[indexPath.row]
        aCell.setupCustomCell()
        return aCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = dataArray[indexPath.row]
        if data.type == "image" {
            imgViewer.isHidden = false
            btnCloseViewer.setTitle("X", for: .normal)
            displayImgView.kf.indicatorType = .activity
            
            displayImgView.kf.setImage(with: URL(string: data.data ?? "")){ (result) in
                switch result {
                case .success(let value):
                    self.displayImgView.image = value.image
                case .failure:
                    self.displayImgView.image = UIImage(named: "No_Image")
                }
            }
        }
    }
}

//MARK:- Products Group API Manager
extension ListingVC {
    
    func importDataForAxxessTechAPI() {
        
        ProgressHUD.animationType = .circleSpinFade
        ProgressHUD.colorAnimation = Colors.appCancelBtnColor
        ProgressHUD.show()
        
        AxxessTechApiManager.getSampleData { (error) in
            if error == nil {
                debugPrint("AxxessTech Data imported.")
                self.fetchDatafromDB()
            } else {
                debugPrint(error.debugDescription)
            }
            ProgressHUD.dismiss()
        }
    }
}
