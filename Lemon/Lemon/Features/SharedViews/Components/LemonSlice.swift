//
//  LemonSlice.swift
//  Lemon
//
//  Created by Kazim Ahmad on 16/03/2026.
//

import SwiftUI

struct LemonSlice: View {
    var body: some View {
        ZStack {
            LemonSliceShape()
                .stroke(Color(.gray), lineWidth: 1)
                .frame(width: 40, height: 50)
            LemonSliceShape()
                .foregroundStyle(Color(.accent))
                .frame(width: 24, height: 40)
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.gray)
                .frame(width: 1, height: 24)
        }
    }
}
