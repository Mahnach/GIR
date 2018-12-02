//
//  FinishAuthViewController.swift
//  SquareApp
//
//  Created by computer_new on 12/2/18.
//  Copyright © 2018 Square. All rights reserved.
//

import UIKit

class FinishAuthViewController: BaseViewController {
    @IBOutlet weak var thankYouLabel: UILabel!
    var router: FinishAuthRouter?
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextTouched(_ sender: UIButton) {
        router?.presentMapScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true);
        thankYouLabel.text = Localization.NSLocalizedString("Thank you for your interest in joining our community.\n\nYour application has been received.\n\nWe are continually reviewing applications and will notify you as soon as we can.", comment: "")
    }
    
    
    

}
