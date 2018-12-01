//
//  BaseAppRouter.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

enum PresentationType {
    case unknown
    
    case push(Bool)
    case modal(Bool)
    case contained
}

class BaseRouter {
    let transitionId: TransitionId
    init(routerSeed: RouterSeed) {
        self.transitionId = routerSeed.transitionId
    }
}

class BaseAppRouter: BaseRouter {
    let assemblyFactory: AssemblyFactory
    weak var presentedViewController: UIViewController?
    let presentationType: PresentationType
    private let transitionIdGenerator: TransitionIdGenerator
    let presentingRouter: BaseAppRouter?
    
    init(assemblyFactory: AssemblyFactory, routerSeed: RouterSeed, presentedViewController: UIViewController, transitionIdGenerator: TransitionIdGenerator = TransitionIdGeneratorImpl()) {
        self.presentedViewController = presentedViewController
        self.assemblyFactory = assemblyFactory
        self.presentingRouter = routerSeed.presentingRouter
        self.presentationType = routerSeed.presentationType
        self.transitionIdGenerator = transitionIdGenerator
        super.init(routerSeed: routerSeed)
    }
    
    func presentModule(withPresentationType type: PresentationType, presentedViewController: (_ routerSeed: RouterSeed) -> UIViewController) {
        let newTransitionId = transitionIdGenerator.generateNewTransitionId()
        let seed = RouterSeed(
            transitionId: newTransitionId,
            transitionIdGenerator: transitionIdGenerator,
            presentingRouter: self,
            presentationType: type
        )
        let presentedVC = presentedViewController(seed)
        
        presentVC(withPresentationType: type, vc: presentedVC)
    }
    
    func dismiss(untilTransitionId transitionId: TransitionId) {
        guard transitionId != self.transitionId else {
            return
        }
        dismissSelf()
        presentingRouter?.dismiss(untilTransitionId: transitionId)
    }
    
    func dismiss() {
        dismissSelf()
    }
    
    private func dismissSelf(completion: (() -> Void)? = nil) {
        switch presentationType {
        case .push(let animated):
            presentedViewController?.navigationController?.popViewController(animated: animated)
        case .contained:
            break
        case .modal(let animated):
            presentingRouter?.presentedViewController?.dismiss(animated: animated, completion: completion)
        case .unknown:
            break
        }
    }
    
    private func presentVC(withPresentationType type: PresentationType, vc: UIViewController, completion: (() -> Void)? = nil) {
        switch type {
        case .push(let animated):
            presentedViewController?.navigationController?.pushViewController(vc, animated: animated)
        case .contained:
            break
        case .modal(let animated):
            presentedViewController?.present(vc, animated: animated, completion: completion)
        case .unknown:
            break
        }
    }
}
