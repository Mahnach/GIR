//
//  FirstAuthScreenViewController.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class FirstAuthScreenViewController: BaseViewController {

    @IBOutlet weak var birthdateButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var vm: FirstAuthScreenViewModel?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm?.populate(nextTouched: nextButton.rx.tap.asDriver(), birthdateTouched: birthdateButton.rx.tap.asDriver())
        
        let filteredDate = vm?.datePicked
            .filter { $0 != nil }
            .map { $0! }
        
        filteredDate?
            .map { _ in true }
            .bind(to: birthdateButton.rx.isSelected)
            .disposed(by: disposeBag)
        
        filteredDate?
            .map({ (date) -> String in
                let df = DateFormatter()
                df.dateFormat = "dd.MM.yyyy"
                return df.string(from: date)
            })
            .bind(to: birthdateButton.rx.title(for: .selected))
            .disposed(by: disposeBag)
    }
    
}
