//
//  Time.swift
//  schedule
//
//  Created by MacBook Pro on 01/07/2024.
//

import Foundation

struct Time {
    var hour: Int
    var minute: Int
    
    func timeFrom0h() -> Int{
        return self.hour * 60 + minute
    }
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
    
    func show() -> String {
        var hour : String = ""
        var minute : String = ""
        if (self.hour < 10) {
            hour = "0\(self.hour)"
        } else {
            hour = "\(self.hour)"
        }
        
        if (self.minute < 10) {
            minute = "0\(self.minute)"
        } else {
            minute = "\(self.minute)"
        }
        return "\(hour):\(minute)"
    }
}
