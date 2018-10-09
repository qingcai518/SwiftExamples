//
//  Example1Controller.swift
//  SwiftExamples
//
//  Created by liqc on 2018/10/05.
//  Copyright © 2018年 liqc. All rights reserved.
//

import UIKit

class Example1Controller: UIViewController {
    let viewModel = Example1ViewModel()
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
    }
    
    private func setSubviews() {
        self.view.backgroundColor = UIColor.white
        
        // set collectionview.
        let width = screenWidth - 2 * 24
        let height: CGFloat = 240
        let layout = CardLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        
        let frame = CGRect(x: 0, y: 0, width: screenWidth, height: height)
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        self.view.addSubview(collectionView)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.id)
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(height)
        }
    }
}

extension Example1Controller: UICollectionViewDelegate {
    
}

extension Example1Controller: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.id, for: indexPath) as! CardCell
        let cardData = viewModel.cards[indexPath.item]
        cell.configure(with : cardData)
        
        return cell
    }
}
