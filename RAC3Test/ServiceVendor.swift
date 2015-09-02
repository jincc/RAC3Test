//
//  ServiceVendor.swift
//  RAC3Test
//
//  Created by 江钧龙 on 15/9/2.
//  Copyright (c) 2015年 江钧龙. All rights reserved.
//

import Foundation
import ReactiveCocoa
import AlamofireObjectMapper
import Alamofire

enum NetError :Int,ErrorType{
    //错误类型
    case TimeOut
    

    var nsError: NSError{
        return toError()
    }
    private func toError() -> NSError{
        switch self {
        case .TimeOut :  return NSError(domain: "Timeout", code: self.rawValue, userInfo: nil)
        }
    }
}

func fetchList() -> SignalProducer<[List]?,NSError>{
    
    return SignalProducer{
        sink , dispose in
        let url = API.List.description
        Alamofire.request(.GET, url).responseArray({ (list:[List]?, error:NSError?) -> Void in
            if let error = error {
                sendError(sink, error)
            }else{
                sendNext(sink, list)
            }
        })
    }
}