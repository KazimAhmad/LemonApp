//
//  Passion.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import Foundation

struct Passion: Codable {
    var id: Int
    var name: String
    var color: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.color = "E3170A"
    }
}

struct PassionCategory: Codable {
    var id: Int
    var name: String
    var passions: [Passion]
}
