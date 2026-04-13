//
//  SignUpSecondViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 25/03/2026.
//

import Combine
import SwiftUI

class SignUpSecondViewModel: ObservableObject {
    @Published var signUpObject: SignUpObject
    
    var coordinator: OnboardingCoordinator?
        
    init(signUpObject: SignUpObject,
         coordinator: OnboardingCoordinator? = nil) {
        self.signUpObject = signUpObject
        self.coordinator = coordinator
    }

    func isFormValid() -> Bool {
        signUpObject.passions.count == 3 && !signUpObject.industry.isEmpty
    }
}
