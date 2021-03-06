//
//  LogInInteractor.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/13/20.
//  Copyright (c) 2020 mohamed hashem. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import FirebaseAuth

protocol LogInInteractorInput: class {
    func login(email: String, password: String)
}

protocol LogInInteractorOutput: class {
    func displayError(error: String)
    func signSuccess()
}

class LogInInteractor: LogInInteractorInput {

    var output: LogInInteractorOutput?
    let worker = LogInWorker()
    let authentication = Auth.auth()

    init() {
    }

    func login(email: String, password: String) {
        signIn(email: email, password: password)
    }

    private func signIn(email: String, password: String) {
        let validEmail = checkEmailValidation(email: email)
        let validPassword = checkPasswordValidation(password: password)

        authentication.signIn(withEmail: validEmail, password: validPassword) { (result, error) in
            if let error = error {
                print("error: ", error)
                self.output?.displayError(error: error.localizedDescription)
                return
            }

            self.output?.signSuccess()
        }
    }

    private func checkEmailValidation(email: String) -> String {
        return email
    }

    private func checkPasswordValidation(password: String) -> String {
        return password
    }

}
