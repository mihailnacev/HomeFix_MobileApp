//
//  UserAddresses.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class UserAddresses {
    
    var Id: Int?
    var StreetName: String?
    var City: String?
    var Country: String?
    var Latitude: Float?
    var Longitude: Float?
  
  init() {}
    
  init(Id:Int, StreetName: String, City: String, Country: String, Latitude: Float, Longitude: Float){
        self.Id = Id
        self.StreetName=StreetName
        self.City=City
        self.Country=Country
        self.Latitude=Latitude
        self.Longitude=Longitude
    }
  
  init(data: [String: Any]) {
    self.Id = data["Id"] as? Int
    self.StreetName = data["StreetName"] as? String
    self.City = data["City"] as? String
    self.Country = data["Country"] as? String
    self.Latitude = data["Latitude"] as? Float
    self.Longitude = data["Longitude"] as? Float
  }
  
}
