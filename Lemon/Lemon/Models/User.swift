//
//  User.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import Foundation

struct User: Codable {
    var id: Int
    var email: String
    var name: String
    var isLemon: Bool
    var image: String
    var industry: String
    var bio: String
    var passions: [Passion]
}
