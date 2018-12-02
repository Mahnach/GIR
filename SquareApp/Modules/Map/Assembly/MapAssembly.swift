//
//  MapAssembly.swift
//  SquareApp
//
//  Created by computer_new on 12/2/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

protocol MapAssembly: class {
    
    func mapModule(routerSeed: RouterSeed) -> UIViewController
    
}
