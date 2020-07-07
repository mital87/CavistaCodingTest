//
//  CustomCell.swift
//  CavistaCodingTest
//
//  Created by Mital Solanki on 6/7/20.
//  Copyright © 2020 Mital Solanki. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    //MARK: - Variables & Properties
    
    static var cellIdentifier = "CustomCell"
    var cellData : AxxessTech!
    
    lazy var lblID : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        self.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.width.equalTo(60)
        }
        return lbl
    }()
    
    lazy var lblIDVal : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        self.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.top.equalTo(lblID.snp.top)
            make.left.equalTo(lblID.snp.right).offset(10)
            make.right.equalTo(-10)
        }
        return lbl
    }()
    
    lazy var lblType : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        self.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.top.equalTo(lblIDVal.snp.bottom).offset(10)
            make.centerX.equalTo(lblID)
            make.width.equalTo(lblID)
        }
        return lbl
    }()
    
    lazy var lblTypeVal : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        self.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.top.equalTo(lblType.snp.top)
            make.centerX.equalTo(lblIDVal)
            make.width.equalTo(lblIDVal)
            if ((self.cellData.date ?? "").count == 0 && (self.cellData.data ?? "").count == 0) {
                make.bottom.equalTo(-10)
            }
        }
        return lbl
    }()
    
    lazy var lblDate : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        self.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.top.equalTo(lblTypeVal.snp.bottom).offset(10)
            make.centerX.equalTo(lblType)
            make.width.equalTo(lblType)
        }
        return lbl
    }()
    
    lazy var lblDateVal : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        self.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.top.equalTo(lblDate.snp.top)
            make.centerX.equalTo(lblTypeVal)
            make.width.equalTo(lblTypeVal)
            if ((self.cellData.data ?? "").count == 0) {
                make.bottom.equalTo(-10)
            }
        }
        return lbl
    }()
    
    lazy var lblData : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        self.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.top.equalTo(lblDateVal.snp.bottom).offset(10)
            make.centerX.equalTo(lblType)
            make.width.equalTo(lblType)
        }
        return lbl
    }()
    
    lazy var lblDataVal : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        self.addSubview(lbl)
        lbl.snp.makeConstraints { (make) in
            make.top.equalTo(lblData.snp.top)
            make.centerX.equalTo(lblDateVal)
            make.width.equalTo(lblDateVal)
            make.bottom.equalTo(-10)
        }
        return lbl
    }()
    
    //MARK: - UITableViewCell Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UserDefine Methods
    
    func setupCustomCell() {
        
        if let id = self.cellData.id {
            lblID.text = "Id: "
            lblIDVal.text = id
        }

        if let type = self.cellData.type {
            lblType.text = "Type: "
            lblTypeVal.text = type
        }
        
        if let date = self.cellData.date, date.count > 0 {
            lblDate.text = "Date: "
            lblDateVal.text = date
        } else {
            lblDate.text = ""
            lblDateVal.text = ""
        }
        
        if let data = self.cellData.data, data.count > 0 {
            lblData.text = "Data: "
            lblDataVal.text = data
        } else {
            lblData.text = ""
            lblDataVal.text = ""
        }
    }
}
