//
//  BaseAssembly.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
class BaseAssembly {
    let assemblyFactory: AssemblyFactory
    let serviceFactory: ServiceFactory

    init(assemblySeed: BaseAssemblySeed)
    {
        self.assemblyFactory = assemblySeed.assemblyFactory
        self.serviceFactory = assemblySeed.serviceFactory
    }
}
