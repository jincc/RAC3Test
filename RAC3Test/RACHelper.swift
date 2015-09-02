//
//  RACHelper.swift
//  RAC3Test
//
//  Created by 江钧龙 on 15/9/2.
//  Copyright (c) 2015年 江钧龙. All rights reserved.
//

import Foundation
import ReactiveCocoa

public func ignoreError<T, E>(signalProducer: SignalProducer<T, E>) -> SignalProducer<T, NoError> {
    return signalProducer
        |> catch { _ in
            SignalProducer<T, NoError>.empty
    }
}

public func merge<T, E>(signals: [SignalProducer<T, E>]) -> SignalProducer<T, E> {
    return SignalProducer<SignalProducer<T, E>, E>(values: signals)
        |> flatten(.Merge)
}