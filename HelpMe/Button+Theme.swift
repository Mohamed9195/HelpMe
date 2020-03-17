//
//  Button+UI.swift
//  Butterfly
//
//  Created by mohamed hashem on 7/4/19.
//  Copyright © 2019 Xtrava Inc. All rights reserved.
//

import UIKit

enum ButtonTheme: Theme {
    typealias T = UIButton

    case standardRedButtonBorder
    case standardGrayButtonBorder
    case standardButtonBorder(color: CGColor,borderWidth: CGFloat)
    case customStyle(color: UIColor?, image: UIImage?)

    func apply(_ sender: UIButton) {
        switch self {
        case .standardRedButtonBorder:
            sender.layer.cornerRadius = sender.layer.frame.height / 2
            sender.layer.borderWidth = 2
            sender.layer.borderColor = #colorLiteral(red: 1, green: 0.4431372549, blue: 0.4039215686, alpha: 1)
        case .standardGrayButtonBorder:
            sender.layer.cornerRadius = sender.layer.frame.height / 2
            sender.layer.borderWidth = 2
            sender.layer.borderColor = #colorLiteral(red: 0.6980392157, green: 0.6980392157, blue: 0.6980392157, alpha: 1)
        case .customStyle(let color, let image):
            sender.setImage(image, for: .normal)
            sender.backgroundColor = color
        case .standardButtonBorder(let color, let width):
            sender.layer.cornerRadius = sender.layer.frame.height / 2
            sender.layer.borderWidth = width
            sender.layer.borderColor = color
        }
    }
}

extension UIButton: ThemeView {

    typealias ThemeType = ButtonTheme

    func apply(_ style: ButtonTheme) {
        style.apply(self)
    }
}
