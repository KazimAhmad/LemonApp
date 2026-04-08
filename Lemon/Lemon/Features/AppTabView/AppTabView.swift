//
//  AppTabView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import SwiftUI

enum AppTab: String, Hashable, CaseIterable {
    case home
    case profile
    case settings
    case search
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        case .search:
            return "Search"
        }
    }
    
    var symbolImage: String {
        switch self {
        case .home:
            return Images.homeSystemImage
        case .profile:
            return Images.userSystemImage
        case .settings:
            return Images.settingsSystemImage
        case .search:
            return Images.searchSystemImage
        }
    }
    
    var role: TabRole? {
        switch self {
        case .search:
            return .search
        default:
            return nil
        }
    }
}


struct AppTabView: View {
    
    var body: some View {
        TabView {
            ForEach(AppTab.allCases, id: \.rawValue) { tab in
                Tab(tab.title,
                    systemImage: tab.symbolImage,
                    role: tab.role) {
                    tabView(for: tab)
                }
            }
        }
    }
    
    @ViewBuilder
    func tabView(for tab: AppTab) -> some View {
        switch tab {
        case .home:
            HomeView(viewModel: HomeViewModel())
                .tag(tab)
        case .profile:
            ProfileView(viewmodel: ProfileViewModel())
        case .settings:
            Text("Settings")
                .tag(tab)
        case .search:
            Text("Search")
                .tag(tab)
        }
    }
}

#Preview {
    AppTabView()
}
