//
//  DateManager.swift
//  myPhoneApp
//
//  Created by 陰山賢太 on 2018/07/09.
//  Copyright © 2018年 Kageken. All rights reserved.
//

import UIKit

class DateManager: NSObject {

    var currentMonthOfDates = [Date]()
    var selectedDate = Date()
    let daysPerWeek: Int = 7
    var numberOfItems: Int!
    
    func daysAcquisition() -> Int {
        let rangeOfWeeks = Calendar.current.range(of: Calendar.WeekOfMonth, in: Calendar.Month, for: firstDateOfMonth())
        let numberOfWeeks = rangeOfWeeks.length
        numberOfItems = numberOfWeeks * daysPerWeek
        return numberOfItems
    }
    
    func firstDateOfMonth() -> Date {
        let components = Calendar.current.component([.year, .month, .day], from: selectedDate)
        components.day = 1
        let firstDateOfMonth = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }
}
