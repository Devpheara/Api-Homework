//
//  Articles.swift
//  Article Managements
//
//  Created by Eang Pheara on 12/14/16.
//  Copyright © 2016 Eang Pheara. All rights reserved.
//

import Foundation
import ObjectMapper
class Articles: Mappable{
    var title: String?
    var description: String?
    var create_date: String?
    var image: String?
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        title <- map["TITLE"]
        description <- map["DESCRIPTION"]
        create_date <- map["CREATE_DATE"]
        image <- map["IMAGE"]
    }

}
