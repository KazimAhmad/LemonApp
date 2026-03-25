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
    
    init(signUpObject: SignUpObject) {
        self.signUpObject = signUpObject
    }
    
    func isFormValid() -> Bool {
        signUpObject.passions.count == 3 && !signUpObject.industry.isEmpty
    }
}
