//
//  Credentials.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class Credentials {
    
    var Id: Int?
    var UserName: String?
    var PasswordHash: String?
    var PasswordSalt: String?
    var TheUserForThisCredential: Users?
    var TheHistoryForTheseCredentials: [UserPasswordsHistory]?
    
    init(UserName: String, PasswordHash: String, PasswordSalt: String, TheUserForThisCredential: Users, TheHistoryForTheseCredentials: [UserPasswordsHistory])
    {
        self.UserName=UserName
        self.PasswordHash=PasswordHash
        self.PasswordSalt=PasswordSalt
        self.TheUserForThisCredential=TheUserForThisCredential
        self.TheHistoryForTheseCredentials=TheHistoryForTheseCredentials
    }
}
