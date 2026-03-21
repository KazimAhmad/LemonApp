//
//  LoadingView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 15/03/2026.
//

import Combine
import SwiftUI

struct LoadingView: View {
    let slicesTimer = Timer.publish(every: 0.5,
                                    on: .main,
                                    in: .common).autoconnect()
    let circleTimer = Timer.publish(every: 0.1,
                                    on: .main,
                                    in: .common).autoconnect()

    private var totalSlices: Int = 6
    @State private var currentSlice: Int = 1
    @State private var circle: Double = 0.0
    var body: some View {
        HStack {
            Spacer()
            CircularLayout() {
                ForEach(0 ..< totalSlices, id: \.self) { i in
                    LemonSlice()
                        .rotationEffect(rotation(for: i, total: totalSlices))
                        .opacity(i < currentSlice ? 1 : 0.2)
                }
            }
            Spacer()
        }
        .background(
            ZStack {
                Circle()
                    .fill(Color.clear)
                    .stroke(Color.accentColor.opacity(0.2), lineWidth: 8)
                Circle()
                    .trim(from: 0.0, to: circle)
                    .fill(Color.clear)
                    .stroke(Color.accentColor, lineWidth: 8)
                    .rotationEffect(.degrees(-90))
            }
                .padding(-16)
        )
        .onReceive(slicesTimer) { time in
            withAnimation {
                currentSlice = currentSlice == totalSlices ? 1 : currentSlice + 1
            }
        }
        .onReceive(circleTimer) { time in
            withAnimation {
                if circle < 1.0 {
                    circle = circle + 0.034
                }
            }
            if circle >= 1.0 {
                circle = 0.0
            }
        }
    }
    
    private func rotation(for index: Int, total: Int) -> Angle {
        let angleStep = 360.0 / Double(total)
        return .degrees(angleStep * Double(index) + 180)
    }
}

#Preview {
    LoadingView()
}
