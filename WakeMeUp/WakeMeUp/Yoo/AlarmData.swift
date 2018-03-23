//
//  AlarmData.swift
//  WakeMeUp
//
//  Created by Hansub Yoo on 2018. 3. 24..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation

struct AlarmData {
    static var date: Date {
        get {
            return date
        }
        set(newVal) {
            date = newVal
        }
    }
    
    init() {}
    
    //    init(date: Date) {
    //        self.date = date
    //    }
    //
    //    func get() -> String {
    //        let dateFM = DateFormatter()
    //        dateFM.timeStyle = .short
    //        let dateStr = dateFM.string(from: date)
    //        return dateStr
    //    }
}
