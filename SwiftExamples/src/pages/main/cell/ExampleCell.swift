//
//  ExampleCell.swift
//  SwiftExamples
//
//  Created by liqc on 2018/10/05.
//  Copyright © 2018年 liqc. All rights reserved.
//

import UIKit
import SnapKit

class ExampleCell: UITableViewCell {
    static let id = String(describing: type(of: self))
    
    let indexLbl = UILabel()
    let titleLbl = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        indexLbl.font = UIFont.systemFont(ofSize: 16)
        indexLbl.textColor = UIColor.black
        contentView.addSubview(indexLbl)
        indexLbl.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
            make.width.equalTo(60)
        }
        
        titleLbl.font = UIFont.systemFont(ofSize: 16)
        titleLbl.textColor = UIColor.black
        contentView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(24)
            make.left.equalTo(indexLbl.snp.right)
            make.right.equalToSuperview().inset(24)
        }
    }
    
    func configure(with data: ExampleData) {
        self.indexLbl.text = "\(data.id)"
        self.titleLbl.text = data.name
    }
}
