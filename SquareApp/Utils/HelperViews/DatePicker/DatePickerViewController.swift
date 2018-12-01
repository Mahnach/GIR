//
//  DatePickerViewController.swift
//  SquareApp
//
//  Created by computer_new on 12/1/18.
//  Copyright © 2018 Square. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DatePickerViewController: BaseViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    var datePicked: ((_ date: Date) -> Void)?
    var router: DatePickerRouter?
    var initialDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMinMax()
        setRecognizer()
    }
    
    private func setRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(closeTapped))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc
    func closeTapped() {
        datePicked?(datePicker.date)
        router?.dismiss()
    }
    
    private func setMinMax() {
        var dateComponents = DateComponents()
        dateComponents.year = 1920
        dateComponents.month = 1
        dateComponents.day = 1
        //dateComponents.timeZone = TimeZone(abbreviation: "JST") // Japan Standard Time
        dateComponents.hour = 0
        dateComponents.minute = 0
        let userCalendar = Calendar.current
        let dateFrom = userCalendar.date(from: dateComponents)
        let dateTo = Date()
        
        datePicker.minimumDate = dateFrom
        datePicker.maximumDate = dateTo
        datePicker.date = getInitialDate(currentDate: dateTo)
    }
    
    func getInitialDate(currentDate: Date) -> Date {
        if let initialDate = initialDate {
            return initialDate
        } else {
            return currentDate
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
