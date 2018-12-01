//
//  AuthorizationFirstScreenRouter.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationFirstScreenRouter: BaseAppRouter {
    
    func presentBirthdayPicker(datePicked: @escaping ((_ date: Date) -> Void), initialDate: Date?) {
        presentModule(withPresentationType: .modal(true)) { (seed) -> UIViewController in
            return assemblyFactory
                .authorizationAssembly()
                .birtdayDatePickerModule(routerSeed: seed, datePicked: datePicked, initialDate: initialDate)
        }
    }
    
    func presentSecondScreen() {
        presentModule(withPresentationType: .modal(true)) { (seed) -> UIViewController in
            return assemblyFactory
                .authorizationAssembly()
                .secondScreenModule(routerSeed: seed)
        }
    }
}
