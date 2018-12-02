//
//  ConnectNetworksRouter.swift
//  SquareApp
//
//  Created by computer_new on 12/2/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

class ConnectNetworksRouter: BaseAppRouter {
    func presentFinishAuthScreen() {
        presentModule(withPresentationType: .push(true)) { (seed) -> UIViewController in
            return assemblyFactory
                .authorizationAssembly()
                .finishAuthModule(routerSeed: seed)
        }
    }
}
