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
    
    var likesCount: Int
    var commentsCount: Int
    
    var isLiked: Bool
    var isSaved: Bool
    
    var author: User
    
    func numberOfLikes() -> String {
        guard likesCount > 0 else { return " " }
        if likesCount < 1000 {
            return "\(likesCount)"
        } else if likesCount < 1_000_000 {
            return "\(Double(likesCount) / 1000.0)k"
        } else {
            return "\(likesCount / 1_000_000)M"
        }
    }
    
    func numberOfComments() -> String {
        guard commentsCount > 0 else { return " " }
        if commentsCount < 1000 {
            return "\(commentsCount)"
        } else if commentsCount < 1_000_000 {
            return "\(Double(commentsCount) / 1000.0)k"
        } else {
            return "\(commentsCount / 1_000_000)M"
        }
    }
}
