//
//  Commumity.swift
//  Weather
//
//  Created by Olga Lidman on 06/05/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Community : Object, Mappable {

    @objc dynamic var communityID = 0
    @objc dynamic var communityName = ""
    @objc dynamic var pictureURL = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        communityID <- map["id"]
        communityName <- map["name"]
        pictureURL <- map["photo_50"]
    }

    static func == (lhs:Community, rhs:Community) -> Bool {
        return lhs.communityID == rhs.communityID
    }
    
    override static func primaryKey() -> String? {
        return "communityID"
    }
}

class CommunityResponse : Mappable {

    var response = [Community]()

    required init?(map: Map) {}

    func mapping(map: Map) {
        response <- map["response.items"]
    }
}
