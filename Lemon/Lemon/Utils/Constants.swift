//
//  Constants.swift
//  Swag
//
//  Created by Kazim Ahmad on 07/01/2026.
//

import SwiftUI

enum Constants {
    static let alertCornerRadius: CGFloat = 48
    static let shadowRadius: CGFloat = 16
    static let logoFontSize: CGFloat = 48
    static let yellowGradientColors: [Color] = [.accent,
                                                .accent.opacity(0.9),
                                                .accent.opacity(0.8),
                                                .accent.opacity(0.7),
                                                .accent.opacity(0.6),
                                                .accent.opacity(0.5),
                                                .accent.opacity(0.4),
                                                .accent.opacity(0.3),
                                                .accent.opacity(0.2),
                                                .accent.opacity(0.1),
                                                .clear]
    
    static let greenGradientColors: [Color] = [.second,
                                               .second.opacity(0.9),
                                               .second.opacity(0.8),
                                               .second.opacity(0.7),
                                               .second.opacity(0.6),
                                               .second.opacity(0.5),
                                               .second.opacity(0.4),
                                               .second.opacity(0.3),
                                               .second.opacity(0.2),
                                               .second.opacity(0.1),
                                               .clear]
    
    static let userPicSize: CGFloat = 32.0
    static let userPicSizeBig: CGFloat = 60.0
    static let userPicSizeExtraLarge: CGFloat = 100.0
}
