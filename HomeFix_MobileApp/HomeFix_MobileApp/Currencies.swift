//
//  Currencies.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class Currencies {
    
    var Id: Int?
    var CurrencySign: String?
    var CurrencyFullName: String?
    
    init(CurrencySign: String, CurrencyFullName: String){
        self.CurrencyFullName=CurrencyFullName
        self.CurrencySign=CurrencySign
    }
}
