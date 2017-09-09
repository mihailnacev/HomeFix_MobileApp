//
//  Users.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class Users{
    
    var Id: Int?
    var UserFirstName: String?
    var UserLastName: String?
    var RatingCount: Int?
    var RatingSum: Int?
  
  init() {}
  
  init(data: [String: AnyObject]) {
    self.UserFirstName = data["UserFirstName"] as? String ?? ""
    self.UserLastName = data["UserLastName"] as? String ?? ""
    self.RatingSum = data["RatingSum"] as? Int ?? 0
    self.RatingCount = data["RatingCount"] as? Int ?? 0
    self.Id = data["Id"] as? Int ?? 0
  }
    
  init(Id: Int, UserFirstName: String, UserLastName: String, RatingCount: Int, RatingSum: Int){
        self.Id = Id
        self.UserFirstName=UserFirstName
        self.UserLastName=UserLastName
        self.RatingCount=RatingCount
        self.RatingSum=RatingSum
    }

}
