//
//  SecondAuthScreenRouter.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//


import Foundation
import UIKit

class SecondAuthScreenRouter: BaseAppRouter {
    func presentThirdScreen() {
        presentModule(withPresentationType: .push(true)) { (seed) -> UIViewController in
            return UIViewController()
        }
    }
}
