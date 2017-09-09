//
//  TimeSchedules.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class TimeSchedules: NSObject {
    
    var Id: Int?
    var StartDay: Int?
    var StartTime: String?
    var EndDay: Int?
    var EndTime:String?
    var TheUserThatWorksOnThisSchedule: Users?
    
    init(StartDay: Int, StartTime: String, EndDay: Int, EndTime: String, TheUserThatWorksOnThisSchedule: Users){
       self.StartDay=StartDay
       self.StartTime=StartTime
       self.EndDay=EndDay
       self.EndTime=EndTime
       self.TheUserThatWorksOnThisSchedule=TheUserThatWorksOnThisSchedule
    }
  
  override init() {}
}
