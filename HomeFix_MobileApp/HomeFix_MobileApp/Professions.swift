//
//  Professions.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class Professions {
    
    var Id: Int?
    var ProfessionName: String?
    var ProfessionDescription: String?
  
  init() {}
  
  init(Id:Int, ProfessionName: String, ProffessionDescription: String){
        self.Id = Id
        self.ProfessionName=ProfessionName
        self.ProfessionDescription=ProffessionDescription
    }

  init(data: [String: Any]){
    self.Id = data["Id"] as? Int
    self.ProfessionName = data["ProfessionName"] as? String
    self.ProfessionDescription = data["ProfessionDescription"] as? String
  }
  
}
