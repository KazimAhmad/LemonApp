//
//  PassionRepo.swift
//  Lemon
//
//  Created by Kazim Ahmad on 25/03/2026.
//

import Foundation

class PassionRepo {
    func get() async throws -> [PassionCategory] {
        // Locate the bundled JSON file
        guard let fileURL = Bundle.main.url(forResource: "Passions", withExtension: "json") else {
            // If the file isn't found, throw a descriptive error
            throw NSError(domain: "PassionRepo", code: 1, userInfo: [NSLocalizedDescriptionKey: "Missing passions.json in bundle"])
        }

        // Load data from disk
        let fileData = try Data(contentsOf: fileURL)

        // Decode into your model array
        let decoder = JSONDecoder()
        return try decoder.decode([PassionCategory].self, from: fileData)
    }
}
