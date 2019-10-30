//
//  Model.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 26/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation

struct Model : Codable {
    var username    : String?
    var success     : String?
    var message     : String?
    var peradmin    : String?
    var peradd      : String?
    var perinspect  : String?
    var perkill     : String?
    var perupdate   : String?
    var perreports  : String?
    var perincubator: String?
    var permove     : String?
    var fname       : String?
    var lname       : String?
    var graderid    : String?
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case fname   = "Fname"
        case lname   = "Lname"
        case username, success
        case peradmin, peradd, perinspect, perkill, perupdate, perreports, perincubator, permove
        case graderid
    }
    
}
 
