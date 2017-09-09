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
    var TheUserLivingOnThisAddress: Users?
    
    init(StreetName: String, City: String, Country: String, Latitude: Float, Longitude: Float, TheUserLivingOnThisAddress: Users){
        self.StreetName=StreetName
        self.City=City
        self.Country=Country
        self.Latitude=Latitude
        self.Longitude=Longitude
        self.TheUserLivingOnThisAddress=TheUserLivingOnThisAddress
    }
  
  init() {}
}
