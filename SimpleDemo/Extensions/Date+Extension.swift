//
//  Date+Extension.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 30/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation


extension Date {
    func startOfMonth() -> Date? {
        guard
            let cal: Calendar = Calendar.current,
            var comp: DateComponents = (cal as NSCalendar).components([.year, .month], from: self)
            
            else { return nil }
        comp.to12pm()
        return cal.date(from: comp)!
    }
    
    func endOfMonth() -> Date? {
        guard
            let cal: Calendar = Calendar.current,
            var comp: DateComponents = DateComponents() else { return nil }
        comp.month = 1
        comp.day = -1
        (comp as NSDateComponents).timeZone = TimeZone(abbreviation: "UTC")
        return (cal as NSCalendar).date(byAdding: comp, to: self.startOfMonth()!, options: [])!
    }
    
    func Databse_dateconvertor(_ datestr: String!) -> Date
    {
        let dateFormatter = DateFormatter()
        let twelveHourLocale: Locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = twelveHourLocale
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let gotDate: Date = dateFormatter.date(from: datestr)!
        return gotDate
    }
}


internal extension DateComponents {
    mutating func to12pm() {
        self.hour = 24
        self.minute = 0
        self.second = 0
    }
}
