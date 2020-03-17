//
//  LoginConfiguration.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/20/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit

extension LogInViewController: LogInPresenterOutput {
}

extension LogInInteractor: LogInViewControllerOutput {
}

extension LogInPresenter: LogInInteractorOutput {
}

class LoginConfiguration {
    // MARK: - Object lifecycle

    static let sharedInstance = LoginConfiguration()

    private init() {}

    // MARK: - Configuration

    func configure(viewController: LogInViewController) {
        let router = LogInRouter()
        router.viewController = viewController

        let presenter = LogInPresenter()
        presenter.output = viewController

        let interactor = LogInInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
