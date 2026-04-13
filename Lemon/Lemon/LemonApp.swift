//
//  LemonApp.swift
//  Lemon
//
//  Created by Kazim Ahmad on 15/03/2026.
//

import SwiftUI
import SwiftData

@main
struct LemonApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(sharedModelContainer)
    }
}

struct MainView: View {
    var session: Session = Session.current
    var coordinator = OnboardingCoordinator()

    var body: some View {
        if session.guest {
            AppTabView()
        } else {
            coordinator.coordinatorView
        }
    }
}
