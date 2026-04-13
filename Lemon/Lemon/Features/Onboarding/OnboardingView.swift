//
//  OnboardingView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 20/03/2026.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    var body: some View {
        ZStack {
            GradientBackgroundView()
            logoView()
            VStack {
                Spacer()
                textsView()
                footerView()
            }
        }
    }
    
    private func logoView() -> some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Image(Images.icon)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Lemon")
                    .font(AppTypography.bold(size: Constants.logoFontSize))
            }
            Text("When life throws lemons at you;\naggresively and continuously.")
                .font(AppTypography.regular(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
    
    private func footerView() -> some View {
        HStack {
            Spacer()
            Button {
                viewModel.skipAuth()
            } label: {
                Text("Skip")
            }
            .buttonStyle(YellowAndBlackButton())
            .frame(width: 120)

            Button {
                viewModel.goToLogin()
            } label: {
                Text("Login")
            }
            .buttonStyle(GreenAndWhiteButton())

        }
        .padding(.horizontal)
    }
    
    private func textsView() -> some View {
        VStack(alignment: .leading) {
            TabView(selection: $viewModel.currentItemIndex) {
                ForEach(Array(viewModel.texts.enumerated()), id: \.offset) { index, text in
                    VStack {
                        Spacer()
                        Text(text)
                            .font(AppTypography.mediumApp())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            HStack {
                PageControl(currentPage: $viewModel.currentItemIndex,
                            numberOfPages: viewModel.texts.count,
                            shouldHaveBigCurrentPageIndicator: true,
                            unselectedColor: .gray)
                Spacer()
            }
            .padding(.bottom)
        }
        .padding(.horizontal)
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
