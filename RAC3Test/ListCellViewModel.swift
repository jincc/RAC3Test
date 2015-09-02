//
//  ListCellViewModel.swift
//  RAC3Test
//
//  Created by 江钧龙 on 15/9/2.
//  Copyright (c) 2015年 江钧龙. All rights reserved.
//

import Foundation
import ReactiveCocoa

class ListCellViewModel {
    let item: List
    let listName : MutableProperty<String>   = MutableProperty("")
    let photoCount : MutableProperty<String> = MutableProperty("")
    init (item : List){
        self.item = item
        listName.put(item.name ?? "")
        if let count = item.count {
            photoCount.put("共\(count)张")
        }
    }
}