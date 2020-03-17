//
//  GenderViewController.swift
//  HelpMe
//
//  Created by mohamed hashem on 3/14/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var continueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .some(#colorLiteral(red: 0, green: 0.6298658848, blue: 0.9208675027, alpha: 1))

        datePicker.maximumDate = Date()
        datePicker.setValue(#colorLiteral(red: 0, green: 0.6298658848, blue: 0.9208675027, alpha: 1), forKeyPath: "textColor")
        datePicker.setDate(Date(), animated: false)

        nameLabel.text = "Continue with \(displayName())" 
    }

    @IBAction func pressContinue(_ sender: UIButton) {
        UserDefaults.standard.set(datePicker.date, forKey: "UserAge")
        UserDefaults.standard.synchronize()
    }

    func displayName() -> String {
        let userName = UserDefaults.standard.string(forKey: "UserName")
        return userName ?? ""
    }
}
