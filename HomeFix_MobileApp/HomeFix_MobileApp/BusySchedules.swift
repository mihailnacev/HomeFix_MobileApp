//
//  BusySchedules.swift
//  HomeFix_MobileApp
//
//  Created by Mihail Nacev on 9/5/17.
//  Copyright © 2017 FINKI_Skopje. All rights reserved.
//

import UIKit

class BusySchedules {
    
    var Id: Int?
    var BusyPeriodStartOn: Date?
    var BusyPeriodEndsOn: Date?
    var TheUserThatIsNotAvailableForThesePeriods: Users?
    
    init(BusyPeriodStartOn: Date, BusyPeriodEndsOn: Date, TheUserThatIsNotAvailableForThesePeriods: Users) {
        self.BusyPeriodStartOn=BusyPeriodStartOn
        self.BusyPeriodEndsOn=BusyPeriodEndsOn
        self.TheUserThatIsNotAvailableForThesePeriods=TheUserThatIsNotAvailableForThesePeriods
    }

  init() {}
}
