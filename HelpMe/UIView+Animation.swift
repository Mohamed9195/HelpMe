//
//  UIView+Animation.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/13/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit

extension UIView {
    func animateImage(duration: TimeInterval, image: UIImageView ) {
        let options: UIView.AnimationOptions = [.curveEaseInOut, .repeat, .autoreverse]
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: options,
                       animations: {
                        image.frame.origin.x *= -10
        },
                       completion: nil)
    }

    func animateImageSize(duration: TimeInterval, image: UIImageView ) {
           let options: UIView.AnimationOptions = [.curveEaseInOut, .repeat, .autoreverse]

           UIView.animate(withDuration: duration,
                          delay: 0,
                          options: options,
                          animations: {
                            image.frame.size.height *= 1.8
                            image.frame.size.width *= 1.8
           },
                          completion: nil)
       }
}
