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
            Text("Lemon")
        }
        .modelContainer(sharedModelContainer)
    }
}
