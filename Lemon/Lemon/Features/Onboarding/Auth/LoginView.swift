//
//  LoginView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 24/03/2026.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack {
                logoView()
                textFieldsView()
            }
            .padding()
            buttonsView()
        }
    }
    
    private func logoView() -> some View {
        HStack(alignment: .bottom) {
            Image(Images.icon)
                .resizable()
                .frame(width: 100, height: 100)
            Text("Lemon")
                .font(AppTypography.bold(size: Constants.logoFontSize))
        }
        .padding()
    }
    
    private func textFieldsView() -> some View {
        VStack {
            AppTextField(title: "Email",
                         text: $viewModel.email)
            AppTextField(title: "Password",
                         text: $viewModel.password,
                         isSecure: true)
        }
        .font(AppTypography.mediumApp())
    }
    
    private func buttonsView() -> some View {
        VStack {
            Spacer()
            Button {
                
            } label: {
                Text("Login")
            }
            .disabled(!viewModel.isFormValid())
            .buttonStyle(YellowAndBlackButton())
            
            Button {
                viewModel.goToSignUp()
            } label: {
                Text("Don't have an account? Sign up")
                    .font(AppTypography.mediumApp())
                    .foregroundStyle(Color.third)
                    .padding(.vertical)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
