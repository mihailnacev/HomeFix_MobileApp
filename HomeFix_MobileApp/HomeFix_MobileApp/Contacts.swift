//
//  Contacts.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class Contacts {
    
    var Id: Int?
    var PhoneNumber: String?
  
    init() {}
    
    init(Id: Int, PhoneNumber: String){
        self.Id = Id
        self.PhoneNumber=PhoneNumber
    }
  
  init(data: [String:Any]) {
    self.Id = data["Id"] as? Int
    self.PhoneNumber = data["PhoneNumber"] as? String
  }
    
}
