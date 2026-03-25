//
//  SignUpViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 24/03/2026.
//

import Combine
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""

    @Published var email: String = ""
    
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var passions: [Passion] = []
    
    func isFormValid() -> Bool {
        (!email.isEmpty && !isEmailValid()) && !password.isEmpty && !confirmPassword.isEmpty && passions.count == 3 || !firstName.isEmpty || !lastName.isEmpty || passwordsMatch()
    }
    
    func passwordsMatch() -> Bool {
        password == confirmPassword
    }
    
    func isEmailValid() -> Bool {
        email.isEmail
    }
}
