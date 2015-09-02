//
//  ListViewModel.swift
//  RAC3Test
//
//  Created by 江钧龙 on 15/9/2.
//  Copyright (c) 2015年 江钧龙. All rights reserved.
//

import UIKit
import ReactiveCocoa
import Spring
class ListViewModel: BaseViewModel {
   
    
    let lists =  MutableProperty<[ListCellViewModel]>([])
    let isLoadding = MutableProperty<Bool>(false)
    
    lazy var listProducer :SignalProducer<[List]?, NSError>? = {
        let list = self.activeSignalProducer
            |> filter{$0}
            |> promoteErrors(NSError)
            |> flatMap(.Latest) {
                _ in
                fetchList()
            }
            |> observeOn(UIScheduler())
            |> on(started:{
                self.isLoadding.put(true)
            })
        return list
    }()
    override init(){
        super.init()
        
        self.listProducer!.start(error: {
            _ in
            self.isLoadding.put(false)
         }, next: { list in
            self.lists.put(list!.map{ListCellViewModel(item: $0)})
            self.isLoadding.put(false)
        })
        
    }
    func refresh(){
//        listProducer! |> start(error: {
//            _ in
//            self.isLoadding.put(false)
//            }, next: { list in
//                self.lists.put(list!.map{ListCellViewModel(item: $0)})
//                self.isLoadding.put(false)
//        })
        
        self.isLoadding.put(false)
        delay(1, {
             self.isLoadding.put(false)
        })
    }
}
