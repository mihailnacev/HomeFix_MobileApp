//
//  Users.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class Users{
    
    var Id: Int?
    var UserFirstName: String?
    var UserLastName: String?
    var RatingCount: Int?
    var RatingSum: Int?
    var TheContactsForThisUser: [Contacts]?
    var TheRatingsGivenForThisUser: [Ratings]?
    var TheAddressesThatThisUserWorksOn: [UserAddresses]?
    var TheProfessionsThatThisUserKnows: [UserProfessions]?
    var TheTimeScheduleForThisUser: [TimeSchedules]?
    var TheBusyScheduleForThisUser: [BusySchedules]?
  
  init() {}
    
    init(UserFirstName: String, UserLastName: String, RatingCount: Int, RatingSum: Int, TheContactsForThisUser: [Contacts], TheRatingsGivenForThisUser: [Ratings], TheAddressesThatThisUserWorksOn: [UserAddresses], TheProfessionsThatThisUserKnows: [UserProfessions], TheTimeScheduleForThisUser: [TimeSchedules], TheBusyScheduleForThisUser: [BusySchedules]){
        
        self.UserFirstName=UserFirstName
        self.UserLastName=UserLastName
        self.RatingCount=RatingCount
        self.RatingSum=RatingSum
        self.TheContactsForThisUser=TheContactsForThisUser
        self.TheRatingsGivenForThisUser=TheRatingsGivenForThisUser
        self.TheAddressesThatThisUserWorksOn=TheAddressesThatThisUserWorksOn
        self.TheProfessionsThatThisUserKnows=TheProfessionsThatThisUserKnows
        self.TheTimeScheduleForThisUser=TheTimeScheduleForThisUser
        self.TheBusyScheduleForThisUser=TheBusyScheduleForThisUser
    }

}
