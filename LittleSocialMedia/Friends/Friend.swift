//
//  Friend.swift
//  Weather
//
//  Created by Olga Lidman on 16/04/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper
import RealmSwift

class Friend: Object, Comparable, Mappable {
    
    @objc dynamic var friendID = 0
    @objc dynamic var friendFirstName = ""
    @objc dynamic var friendLastName = ""
    @objc dynamic var friendPicURL = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        friendID <- map["id"]
        friendFirstName <- map["first_name"]
        friendLastName <- map["last_name"]
        friendPicURL <- map["photo_50"]
    }
    
    static func < (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.friendFirstName < rhs.friendFirstName
    }
    
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.friendID == rhs.friendID
    }
    
    override static func primaryKey() -> String? {
        return "friendID"
    }
}

class FriendResponse: Mappable {
    
    var response = [Friend]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        response <- map["response.items"]
    }
}
