//
//  Constants.swift
//  RAC3Test
//
//  Created by 江钧龙 on 15/9/2.
//  Copyright (c) 2015年 江钧龙. All rights reserved.
//

import Foundation

enum API : Printable{
    case List
    var description: String {
        switch self {
        case .List : return "http://api.huaban.com/fm/wallpaper/tags"
        }
    }
}