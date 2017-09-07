//
//  UserPasswordsHistory.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class UserPasswordsHistory {
    
    var Id: Int?
    var PasswordHash: String?
    var PasswordSalt: String?
    var ExpiredOn: Date?
    var TheCredentialForThisHistory: Credentials?
    
    init(PasswordHash: String, PasswordSalt: String, ExpiredOn: Date, TheCredentialForThisHistory: Credentials){
        self.PasswordHash=PasswordHash
        self.PasswordSalt=PasswordSalt
        self.ExpiredOn=ExpiredOn
        self.TheCredentialForThisHistory=TheCredentialForThisHistory
    }
    
}
