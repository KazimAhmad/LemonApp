//
//  SignUpViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 24/03/2026.
//

import Combine
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var signUp: SignUpObject
    init(signUp: SignUpObject = SignUpObject()) {
        self.signUp = signUp
    }
    
    func isFormValid() -> Bool {
        (!signUp.email.isEmpty && isEmailValid()) && !signUp.password.isEmpty && !signUp.confirmPassword.isEmpty && !signUp.firstName.isEmpty && !signUp.lastName.isEmpty && passwordsMatch()
    }
    
    func passwordsMatch() -> Bool {
        signUp.password == signUp.confirmPassword
    }
    
    func isEmailValid() -> Bool {
        signUp.email.isEmail
    }
}
