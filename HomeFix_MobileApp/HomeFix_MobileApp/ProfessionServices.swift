//
//  ProfessionServices.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class ProfessionServices{
    
    var Id: Int?
  var UserId: Int?
  var UserProfessionId: Int?
    var ServiceName: String?
    var ServiceUnit: String?
    var ServiceUnitPrice: Float?
  var ServiceUnitId: Int?
    var TheCurrencyUsed: Currencies?
  
  init() {}
  
  init(Id: Int, UserId: Int, UserProfessionId:Int, ServiceName: String, ServiceUnit: String, ServiceUnitPrice: Float, ServiceUnitId: Int?, TheCurrencyUsed: Currencies){
        self.Id = Id
        self.UserId = UserId
        self.UserProfessionId = UserProfessionId
        self.ServiceName=ServiceName
        self.ServiceUnit=ServiceUnit
        self.ServiceUnitPrice=ServiceUnitPrice
        self.ServiceUnitId = ServiceUnitId
        self.TheCurrencyUsed=TheCurrencyUsed
    }
  
  init(data: [String: Any]){
    self.Id = data["Id"] as? Int
    self.UserId = data["UserId"] as? Int
    self.UserProfessionId = data["UserProfessionId"] as? Int
    self.ServiceName = data["ServiceName"] as? String
    self.ServiceUnit = data["ServiceUnit"] as? String
    self.ServiceUnitPrice = data["ServiceUnitPrice"] as? Float
    self.ServiceUnitId = data["ServiceUnitId"] as? Int
    self.TheCurrencyUsed = Currencies(data: data["TheCurrencyUsed"] as! [String : Any])

  }

  }
