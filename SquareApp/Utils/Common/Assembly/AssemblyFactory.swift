//
//  AssemblyFactory.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation

protocol AssemblyFactory: class {
    func applicationAssembly() -> ApplicationAssembly
    func authorizationAssembly() -> AuthorizationAssembly
}
