//
//  AppTabView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import SwiftUI

enum AppTab: String, Hashable, CaseIterable {
    case home
    case settings
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .settings:
            return "Settings"
        }
    }
    
    var symbolImage: Image {
        switch self {
        case .home:
            return Images.home
        case .settings:
            return Images.settings
        }
    }
}


struct AppTabView: View {
    @State private var selectedTab: AppTab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(AppTab.allCases, id: \.rawValue) { tab in
                tabView(for: tab)
                    .tabItem {
                        tab.symbolImage
                        Text(tab == selectedTab ? tab.title : "")
                    }
                    .tag(tab)
            }
        }
    }
    
    @ViewBuilder
    func tabView(for tab: AppTab) -> some View {
        switch tab {
        case .home:
            Text("Home")
                .tag(AppTab.home)
        case .settings:
            Text("Settings")
                .tag(AppTab.settings)
        }
    }
}

#Preview {
    AppTabView()
}
