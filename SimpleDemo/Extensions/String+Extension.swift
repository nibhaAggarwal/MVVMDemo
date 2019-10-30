//
//  String+Extension.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 29/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
//    func replace(target: String, withString: String) -> String {
//        return self.replace(target: target, withString: withString)
//    }
    
    var isValidEmail: Bool {
        let emailRegEx = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
   static func isValidEmail(email: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailTest.evaluate(with: email)
   }
       
   static func isValidPwd(pwd: String) -> Bool {
       let length: Int = pwd.count
       if length >= 8 {
           return true
       }
       return false
   }
    
    static func mediumDateShortTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    static func mediumDateNoTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }
    
    static func fullDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: date)
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func toInteger() -> Int? {
        return NumberFormatter().number(from: self)?.intValue
    }
    
    static func todaydate() -> String {
        let dateFormatter = DateFormatter()
        let twelveHourLocale: Locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = twelveHourLocale
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let todayDate: String = "\(dateFormatter.string(from: Date()))"
        return todayDate as String
    }
    
    static func forTailingZero(_ temp: Double) -> String{
        let tempVar = String(format: "%g", temp)
        return tempVar
    }
    
    
    /*
     "abcde"[0] == "a"
     "abcde"[0...2] == "abc"
     "abcde"[2..<4] == "cd"
     */
//    subscript (r: Range<Int>) -> String {
//        let start = index(startIndex, offsetBy: r.lowerBound)
//        let end = index(startIndex, offsetBy: r.upperBound)
//        return self[(start ..< end)]
//    }
    
    static func removeSpecialCharsFromString(str: String) -> String {
        let chars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_")
        return String(str.filter { chars.contains($0) })
    }
}
