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
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var maleButton: UIButton!
    private func setupBarButton() {
        let barButton = UIBarButtonItem(title: "1/3", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = barButton
        barButton.setTitleTextAttributes([.foregroundColor: UIColor.Custom.accent, .font : UIFont.systemFont(ofSize: 18, weight: .bold)], for: .normal)
    }
    @IBAction func maleButtonTouched(_ sender: UIButton) {
        maleButton.isSelected = true
        femaleButton.isSelected = false
    }
    
    @IBAction func femaleButtonTouched(_ sender: UIButton) {
        maleButton.isSelected = false
        femaleButton.isSelected = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        maleButtonTouched(maleButton)
        setupBarButton()
        
        
        
        
        
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
                df.dateFormat = "dd/MM/yyyy"
                return df.string(from: date)
            })
            .bind(to: birthdateButton.rx.title(for: .selected))
            .disposed(by: disposeBag)
    }
    
}
