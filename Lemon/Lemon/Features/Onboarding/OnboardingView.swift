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
            gradientsView()
            Image(Images.icon)
                .resizable()
                .frame(width: 100, height: 140)
        }
    }
    
    private func gradientsView() -> some View {
        VStack {
            HStack {
                YellowGradientView()
                Spacer()
            }
            .offset(x: -80)
            Spacer()
            HStack {
                Spacer()
                GreenGradientView()
            }
            .offset(x: 80)
        }
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
