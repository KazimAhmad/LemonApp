//
//  DefaultUserPicture.swift
//  Lemon
//
//  Created by Kazim Ahmad on 23/03/2026.
//

import SwiftUI

struct DefaultUserPicture: View {
    var size: CGFloat = Constants.userPicSize
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.second)
                .frame(width: size / 1.5)
                .offset(y: -size / 6)
            Images.user
                .resizable()
                .frame(width: size,
                       height: size)
        }
    }
}
