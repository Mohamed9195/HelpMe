//
//  UIViewControllers+Extensions.swift
//  Butterfly
//
//  Created by mohamed hashem on 2/19/20.
//  Copyright © 2020 Xtrava Inc. All rights reserved.
//

import UIKit
import SwiftMessages

extension UIViewController {

    func prepareNetworkConfiguration(internetConnection: InternetConfiguration = InternetConnection(),
                                     completionHandler: @escaping (InternetStatus) -> Void) {
        configureNetwork(internetConnection).startNotifier()
        guard let internetStatus = configureNetwork(internetConnection).internetStatus else {
            completionHandler(.disconnected)
            return
        }
        completionHandler(internetStatus)
    }

    func finishingNetworkConfiguration(internetConnection: InternetConfiguration = InternetConnection()) {
        configureNetwork(internetConnection).stopNotifier()
    }

    @discardableResult
    private func configureNetwork(_ internetConnection: InternetConfiguration) -> InternetConfiguration {
        return internetConnection
    }

    func showErrorToastWith(message: String) {
        let messageView = MessageView.viewFromNib(layout: .cardView)

        messageView.button?.isHidden = true
        messageView.titleLabel?.isHidden = true
        messageView.configureContent(body: message)
        messageView.configureTheme(.error)

        var config = SwiftMessages.defaultConfig
        //FIXME: remove hideAll()
        config.presentationStyle = .top
        config.duration = .seconds(seconds: 5)
        config.ignoreDuplicates = true

        SwiftMessages.show(config: config, view: messageView)
    }
}
