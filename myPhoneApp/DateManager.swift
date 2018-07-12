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
        let rangeOfWeeks = Calendar.current.range(of: .weekOfMonth, in: .month, for: firstDateOfMonth())
        let numberOfWeeks = Int((rangeOfWeeks?.count)!)
        numberOfItems = numberOfWeeks * daysPerWeek
        return numberOfItems
    }
    
    func firstDateOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: selectedDate)
        components.day = 1
        let firstDateOfMonth = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }
    
    func dateForCellAtIndexPath(numberOfItems: Int) {
        let ordinalityOfFirstDay = Calendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth())
        for i in 0 ..< numberOfItems {
            var dateOfComponents = DateComponents()
            dateOfComponents.day = i - (ordinalityOfFirstDay! - 1)
            let date = Calendar.current.date(byAdding: dateOfComponents, to: firstDateOfMonth())
            currentMonthOfDates.append(date!)
        }
    }
    
    func conversionDateFormat(indexPath: IndexPath) -> String {
        dateForCellAtIndexPath(numberOfItems: numberOfItems)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: currentMonthOfDates[indexPath.row])
    }
}
