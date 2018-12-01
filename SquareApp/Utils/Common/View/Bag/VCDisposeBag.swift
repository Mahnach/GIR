//
//  VCDisposeBag.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation

protocol VCDisposeBagHolder {
    var vcDisposeBag: VCDisposeBag { get }
}

protocol VCDisposeBag {
    func add(disposable anyObject: AnyObject)
}

// Default `DisposeBag` implementation
extension VCDisposeBag where Self: VCDisposeBagHolder {
    func add(disposable anyObject: AnyObject) {
        vcDisposeBag.add(disposable: anyObject)
    }
}

// Non thread safe `DisposeBag` implementation
final class VCDisposeBagImpl: VCDisposeBag {
    fileprivate var disposables: [AnyObject] = []
    
    func add(disposable anyObject: AnyObject) {
        disposables.append(anyObject)
    }
}
