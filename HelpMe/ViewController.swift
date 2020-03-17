//
//  ViewController.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/12/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Auth.auth().currentUser)
//        let firebaseAuth = Auth.auth()
//        do {
//            try firebaseAuth.signOut()
//        } catch let signOutError as NSError {
//            print ("Error signing out: %@", signOutError)
//        }
    }


}

