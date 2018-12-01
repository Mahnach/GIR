//
//  RouterSeed.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

struct RouterSeed {
    let transitionId: TransitionId
    let transitionIdGenerator: TransitionIdGenerator
    let presentingRouter: BaseAppRouter? 
    let presentationType: PresentationType
}
