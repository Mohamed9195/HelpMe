//
//  MainModel.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/20/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import RxSwift

class MainModel: Codable {

    struct User: Codable {
        let userName: String?
        let userID: String?
        let email: String?
        let phone: String?
        let gender: Gender?
        let birthdate: Date?
        let PersonalID: String?
        let currentLocation: CurrentLocation?

        enum Gender: String, Codable {
            case male, female

            var localizedTitle: String { NSLocalizedString(rawValue, comment: "") }
        }

        struct CurrentLocation:  Codable {
            var latitude: Double?
            var longitude: Double?
        }

        static var current: BehaviorSubject<User?> = BehaviorSubject(value: nil)
    }
}
