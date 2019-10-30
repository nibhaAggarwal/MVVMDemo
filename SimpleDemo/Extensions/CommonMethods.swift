//
//  CommonMethods.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 30/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation

class CommonMethods {
    //MARK :- Find unique Value from Array
    static func uniq<S: Sequence, E: Hashable>(_ source: S) -> [E] where E==S.Iterator.Element {
        var seen: [E:Bool] = [:]
        return source.filter({ (v) -> Bool in
            return seen.updateValue(true, forKey: v) == nil
        })
    }
}



