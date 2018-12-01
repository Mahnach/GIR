//
//  ServiceFactory.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
// non-singletons
protocol ServiceFactory: class {

    func getTransitionIdGenerator() -> TransitionIdGenerator
//    func authorizationModuleTrackingService() -> AuthorizationModuleTrackingService
}
