//
//  ExampleData.swift
//  SwiftExamples
//
//  Created by liqc on 2018/10/05.
//  Copyright © 2018年 liqc. All rights reserved.
//

import Foundation
import UIKit

struct ExampleData {
    let id : Int
    let name: String
    let next: UIViewController
    
    init(id: Int, name: String, next: UIViewController) {
        self.id = id
        self.name = name
        self.next = next
    }
}
