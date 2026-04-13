//
//  OnboardingCoordinator.swift
//  Lemon
//
//  Created by Kazim Ahmad on 13/04/2026.
//
import Combine
import SwiftUI

class OnboardingCoordinator: CoordinatorProtocol {
    var coordinatorView: AnyView {
        AnyView(CoordinatorView(coordinator: self))
    }

    var mainView: some View {
        build(page: .onboarding)
    }

    typealias Route = OnboardingRoute
    typealias Sheet = OnboardingSheet
    typealias FullScreenCover = OnboardingFullScreen
        
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    @ViewBuilder
    func build(page: Route) -> some View {
        switch page {
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel(coordinator: self))
        case .login:
            LoginView(viewModel: LoginViewModel(coordinator: self))
        case .signUp:
            SignUpView(viewModel: SignUpViewModel(coordinator: self))
        case .signUpSecondStep(let object):
            SignUpSecondView(viewModel: SignUpSecondViewModel(signUpObject: object,
                                                              coordinator: self))
        }
    }
    
    func build(sheet: Sheet) -> some View {
        switch sheet {
            default:
                EmptyView()
        }
    }
    
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        default:
            EmptyView()
        }
    }
}

//MARK: - Navigation
extension OnboardingCoordinator {
    func goToLogin() {
        push(.login)
    }
    
    func goBackToLogin() {
        pop()
    }
    
    func goToSignUp() {
        push(.signUp)
    }
    
    func goToSignUpSecondStep(signUpObject: SignUpObject) {
        push(.signUpSecondStep(signUpObject))
    }
}
