//
//  OnboardingRoute.swift
//  Lemon
//
//  Created by Kazim Ahmad on 13/04/2026.
//

import Foundation

enum OnboardingRoute: Hashable {
    case onboarding
    case login
    case signUp
    case signUpSecondStep(SignUpObject)
    
    var id: String {
        switch self {
        case .onboarding:
            return "onboarding"
        case .login:
            return "login"
        case .signUp:
            return "signUp"
        case .signUpSecondStep:
            return "signUpSecondStep"
        }
    }
    
    static func == (lhs: OnboardingRoute, rhs: OnboardingRoute) -> Bool {
        return lhs.id == rhs.id
    }
}

enum OnboardingSheet: Identifiable {
    case empty
    var id: String {
        switch self {
        default:
            return "empty"
        }
    }
}

enum OnboardingFullScreen: Identifiable {
    case empty
    var id: String {
        switch self {
        default:
            return "empty"
        }
    }
}
