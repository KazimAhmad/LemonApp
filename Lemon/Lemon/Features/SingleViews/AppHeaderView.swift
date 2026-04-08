//
//  AppHeaderView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 28/03/2026.
//

import SwiftUI

struct AppHeaderView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 48)
            HStack(alignment: .bottom) {
                Image(Images.icon)
                    .resizable()
                    .frame(width: 60, height: 60)
                Text("Lemon")
                    .font(AppTypography.bold(size: 32))
                Spacer()
            }
            .foregroundStyle(Color(uiColor: .systemBackground))
        }
        .padding()
        .background(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0,
                                                      bottomLeading: 60.0,
                                                      bottomTrailing: 0.0,
                                                      topTrailing: 0.0))
            .fill(Color.second)
        )
    }
}

#Preview {
    AppHeaderView()
}
