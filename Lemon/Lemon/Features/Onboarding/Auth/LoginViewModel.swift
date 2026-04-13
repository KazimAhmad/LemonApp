//
//  LoginViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 24/03/2026.
//

import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    var coordinator: OnboardingCoordinator?
    
    init(coordinator: OnboardingCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func isFormValid() -> Bool {
        (!email.isEmpty && isEmailValid()) && !password.isEmpty
    }
    
    private func isEmailValid() -> Bool {
        email.isEmail
    }
    
    func goToSignUp() {
        coordinator?.goToSignUp()
    }    
}
