//
//  ConnectNetworksViewController.swift
//  SquareApp
//
//  Created by computer_new on 11/28/18.
//  Copyright © 2018 Square. All rights reserved.
//

import UIKit

class ConnectNetworksViewController: BaseViewController {

    var vm: ConnectNetworksViewModel?
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var createYourProfileLabel: UILabel!
    @IBOutlet weak var connectDescriptionLabel: UILabel!
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var tripadvisorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButton()
        vm?.populate(nextTouched: nextButton.rx.tap.asDriver())
    }
    
    private func setupBarButton() {
        let barButton = UIBarButtonItem(title: "3/3", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = barButton
        barButton.setTitleTextAttributes([.foregroundColor: UIColor.Custom.accent, .font : UIFont.systemFont(ofSize: 18, weight: .bold)], for: .normal)
    }
}
