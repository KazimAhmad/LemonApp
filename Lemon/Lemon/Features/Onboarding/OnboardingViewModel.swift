//
//  OnboardingViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 20/03/2026.
//

import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {
    var coordinator: OnboardingCoordinator?
    
    @Published var currentItemIndex = 0
    var texts: [String] = ["... and all you can do is laugh",
                           "... and you find there is something below rock bottom",
                           "... if you won't share your story who will ?"]
    
    init(coordinator: OnboardingCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func goToLogin() {
        coordinator?.goToLogin()
    }
    
    func skipAuth() {
        Session.current.skipLogin()
    }
}

