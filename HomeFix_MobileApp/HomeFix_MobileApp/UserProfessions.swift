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
  var UserId: Int?
  var ProfessionId: Int?
    var TheProfession: Professions?
  
  init() {}
    
  init(Id: Int, UserId: Int, ProfessionId: Int, TheProfession: Professions){
    self.Id = Id;
    self.ProfessionId = ProfessionId
    self.UserId = UserId
        self.TheProfession=TheProfession
    }
  
  init(data: [String: Any]){
    self.Id = data["Id"] as? Int
    self.UserId = data["UserId"] as? Int
    self.ProfessionId = data["ProfessionId"] as? Int
    self.TheProfession = Professions(data: data["TheProfession"] as! [String : Any])
  }

}
