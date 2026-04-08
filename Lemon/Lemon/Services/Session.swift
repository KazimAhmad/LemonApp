//
//  Session.swift
//  Lemon
//
//  Created by Kazim Ahmad on 09/04/2026.
//

import Foundation

@Observable
class Session {
    static let current = Session()

    var isAuthenticated: Bool = false
    var guest: Bool = false
    
}
