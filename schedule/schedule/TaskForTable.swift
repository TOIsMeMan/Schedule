//
//  TaskForTable.swift
//  schedule
//
//  Created by MacBook Pro on 01/07/2024.
//

import Foundation
import UIKit

struct TaskForTable {
    var time: Int
    var color: UIColor
    var indexOfTasks: Int = -1
    
    init(time: Int, color: UIColor, indexOfTasks: Int) {
        self.time = time
        self.color = color
        self.indexOfTasks = indexOfTasks
    }
    
    init(time: Int, color: UIColor) {
        self.time = time
        self.color = color
        self.indexOfTasks = -1
    }
}
