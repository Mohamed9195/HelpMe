//
//  OnboardingViewController.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/13/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import RxSwift
import FirebaseAuth
import RxRelay

class OnboardingViewController: UIViewController {

    @IBOutlet private weak var cloudImageView: UIImageView!
    @IBOutlet private weak var getStartedButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    
     let dispos = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.animateImage(duration: 4, image: cloudImageView)
        self.getStartedButton.apply(.standardButtonBorder(color: #colorLiteral(red: 0.1921568627, green: 0.4784313725, blue: 0.7254901961, alpha: 1), borderWidth: 2))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.5) { [weak self] in
          self?.view.layoutIfNeeded()
        }
    }
}
