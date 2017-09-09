//
//  Ratings.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class Ratings{
    
    var Id: Int?
    var FeedbackDateTime: Date?
    var FeedbackPoints: Int?
    var TheRatedUser: Users?
    
    init(FeedbackDateTime: Date, FeedbackPoints: Int, TheRatedUser: Users){
        self.FeedbackDateTime=FeedbackDateTime
        self.FeedbackPoints=FeedbackPoints
        self.TheRatedUser=TheRatedUser
    }
  
  init() {}
}
