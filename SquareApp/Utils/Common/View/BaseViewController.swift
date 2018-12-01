//
//  BaseViewController.swift
//  SquareApp
//
//  Created by computer_new on 11/30/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

enum ViewControllerState {
    case viewDidLoad
    case viewWillAppear(Bool)
    case viewDidAppear(Bool)
    case viewWillDisappear(Bool)
    case viewDidDisappear(Bool)
}

class BaseViewController: UIViewController, ViewLifecycleObservable, VCDisposeBag, VCDisposeBagHolder
{
    
    // MARK: - ViewLifecycleObservable
    private let viewControllerStateSubject = PublishSubject<ViewControllerState>()
    var viewLifecycle: Driver<ViewControllerState> {
        return viewControllerStateSubject.asDriver(onErrorJustReturn: .viewDidLoad)
    }

    // MARK: - DisposeBagHolder
    var vcDisposeBag: VCDisposeBag = VCDisposeBagImpl()
    
    // MARK: - Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        
        //automaticallyAdjustsScrollViewInsets = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    @available(*, unavailable, message: "use init")
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    deinit {
        //debugPrint("\(#function), \(self)")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerStateSubject.onNext(.viewDidLoad)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewControllerStateSubject.onNext(.viewWillAppear(animated))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewControllerStateSubject.onNext(.viewDidAppear(animated))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewControllerStateSubject.onNext(.viewWillDisappear(animated))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewControllerStateSubject.onNext(.viewDidDisappear(animated))
    }
}
