//
//  SettingTableViewCell.swift
//  HelpMe
//
//  Created by mohamed hashem on 3/17/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet private weak var settingIcon: UIImageView!
    @IBOutlet private weak var settingLabel: UILabel!
    @IBOutlet private weak var contanirView: UIView!

    func set(index: Setting) {
        switch index {
        case .editPersonalData:
            settingIcon.image = #imageLiteral(resourceName: "editMail")
            settingLabel.text = "Edit Mail"
            settingLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .email:
            break
        case .messages:
            settingIcon.image = #imageLiteral(resourceName: "messages")
            settingLabel.text = "Messages"
            settingLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .posts:
            settingIcon.image = #imageLiteral(resourceName: "posts")
            settingLabel.text = "Posts"
            settingLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .signOut:
            settingIcon.image = #imageLiteral(resourceName: "signOut")
            settingLabel.text = "Logout"
            settingLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            contanirView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
