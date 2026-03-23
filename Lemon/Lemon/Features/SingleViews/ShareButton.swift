//
//  ShareButton.swift
//  Lemon
//
//  Created by Kazim Ahmad on 23/03/2026.
//

import SwiftUI

enum ShareType {
    case story
    case user
}

struct ShareItem: Identifiable {
    let id: Int
    let type: ShareType
    let text: String
}

struct ShareButton: View {
    let item: ShareItem
    
    var body: some View {
        Button {
            
        } label: {
            Images.share
        }
    }
}
