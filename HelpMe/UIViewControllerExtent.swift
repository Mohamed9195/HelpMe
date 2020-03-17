//
//  Messages.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/20/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import SwiftMessages

extension UIViewController {
    
    @discardableResult
    func configureNetwork(internetConnection: InternetConnection = InternetConnection.shared) -> InternetConnection {
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
        //SwiftMessages.hideAll()
        config.presentationStyle = .top
        config.duration = .seconds(seconds: 5)
        config.ignoreDuplicates = true

        SwiftMessages.show(config: config, view: messageView)
    }
}
