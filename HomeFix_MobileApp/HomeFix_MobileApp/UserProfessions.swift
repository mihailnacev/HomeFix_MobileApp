//
//  UserProfessions.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class UserProfessions{
    
    var Id: Int?
    var TheProfession: Professions?
    var User: Users?
    var Services: [ProfessionServices]?
    
    init(TheProfession: Professions, User: Users, Services: [ProfessionServices]){
        self.TheProfession=TheProfession
        self.User=User
        self.Services=Services
    }
    

}
