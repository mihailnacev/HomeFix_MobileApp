//
//  ProfessionServices.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class ProfessionServices{
    
    var Id: Int?
    var ServiceName: String?
    var ServiceUnit: String?
    var ServiceUnitPrice: Float?
    var TheCurrencyUsed: Currencies?
    var TheProfessionForThisService: UserProfessions?
    
    init(ServiceName: String, ServiceUnit: String, ServiceUnitPrice: Float, TheCurrencyUsed: Currencies, TheProfessionForThisService: UserProfessions){
        self.ServiceName=ServiceName
        self.ServiceUnit=ServiceUnit
        self.ServiceUnitPrice=ServiceUnitPrice
        self.TheCurrencyUsed=TheCurrencyUsed
        self.TheProfessionForThisService=TheProfessionForThisService
    }

  init() {}
}
