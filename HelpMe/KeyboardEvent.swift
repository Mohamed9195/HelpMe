//
//  KeyboardEvent.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/20/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import RxSwift

class KeyboardEventListener {

    private let disposeBag = DisposeBag()

    func updateHeightBasedOnKeyboardEvent(for viewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = true
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
            .subscribe(onNext: { (notification) in
                if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    viewController.view.frame.size.height = keyboardSize.origin.y
                }
            }).disposed(by: disposeBag)
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
            .subscribe(onNext: { (notification) in
                if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    viewController.view.frame.size.height = keyboardSize.origin.y
                }
            }).disposed(by: disposeBag)
    }
}
