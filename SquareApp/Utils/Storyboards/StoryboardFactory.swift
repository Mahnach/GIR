//
//  StoryboardFactory.swift
//  iOSApp Development
//
//  Created by Evgeny Mahnach on 11/7/18.
//  Copyright © 2018 Fell Technology. All rights reserved.
//

import Foundation
import UIKit

final class StoryboardFactory {
    private init() {}
    
    enum Main: String, StoryboardInitable {
        case onboarding = "OnBoardingVC"
        case tabBar = "BaseTabBarController"
    }
    
    enum Utils: String, StoryboardInitable {
        case datePicker = "DatePickerViewController"
    }
    
    enum Auth: String, StoryboardInitable {
        case firstScreen = "FirstAuthScreenViewController"
        case secondScreen = "SecondAuthScreenViewController"
        case connectNetworksViewController = "ConnectNetworksViewController"
        case finish = "FinishAuthViewController"
    }
   
    enum Map: String, StoryboardInitable {
        case map = "MainMapViewController"
    }
  
    
}

protocol StoryboardInitable {
    var storyboardName: String { get }
    var viewControllerName: String { get }
}

extension StoryboardInitable where Self: RawRepresentable {
    var viewControllerName: Self.RawValue {
        return self.rawValue
    }
}

extension StoryboardInitable {
    var storyboardName: String {
        return String(describing: Self.self)
    }
    
    func instantiateViewController<T>() -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: viewControllerName) as? T
    }
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
    
}



protocol StoryboardInstantiable: NSObjectProtocol {
    associatedtype MyType
    static var defaultFileName: String { get }
    static func instantiateViewController(_ bundle: Bundle?) -> MyType 
}

extension StoryboardInstantiable where Self: UIViewController {
    static var defaultFileName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }

    static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        let fileName = defaultFileName
        let sb = UIStoryboard(name: fileName, bundle: bundle)
        return sb.instantiateInitialViewController() as! Self
    }
}
