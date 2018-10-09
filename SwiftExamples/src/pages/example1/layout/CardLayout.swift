//
//  CardLayout.swift
//  SwiftExamples
//
//  Created by liqc on 2018/10/05.
//  Copyright © 2018年 liqc. All rights reserved.
//

import Foundation
import UIKit

class CardLayout: UICollectionViewFlowLayout {
    var lastOffset = CGPoint.zero
    
    var pageWidth: CGFloat {
        return self.itemSize.width + self.minimumLineSpacing
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var result = proposedContentOffset
        guard let collectionView = collectionView else {
            return result
        }
        
        let offsetMax = collectionView.contentSize.width - (pageWidth + self.sectionInset.right)
        let offsetMin: CGFloat = 0
        
        if lastOffset.x < offsetMin {
            lastOffset.x = offsetMin
        } else if lastOffset.x > offsetMax {
            lastOffset.x = offsetMax
        }
        
        let distance = abs(proposedContentOffset.x - lastOffset.x)
        let offset = proposedContentOffset.x > lastOffset.x ? pageWidth : -pageWidth
        
        if distance > pageWidth / 2 || (velocity.x > 0.2 && proposedContentOffset.x > lastOffset.x) || (velocity.x < -0.2 && proposedContentOffset.x < lastOffset.x) {
            result = CGPoint(x: lastOffset.x + offset, y: proposedContentOffset.y)
        } else {
            result = CGPoint(x: lastOffset.x, y: lastOffset.y)
        }
        
        lastOffset.x = result.x
        return result
    }
}
