//
//  SwiftServices+Auth.swift
//  Lemon
//
//  Created by Kazim Ahmad on 25/03/2026.
//

import Foundation

extension SwiftServices {
    func enterAsGuest() {
        self.userSession.guest = true
    }
}
