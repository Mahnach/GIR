//
//  MapAssemblyImpl.swift
//  SquareApp
//
//  Created by computer_new on 12/2/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit

class MapAssemblyImpl: BaseAssembly, MapAssembly {
    func mapModule(routerSeed: RouterSeed) -> UIViewController {
        let vc: MainMapViewController! = StoryboardFactory.Map.map.instantiateViewController()
        
        let tabBarController = UITabBarController()
        let navController = UINavigationController(rootViewController: vc)
        tabBarController.setViewControllers([navController], animated: true)
        tabBarController.tabBar.tintColor = UIColor.Custom.tabbar
        return tabBarController
    }
    
    
}

