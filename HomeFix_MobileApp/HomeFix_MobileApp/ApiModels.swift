//
//  ApiModels.swift
//  HomeFix_MobileApp
//
//  Created by Gjorche Cekovski on 9/9/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class UserRegistrationModel{
  
  var FirstName: String?
  var LastName: String?
  var UserName: String?
  var Password: String?
  
  init(FirstName: String,LastName: String, UserName: String,Password: String
) {
    self.FirstName = FirstName
    self.LastName = LastName
    self.UserName = UserName
    self.Password = Password
  }
}

class UserUpdateModel {
  var FirstName: String?
  var LastName: String?
  
  init(FirstName: String,LastName: String){
    self.FirstName = FirstName
    self.LastName = LastName
  }
}

class ChangePasswordModel {
  var UserName: String?
  var OldPassword: String?
  var NewPassword: String?
  
  init(UserName: String,OldPassword: String,NewPassword: String){
    self.UserName = UserName
    self.OldPassword = OldPassword
    self.NewPassword = NewPassword
  }
}

  class DeletePasswordModel {
    var UserName: String?
    var Password: String?
    
    init(UserName: String,Password: String){
      self.UserName = UserName
      self.Password = Password
    }

  }

class AssignProfessionModel {
  var ProfessionToAssign: Int?
  
  init(Profession: Int){
    self.ProfessionToAssign = Profession
  }
}

class AddUpdateServiceModel {
  var UserProfessionId: Int?
  var ServiceName: String?
  var ServiceUnit: String?
  var ServiceUnitPrice: Float?
  var Currency: Int?
  
  init(ServiceName: String,ServiceUnit: String,ServiceUnitPrice: Float,Currency: Int){
    self.Currency = Currency
    self.ServiceName = ServiceName
    self.ServiceUnit = ServiceUnit
    self.ServiceUnitPrice = ServiceUnitPrice
  }
  
  init(UserProfessionId: Int,ServiceName: String,ServiceUnit: String,ServiceUnitPrice: Float,Currency: Int){
    self.UserProfessionId = UserProfessionId
    self.Currency = Currency
    self.ServiceName = ServiceName
    self.ServiceUnit = ServiceUnit
    self.ServiceUnitPrice = ServiceUnitPrice
  }
}

class AddUpdateWorkScheduleModel {
  var UtcHours : Int?
  var UtcMinutes: Int?
  var StartDay: Int?
  var StartHours: Int?
  var StartMinutes: Int?
  var EndDay: Int?
  var EndHours: Int?
  var EndMinutes: Int?
  
  init(UtcHours : Int, UtcMinutes: Int, StartDay: Int, StartHours: Int, StartMinutes: Int, EndDay: Int, EndHours: Int, EndMinutes: Int){
    self.UtcHours = UtcHours
    self.UtcMinutes = UtcMinutes
    self.StartDay = StartDay
    self.StartHours = StartHours
    self.StartMinutes = StartMinutes
    self.EndDay = EndDay
    self.EndHours = EndHours
    self.EndMinutes = EndMinutes
  }
}

class AddUpdateBusyScheduleModel {
  var UtcHours : Int?
  var UtcMinutes: Int?
  var StartYear:Int?
  var StartMonth:Int?
  var StartDay: Int?
  var StartHours: Int?
  var StartMinutes: Int?
  var EndYear:Int?
  var EndMonth:Int?
  var EndDay: Int?
  var EndHours: Int?
  var EndMinutes: Int?
  
  init(UtcHours : Int, UtcMinutes: Int, StartYear:Int,StartMonth:Int, StartDay: Int, StartHours: Int, StartMinutes: Int, EndYear:Int, EndMonth:Int, EndDay: Int, EndHours: Int, EndMinutes: Int){
    self.UtcHours = UtcHours
    self.UtcMinutes = UtcMinutes
    self.StartYear = StartYear
    self.StartMonth = StartMonth
    self.StartDay = StartDay
    self.StartHours = StartHours
    self.StartMinutes = StartMinutes
    self.EndYear = EndYear;
    self.EndMonth = EndMonth;
    self.EndDay = EndDay
    self.EndHours = EndHours
    self.EndMinutes = EndMinutes
  }
}

class RateMode {
  var UserId: Int?
  var Points: Int?
  
  init(UserId: Int, Points: Int?){
    self.Points = Points
    self.UserId = UserId
  }
}

