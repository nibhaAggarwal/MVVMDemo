//
//  AllDataModel.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 26/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation


struct AllDataModel: Codable {
    var alldetails : [AllDetails]
    
    enum CodingKeys: String, CodingKey {
        case alldetails = "all_details"
    }
}


struct AllDetails: Codable {
 //index 0
    var allGroups : [AllGroups]?
    var lastUpdateAllGps : String?
 //index 1
    var animalsCountData: [AnimalsCountData]?
    var lastupdateAnimals  : String?
//index2
    var generalDetails : [GeneralDetails]?
//index3
//    var killList: AnyObject?
//index4
    var allocatedPens : [AllocatedPens]?
    var lastUpdateAllocated: String?
//index5
    
    enum CodingKeys: String, CodingKey {
        case allGroups = "AllGroups"
        case lastUpdateAllGps = "last_update"
        case animalsCountData = "Animals_count_Data"
        case lastupdateAnimals = "lastupdate"
        case generalDetails = "general_details"
//        case killList = "kill_list"
        case allocatedPens = "AllocatedPens"
        case lastUpdateAllocated = "lasupdate"
    }
    
}

struct AllGroups: Codable {
    var groupname: String?
    var groupcode: String?
    var total: String?
    var available: String?
}

struct AnimalsCountData: Codable {
    var groupname: String?
    var namexx: String?
    var nameyy: String?
    var totalAnimals: String?
    var avgSize: String?
    var referGroup: String?
    
    enum CodingKeys: String, CodingKey {
        case groupname, namexx, nameyy
        case totalAnimals = "total_animals"
        case avgSize = "avg_size"
        case referGroup = "refer_group"
    }
}


struct GeneralDetails: Codable {
    var conditionData: [ConditionData]?
    var inspectionData: [InspectionData]?
    var graderData: [GraderData]?
    
    enum CodingKeys: String, CodingKey {
        case conditionData = "Condition_data"
        case inspectionData = "inspection_data"
        case graderData = "grader_data"
    }
}

struct ConditionData: Codable {
    var conditionid: String?
    var conditionname: String?
}

struct InspectionData: Codable {
    var inspectId: String?
    var inspectPeriod: String?
    
    enum CodingKeys: String, CodingKey {
        case inspectId = "inspect_id"
        case inspectPeriod = "inspect_period"
    }
}

struct GraderData: Codable {
    var graderId: String?
    var fname: String?
    var lname: String?
    
    enum CodingKeys: String, CodingKey {
        case graderId = "grader_id"
        case fname, lname
    }
}


struct AllocatedPens: Codable {
    var groupCode: String?
    var spNamexx: String?
    var spNameyy: String?
    var entrydate: String?
    var groupcodedisp: String?
    var penid: String?
    var pennodisp: String?
    var dateadded: String?
    var skinSize: String?
    var recheckcount: String?
    var colorcode: String?
    var ispink: String?
    var comment: String?
    var trackCode: String?
    var commentText: String?
    var spAge: String?
    
    enum CodingKeys: String, CodingKey {
        case groupCode = "group_code"
        case spNamexx = "sp_namexx"
        case spNameyy = "sp_nameyy"
        case entrydate, groupcodedisp, penid, pennodisp, dateadded, spAge, recheckcount, colorcode, ispink, comment
        case trackCode = "track_code"
        case skinSize = "skin_size"
        case commentText = "comment_text"
    }
}


// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
