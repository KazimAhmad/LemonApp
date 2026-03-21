//
//  ViewOffsetKey.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
