//
//  GradientBackgroundView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 24/03/2026.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
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
        .padding(.vertical)
    }
}
