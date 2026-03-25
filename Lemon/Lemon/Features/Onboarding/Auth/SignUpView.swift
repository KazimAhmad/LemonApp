//
//  SignUpView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 24/03/2026.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            ScrollView {
                VStack {
                    logoView()
                    textFieldsView()
                    buttonsView()
                }
                .padding()
            }
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
        .padding(.vertical, 60)
    }
    
    private func textFieldsView() -> some View {
        VStack {
            HStack {
                AppTextField(title: "First Name",
                             text: $viewModel.firstName)
                AppTextField(title: "Last Name",
                             text: $viewModel.lastName)
            }
            AppTextField(title: "Email",
                         text: $viewModel.email)
            AppTextField(title: "Password",
                         text: $viewModel.password,
                         isSecure: true)
            AppTextField(title: "Confirm Password",
                         text: $viewModel.confirmPassword,
                         isSecure: true)
        }
        .font(AppTypography.mediumApp())
    }
    
    private func buttonsView() -> some View {
        VStack {
            Button {
                
            } label: {
                Text("Sign Up")
            }
            .disabled(!viewModel.isFormValid())
            .buttonStyle(YellowAndBlackButton())
            
            Button {
                
            } label: {
                Text("Don't have an account? Sign up")
                    .font(AppTypography.mediumApp())
                    .foregroundStyle(Color.second)
                    .padding(.vertical)
            }
        }
        .padding(.vertical, 32)
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
