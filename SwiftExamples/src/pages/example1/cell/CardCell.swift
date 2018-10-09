//
//  CardCell.swift
//  SwiftExamples
//
//  Created by liqc on 2018/10/05.
//  Copyright © 2018年 liqc. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    static let id = String(describing: type(of: self))
    let titleLbl = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLbl.text = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        // contentView.
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        
        // title label.
        titleLbl.textColor = UIColor.white
        titleLbl.font = UIFont.boldSystemFont(ofSize: 24)
        titleLbl.textAlignment = .center
        titleLbl.numberOfLines = 0
        
        contentView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(24)
        }
    }
    
    func configure(with data: CardData) {
        titleLbl.text = data.name
        contentView.backgroundColor = data.color
    }
}
