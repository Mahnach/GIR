//
//  SecondAuthScreenViewModel.swift
//  SquareApp
//
//  Created by computer_new on 12/2/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class SecondAuthScreenViewModel {
    private let router: SecondAuthScreenRouter
    private let disposeBag = DisposeBag()
    init(router: SecondAuthScreenRouter) {
        self.router = router
    }
    func populate(nextTouched: Driver<Void>) {
        nextTouched
            .drive(onNext: { [weak self] _ in
                self?.router.presentThirdScreen()
            })
            .disposed(by: disposeBag)
    }
}
