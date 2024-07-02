//
//  Task.swift
//  schedule
//
//  Created by MacBook Pro on 01/07/2024.
//

import Foundation

struct Task {
    var name: String
    var timeStart: Time
    var timeFinisth: Time
    
    init(name: String, timeStart: Time, timeFinisth: Time) {
        self.name = name
        self.timeStart = timeStart
        self.timeFinisth = timeFinisth
    }
}
