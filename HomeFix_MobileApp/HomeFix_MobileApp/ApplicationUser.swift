//
//  ApplicationUser.swift
//  HomeFix_MobileApp
//
//  Created by Gjorche Cekovski on 9/10/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class ApplicationUser {
  
  var AccessToken: String?
  var TokenType: String?
  var ExpiresOn: Date?
  var TheUser: Users?
  
  private init(AccessToken: String, TokenType: String, ExpiresOn: Date){
    self.AccessToken = AccessToken
    self.TokenType = TokenType
    self.ExpiresOn = ExpiresOn
    self.LoadUserData();
  }
  
  private init(jsonDictionary : [String: Any]){
    self.AccessToken = jsonDictionary["access_token"] as? String
    self.TokenType = jsonDictionary["token_type"] as? String
    
    let expiresIn = jsonDictionary["expires_in"] as? Int
    self.ExpiresOn = Date(timeIntervalSinceNow: Double(expiresIn!))
    
    self.LoadUserData();
  }
  
  private static var _Instance:ApplicationUser? = nil
  
  static func getInstance() -> ApplicationUser? {
    return _Instance
  }
  
  static func newInstance(jsonDictionary : [String: Any]) {
    _Instance = ApplicationUser(jsonDictionary: jsonDictionary)
  }
  
  static func desctroyInstance(){
    _Instance = nil
  }
  
  static func isTokenExpired() -> Bool{
    if (_Instance == nil){
      return true;
    }
    
    if (_Instance?.ExpiresOn == nil){
      return true;
    }
    
    let currentDate = Date()
    return currentDate > (_Instance?.ExpiresOn)!;
  }
  
  private func LoadUserData(){
    var headers: Dictionary<String, String> = Dictionary<String, String>()
    headers.updateValue("application/json", forKey: "Content-Type")
    headers.updateValue("\(self.TokenType ?? "") \(self.AccessToken ?? "")", forKey: "Authorization")
    
    BaseService.GetRequest(urlString: "\(BaseService.baseURL)api/account/profile", headers: headers, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
      
      if (error != nil){
        ApplicationUser.desctroyInstance();
        return
      }
      
      let httpresponse = response as? HTTPURLResponse
      if ((httpresponse?.statusCode)! >= 200 && (httpresponse?.statusCode)! <= 299 ){
          var users: Users;
          do {
              let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
              users = Users(data: dataDictionary as! [String : AnyObject])
          } catch {
              return;
          }
      
          self.TheUser = users;
      } else {
        ApplicationUser.desctroyInstance()
      }
      
    })
  }
  
}
