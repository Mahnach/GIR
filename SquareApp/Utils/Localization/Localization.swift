//
//  Localization.swift
//  iOSApp Development
//
//  Created by Evgeny Mahnach on 11/9/18.
//  Copyright © 2018 Fell Technology. All rights reserved.
//

import Foundation
import UIKit

class Localization {
    
    static var localeIdentifier: String? = nil
    
    static var locale: Locale {
        guard let languageID = localeIdentifier else {
            return .current
        }
        return Locale(identifier: languageID)
    }
    
    static func NSLocalizedString(_ key: String, comment: String) -> String {
        var languageBundle: Bundle?
        if let languageID = localeIdentifier, let path = Bundle.main.path(forResource: languageID, ofType: "lproj") {
            languageBundle = Bundle(path: path)!
        }
        
        return Foundation.NSLocalizedString(key, tableName: nil, bundle: languageBundle ?? .main , value: "", comment: comment)
    }
    
}
