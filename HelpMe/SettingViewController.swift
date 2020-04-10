//
//  SettingViewController.swift
//  HelpMe
//
//  Created by mohamed hashem on 3/17/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import Firebase

enum Setting: Int {
    case email, messages, editPersonalData, posts, signOut
}

class SettingViewController: UIViewController {

    var currentUser = try? MainModel.User.current.value()
    var image: UIImage?
    let tempImage = UIImage(named: "boy")

    @IBOutlet private weak var settingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUser {
            self.currentUser = try? MainModel.User.current.value()
            self.settingTableView.reloadData()
        }
        let imageData = UserDefaults.standard.object(forKey: "userImage") as? Data
        if let imageData = imageData {
            image = UIImage(data: imageData)
        }
        settingTableView.estimatedRowHeight = UITableView.automaticDimension
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let emailCell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath) as? EmailTableViewCell else {
                fatalError()
            }
            emailCell.set(image: image ?? tempImage!, username: currentUser?.userName ?? "")
            return emailCell
        } else {
            guard let settingCell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else {
                fatalError()
            }
            settingCell.set(index: Setting(rawValue: indexPath.row)!)
            settingCell.accessoryType = indexPath.row == 4 ? .none : .disclosureIndicator
            return settingCell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentCell = Setting(rawValue: indexPath.row)
        switch currentCell {
        case .none: break
        case .some(.editPersonalData): break
        case .some(.email): break
        case .some(.messages): break
        case .some(.posts): break
        case .some(.signOut):
            try? Auth.auth().signOut()
            let onBoardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
            let viewController = onBoardingStoryboard.instantiateViewController(identifier: "onboarding") as! OnboardingViewController
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
