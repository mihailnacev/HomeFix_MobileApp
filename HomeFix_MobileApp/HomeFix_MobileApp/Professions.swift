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
    
    init(ProfessionName: String, ProffessionDescription: String){
        self.ProfessionName=ProfessionName
        self.ProfessionDescription=ProffessionDescription
    }

}
