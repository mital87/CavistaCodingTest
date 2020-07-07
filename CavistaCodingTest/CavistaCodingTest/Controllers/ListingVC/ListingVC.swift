//
//  ListingVC.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit
import SnapKit

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
    
    var dataArray = [AxxessTech]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.title = "Coding Test"
                
        DatabaseManager.getSharedWriteCurrentDatabase { (db) in
            AxxessTech.truncateTable(db)
        }
        importDataForAxxessTechAPI()
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
}

    
//MARK:- Products Group API Manager
extension ListingVC {
    func importDataForAxxessTechAPI() {
        
        AxxessTechApiManager.getSampleData { (error) in
            
            if error == nil {
                
                DatabaseManager.getSharedCurrentDatabase { (db) in
                    if let sampleData = AxxessTech.getSampleData(db, "") {
                        self.dataArray = sampleData
                        self.tblView.reloadData()
                    }
                }
                debugPrint("AxxessTech Data imported.")
            } else {
                debugPrint(error.debugDescription)
            }
        }
    }
}
