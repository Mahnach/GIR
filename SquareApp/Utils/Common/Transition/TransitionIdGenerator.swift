//
//  TransitionIdGenerator.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
protocol TransitionIdGenerator {
    func generateNewTransitionId()
        -> TransitionId
}

final class TransitionIdGeneratorImpl {
    init() {}
}

extension TransitionIdGeneratorImpl: TransitionIdGenerator {
    func generateNewTransitionId()
        -> TransitionId
    {
        let result = UUID().uuidString
        return result
    }
}
