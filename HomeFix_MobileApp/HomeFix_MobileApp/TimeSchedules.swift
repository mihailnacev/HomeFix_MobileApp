//
//  TimeSchedules.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class TimeSchedules {
  
  static let days = ["Sunday", "Monday", "Tuesday", "Wednessday", "Thursday", "Friday", "Saturday"]
    var Id: Int?
  var UserId: Int?
    var StartDay: Int?
    var StartTime: String?
    var EndDay: Int?
    var EndTime:String?
  
  init(){}
  
  init(data: [String: Any]){
    self.Id = data["Id"] as? Int
    self.UserId = data["UserId"] as? Int
    self.StartDay = data["StartDay"] as? Int
    self.StartTime = data["StartTime"] as? String
    self.EndDay = data["EndDay"] as? Int
    self.EndTime = data["EndTime"] as? String
  }
    
  init(Id: Int, UserId: Int, StartDay: Int, StartTime: String, EndDay: Int, EndTime: String, TheUserThatWorksOnThisSchedule: Users){
      self.Id = Id
    self.UserId = UserId
       self.StartDay=StartDay
       self.StartTime=StartTime
       self.EndDay=EndDay
       self.EndTime=EndTime
    }
  
}
