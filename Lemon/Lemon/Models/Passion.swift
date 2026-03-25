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
}

struct PassionCategory: Codable {
    var id: Int
    var name: String
    var passions: [Passion]
}
