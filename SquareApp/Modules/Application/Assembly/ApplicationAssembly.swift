//
//  ApplicationAssembly.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

struct ApplicationModule {
    var viewController: UIViewController
}

protocol ApplicationAssembly: class {
    func module()
        -> UIViewController
}
