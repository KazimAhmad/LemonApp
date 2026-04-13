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
    
    var coordinator: OnboardingCoordinator?
        
    init(signUp: SignUpObject = SignUpObject(),
         coordinator: OnboardingCoordinator? = nil) {
        self.signUp = signUp
        self.coordinator = coordinator
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
    
    func goBackToLogin() {
        coordinator?.goBackToLogin()
    }
    
    func goToSecondStep() {
        coordinator?.goToSignUpSecondStep(signUpObject: signUp)
    }
}
