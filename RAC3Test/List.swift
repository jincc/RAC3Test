//
//  List.swift
//  RAC3Test
//
//  Created by 江钧龙 on 15/9/2.
//  Copyright (c) 2015年 江钧龙. All rights reserved.
//

import Foundation
import ObjectMapper

struct List  : Mappable{
    
    var name : String?
    var count : Int?
    static func newInstance() -> Mappable {
        return List()
    }
    mutating func mapping(map: Map) {
      name <- map["tag_name"]
      count <- map["pin_count"]
    }
}