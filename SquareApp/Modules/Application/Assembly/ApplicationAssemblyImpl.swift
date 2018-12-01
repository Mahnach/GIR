//
//  ApplicationAssemblyImpl.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

final class ApplicationAssemblyImpl: BaseAssembly, ApplicationAssembly {
    // MARK: - ApplicationAssembly
    func module()
        -> UIViewController
    {
        
        let seed = RouterSeed(
            transitionId: "0",
            transitionIdGenerator: serviceFactory.getTransitionIdGenerator(),
            presentingRouter: nil,
            presentationType: .modal(true))
        
        return assemblyFactory.authorizationAssembly().firstScreenModule(routerSeed: seed)
        
    }
}
