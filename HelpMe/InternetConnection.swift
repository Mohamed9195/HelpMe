//
//  UIView+Animation.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/13/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import ReachabilitySwift
import SwiftMessages

protocol InternetConfiguration {
    var internetStatus: InternetStatus? { get }
    func startNotifier()
    func stopNotifier()
}

enum InternetStatus {
    case connected
    case disconnected
}

final class InternetConnection: InternetConfiguration {

    private let reachability = Reachability()!

    var internetStatus: InternetStatus?

    func startNotifier() {
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        startListening()
    }

    func stopNotifier() {
        reachability.stopNotifier()
    }

    private func startListening() {
        let configurationView = configView().0
        let messageView = configView().1

        reachability.whenReachable = { _ in
            SwiftMessages.hide()
            self.internetStatus = .connected
        }

        reachability.whenUnreachable = { _ in
            self.internetStatus = .disconnected
            DispatchQueue.main.async {
                SwiftMessages.show(config: configurationView, view: messageView)
            }
        }
    }

    private func configView() -> (SwiftMessages.Config, UIView) {
        var config = SwiftMessages.defaultConfig

        // Disable the default auto-hiding behavior.
        config.duration = .forever

        // Disable the interactive pan-to-hide gesture.
        config.interactiveHide = false
        config.ignoreDuplicates = true
        config.presentationStyle = .bottom

        guard let view: NoInternetConnectionMessageView = try? SwiftMessages.viewFromNib() else {
            fatalError("Swift Messages view not found")
        }

        return (config, view)
    }

    deinit {
        stopNotifier()
    }
}
