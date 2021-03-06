//
//  Photo.swift
//  Weather
//
//  Created by Olga Lidman on 06/05/2019.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper
import RealmSwift

class PhotoResponse : Mappable {
    
    var response = [Photo]()
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        response <- map["response.items"]
    }
}

class Photo : Object, Mappable {
    
    @objc dynamic var photoURL = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        photoURL <- map["sizes.3.url"]
    }
}
