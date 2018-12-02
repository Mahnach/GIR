//
//  FinishAuthRouter.swift
//  SquareApp
//
//  Created by computer_new on 12/2/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

class FinishAuthRouter: BaseAppRouter {
    func presentMapScreen() {
        presentModule(withPresentationType: .modal(true)) { (seed) -> UIViewController in
            return assemblyFactory
                .mapAssembly()
                .mapModule(routerSeed: seed)
        }
    }
}
