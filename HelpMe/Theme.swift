//
//  Theme.swift
//  Butterfly
//
//  Created by Ahmed Henawey on 7/30/19.
//  Copyright © 2019 Xtrava Inc. All rights reserved.
//

import UIKit

protocol ThemeView where Self: UIView {
    associatedtype ThemeType: Theme
    func apply(_ style: ThemeType)
}

protocol Theme {
    associatedtype T: ThemeView
    func apply(_ sender: T)
}
