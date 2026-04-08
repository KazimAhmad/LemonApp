//
//  SettingsView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 07/04/2026.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    var body: some View {
        VStack {
            AppHeaderView()
            List {
                Section {
                    listItemView("Saved Stories")
                    listItemView("Drafts")
                }
                Section {
                    listItemView("About Us")
                    listItemView("Language")
                    listItemView("Terms & Conditions")
                    listItemView("Privacy Policy")
                }
                Section {
                    listItemView("Logout")
                }
            }
            .font(AppTypography.regularApp())
            Text("Copyright © 2026 Lemon. All rights reserved.")
                .font(AppTypography.regular12())
        }
        .ignoresSafeArea(.all,
                         edges: .top)
    }
    
    private func listItemView(_ text: String,
                              image: Image? = Images.rightArrow,
                              ontap: (() -> Void)? = nil) -> some View {
        HStack {
            Text(text)
                .font(AppTypography.regularApp())
            Spacer()
            if let image = image {
                image
            }
        }
        .onTapGesture {
            ontap?()
        }
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}
