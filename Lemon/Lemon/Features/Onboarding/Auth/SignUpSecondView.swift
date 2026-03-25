//
//  SignUpSecondView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 25/03/2026.
//

import SwiftUI

struct SignUpSecondView: View {
    @StateObject var viewModel: SignUpSecondViewModel
    var body: some View {
        ZStack {
            GradientBackgroundView()
            ScrollView(showsIndicators: false) {
                logoView()
                AppTextField(title: "Work", text: $viewModel.signUpObject.industry)
                AppTextView(title: "Bio", text: $viewModel.signUpObject.bio)
                PassionsView(viewModel: PassionsViewModel(selectedPassions: viewModel.signUpObject.passions))
                Button {
                    
                } label: {
                    Text("Sign Up")
                }
                .disabled(!viewModel.isFormValid())
                .buttonStyle(YellowAndBlackButton())
                .padding(.vertical, 32)
            }
            .padding()
        }
    }
    
    private func logoView() -> some View {
        HStack(alignment: .bottom) {
            Button {
                
            } label: {
                DefaultUserPicture(size: Constants.userPicSizeExtraLarge)
                    .overlay {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Images.camera
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(Color.second)
                            }
                        }
                    }
            }
            VStack(alignment: .trailing, spacing: -8) {
                Text(viewModel.signUpObject.firstName)
                    .font(AppTypography.bold(size: Constants.logoFontSize))
                Text(viewModel.signUpObject.lastName)
                    .font(AppTypography.regularApp())
            }
        }
        .foregroundStyle(Color.primary)
        .padding(.vertical, 60)
    }
}

#Preview {
    SignUpSecondView(viewModel: SignUpSecondViewModel(signUpObject: SignUpObject(firstName: "Kazim",
                                                                                 lastName: "Ahmad")))
}
