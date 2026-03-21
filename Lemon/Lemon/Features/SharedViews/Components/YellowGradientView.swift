//
//  YellowGradientView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import SwiftUI

struct YellowGradientView: View {
    let endRadius: CGFloat = 140
    var body: some View {
        RadialGradient(colors: Constants.yellowGradientColors,
                       center: .center,
                       startRadius: 0,
                       endRadius: endRadius)
        .frame(width: endRadius * 2, height: endRadius * 2)
    }
}

struct GreenGradientView: View {
    let endRadius: CGFloat = 100
    var body: some View {
        RadialGradient(colors: Constants.greenGradientColors,
                       center: .center,
                       startRadius: 0,
                       endRadius: endRadius)
        .frame(width: endRadius * 2, height: endRadius * 2)
    }
}
