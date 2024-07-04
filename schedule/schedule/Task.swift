//
//  Task.swift
//  schedule
//
//  Created by MacBook Pro on 01/07/2024.
//

import Foundation

struct Task {
    var id: String
    var name: String
    var timeStart: Time
    var timeFinisth: Time
    var wasDone: Bool = false
    var isWeeklyTask: Bool = false
    var typeOfTask: Int = 0
    
    init(name: String, timeStart: Time, timeFinisth: Time, isWeeklyTask: Bool, typeOfTask: Int) {
        self.id = String(Date().timeIntervalSince1970)
        self.name = name
        self.timeStart = timeStart
        self.timeFinisth = timeFinisth
        self.isWeeklyTask = isWeeklyTask
        self.typeOfTask = typeOfTask
    }
    
    init(name: String, timeStart: Time, timeFinisth: Time) {
        self.id = String(Date().timeIntervalSince1970)
        self.name = name
        self.timeStart = timeStart
        self.timeFinisth = timeFinisth
    }
    
}
