//
//  UIHelper.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/20/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import Foundation
import PKHUD

class UIHelper {
    class func showProgressView() {
        HUD.show(.progress)
    }

    class func hideProgressView() {
        HUD.hide()
    }
}
