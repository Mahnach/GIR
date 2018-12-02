//
//  SecondAuthScreenViewController.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SecondAuthScreenViewController: BaseViewController {
    var vm: SecondAuthScreenViewModel?

    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButton()
        vm?.populate(nextTouched: nextButton.rx.tap.asDriver())
    }
    
    private func setupBarButton() {
        let barButton = UIBarButtonItem(title: "2/3", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = barButton
        barButton.setTitleTextAttributes([.foregroundColor: UIColor.Custom.accent, .font : UIFont.systemFont(ofSize: 18, weight: .bold)], for: .normal)
    }
    
}
