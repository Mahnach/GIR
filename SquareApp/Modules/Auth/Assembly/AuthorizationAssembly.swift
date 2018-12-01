//
//  AuthorizationAssembly.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

protocol AuthorizationAssembly: class {
    
    func birtdayDatePickerModule(routerSeed: RouterSeed, datePicked: @escaping ((_ date: Date) -> Void), initialDate: Date?) -> DatePickerViewController
    func firstScreenModule(routerSeed: RouterSeed)
        -> UIViewController
    func secondScreenModule(routerSeed: RouterSeed)
        -> UIViewController
}
