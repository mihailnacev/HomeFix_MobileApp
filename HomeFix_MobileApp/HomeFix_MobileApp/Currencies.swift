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
  
  init() {}
  
  init(Id: Int, CurrencySign: String, CurrencyFullName: String){
        self.Id = Id
        self.CurrencyFullName=CurrencyFullName
        self.CurrencySign=CurrencySign
    }
  
  init(data: [String: Any]){
    self.Id = data["Id"] as? Int
    self.CurrencySign = data["CurrencySign"] as? String
    self.CurrencyFullName = data["CurrencyFullName"] as? String
  }
}
