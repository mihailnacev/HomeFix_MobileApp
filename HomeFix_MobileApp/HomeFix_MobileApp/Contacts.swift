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
    var ThePhoneOwner: Users?
  
    init() {}
    
    init(PhoneNumber: String, ThePhoneOwner: Users){
        self.PhoneNumber=PhoneNumber
        self.ThePhoneOwner=ThePhoneOwner
    }
    
}
