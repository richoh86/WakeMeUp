//
//  schedulerAppDelegate.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 24..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation


protocol AlarmSchedulerDelegate {
    func setNotificationWithDate(_ date: Date, onWeekdaysForNotify:[Int], snoozeEnabled: Bool, onSnooze:Bool, soundName: String, index: Int)
    //helper
    func setNotificationForSnooze(snoozeMinute: Int, soundName: String, index: Int)
//    func setupNotificationSettings() -> UIUserNotificationSettings
//    func setupNotificationSettings() -> Noti
    func reSchedule()
    func checkNotification()
}
