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
            presentationType: .push(true))
        
        let vc = assemblyFactory.authorizationAssembly().firstScreenModule(routerSeed: seed)
        let navigationCotroller = UINavigationController(rootViewController: vc)
        navigationCotroller.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationCotroller.navigationBar.shadowImage = UIImage()
        navigationCotroller.navigationBar.tintColor = UIColor.Custom.accent
        return navigationCotroller
        
    }
}
