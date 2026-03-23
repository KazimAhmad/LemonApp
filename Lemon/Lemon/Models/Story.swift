//
//  Story.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import Foundation

struct Story: Codable {
    var id: Int
    var title: String
    var storyline: String
    var date: Date
    
    var isLiked: Bool
    var isSaved: Bool
    
    var author: User
}
