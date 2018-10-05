//
//  MainViewModel.swift
//  SwiftExamples
//
//  Created by liqc on 2018/10/05.
//  Copyright © 2018年 liqc. All rights reserved.
//

import Foundation
import UIKit

class MainViewModel {
    var examples = [ExampleData]()
    
    func setNames() {
        let example1 = ExampleData(id: 1, name: "UICollectionView水平翻页", next: Example1Controller())
        let example2 = ExampleData(id: 2, name: "Coming soon", next: Example2Controller())
        
        examples = [example1, example2]
        
        for i in 3...16 {
            let example = ExampleData(id: i, name: "Coming soon", next: UIViewController())
            examples.append(example)
        }
    }
}
