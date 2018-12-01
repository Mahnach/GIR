//
//  ServiceFactoryImpl.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation

final class ServiceFactoryImpl: ServiceFactory {
    func getTransitionIdGenerator() -> TransitionIdGenerator {
        return TransitionIdGeneratorImpl()
    }
    

}
