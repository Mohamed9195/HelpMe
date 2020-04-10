//
//  EmailTableViewCell.swift
//  HelpMe
//
//  Created by mohamed hashem on 3/17/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit

class EmailTableViewCell: UITableViewCell {

    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var userEmail: UILabel!

    func set(image: UIImage, username: String) {
        self.userImage.image = image
        self.userEmail.text = username
    }
}
