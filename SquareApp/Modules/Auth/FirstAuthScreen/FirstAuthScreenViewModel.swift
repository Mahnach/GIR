//
//  FirstAuthScreenViewModel.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class FirstAuthScreenViewModel {
    let router: AuthorizationFirstScreenRouter
    private let disposeBag = DisposeBag()
    private let datePickedSubject = BehaviorRelay<Date?>(value: nil)
    var datePicked: Observable<Date?> {
        return datePickedSubject.asObservable()
    }
    init(router: AuthorizationFirstScreenRouter) {
        self.router = router
    }
    
    func populate(nextTouched: Driver<Void>, birthdateTouched: Driver<Void>) {
        nextTouched
            .drive(onNext: { [weak self] _ in
                self?.router.presentSecondScreen()
            })
            .disposed(by: disposeBag)
        
        birthdateTouched
            .drive(onNext: { [weak self] _ in
                self?.router.presentBirthdayPicker(datePicked: { date in
                    self?.datePickedSubject.accept(date)
                }, initialDate: self?.datePickedSubject.value)
            })
            .disposed(by: disposeBag)
    }
    
}
