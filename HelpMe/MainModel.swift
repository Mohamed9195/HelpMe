//
//  MainModel.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/20/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import RxSwift
import Firebase

class MainModel: Codable {

    struct User: Codable {
        let userName: String?
        let userID: String?
        var email: String?
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

func updateUser(completion: @escaping () -> Void) {
    let userID = String(UserDefaults.standard.integer(forKey: "userID"))
    UserDefaults.standard.synchronize()
    let newUser = Database.database().reference().child("users/data/UserNumber 4160/-M2drnynRFkZvyEJ4v3i")
    newUser.observe(.value) { snapShout in
        if let data = snapShout.value {
            let newUser = data as? Dictionary<String, String>
            let newCurrentUser = MainModel.User(userName: newUser?["name"],
                                                userID: userID,
                                                email: newUser?["email"],
                                                phone: newUser?["phone"],
                                                gender: nil, birthdate: nil,
                                                PersonalID: newUser?["password"],
                                                currentLocation: nil)
            MainModel.User.current.onNext(newCurrentUser)
            completion()
        }
    }
}
