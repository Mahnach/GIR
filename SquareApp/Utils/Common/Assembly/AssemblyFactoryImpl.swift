//
//  AssemblyFactoryImpl.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation

final class AssemblyFactoryImpl: AssemblyFactory {
    
    // MARK: - Init
    private let serviceFactory: ServiceFactory
    
    init(
        serviceFactory: ServiceFactory)
    {
        self.serviceFactory = serviceFactory
    }
    
    // MARK: - AssemblyFactory
    func applicationAssembly() -> ApplicationAssembly {
        return ApplicationAssemblyImpl(assemblySeed: assemblySeed)
    }
    
    func authorizationAssembly() -> AuthorizationAssembly {
        return AuthorizationAssemblyImpl(assemblySeed: assemblySeed)
    }

    func mapAssembly() -> MapAssembly {
        return MapAssemblyImpl(assemblySeed: assemblySeed)
    }
    
    // MARK: - Private
    private var assemblySeed: BaseAssemblySeed {
        return BaseAssemblySeed(
            assemblyFactory: self,
            serviceFactory: serviceFactory
        )
    }
}
