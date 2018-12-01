//
//  DatePickerRouter.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

class DatePickerRouter: BaseAppRouter {
    func presentThirdScreen() {
        presentModule(withPresentationType: .modal(true)) { (seed) -> UIViewController in
            return UIViewController()
        }
    }
}
