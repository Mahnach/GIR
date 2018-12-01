//
//  AuthorizationAssemblyImpl.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

final class AuthorizationAssemblyImpl: BaseAssembly, AuthorizationAssembly {
    
    // MARK: - AuthorizationAssembly
    
    func birtdayDatePickerModule(routerSeed: RouterSeed, datePicked: @escaping ((_ date: Date) -> Void), initialDate: Date?) -> DatePickerViewController {
        let vc: DatePickerViewController! = StoryboardFactory.Utils.datePicker.instantiateViewController()
        vc.datePicked = datePicked
        vc.initialDate = initialDate
        let router = DatePickerRouter(assemblyFactory: assemblyFactory, routerSeed: routerSeed, presentedViewController: vc)
        vc.router = router
        return vc
    }
    
    func firstScreenModule(routerSeed: RouterSeed)
        -> UIViewController
    {
        
        let viewController: FirstAuthScreenViewController! = StoryboardFactory.Auth.firstScreen.instantiateViewController()
        let router = AuthorizationFirstScreenRouter(assemblyFactory: assemblyFactory, routerSeed: routerSeed, presentedViewController: viewController)
        let vm = FirstAuthScreenViewModel(router: router)
        viewController.vm = vm
        viewController.add(disposable: vm)

        return viewController
    }
    
    func secondScreenModule(routerSeed: RouterSeed) -> UIViewController {
        let viewController: SecondAuthScreenViewController! = StoryboardFactory.Auth.secondScreen.instantiateViewController()
        //let router = SecondAuthScreenRouter(assemblyFactory: assemblyFactory, routerSeed: routerSeed)
        //let vm = FirstAuthScreenViewModel(router: router)
        //viewController.add(disposable: vm)
        
        return viewController
    }
    
}
