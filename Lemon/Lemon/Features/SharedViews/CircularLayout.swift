//
//  CircularLayout.swift
//  Lemon
//
//  Created by Kazim Ahmad on 16/03/2026.
//

import SwiftUI

struct CircularLayout: Layout {
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) -> CGSize {
        let itemSize = subviews.first?.sizeThatFits(.unspecified) ?? .zero
        guard subviews.count > 0 else { return itemSize }
        let radius = idealRadius(itemSize: itemSize, count: subviews.count)
        return CGSize(width: radius * 2 + itemSize.width,
                      height: radius * 2 + itemSize.height)
    }
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) {
        guard subviews.count > 0 else { return }
        let itemSize = subviews.first?.sizeThatFits(.unspecified) ?? .zero
        let radius = idealRadius(itemSize: itemSize, count: subviews.count)
        let angleStep = (2 * Double.pi) / Double(subviews.count)
        
        for (index, subview) in subviews.enumerated() {
            let angle = angleStep * Double(index) - .pi / 2
            
            let x = bounds.midX + radius * cos(angle)
            let y = bounds.midY + radius * sin(angle)
            
            subview.place(
                at: CGPoint(x: x, y: y),
                anchor: .center,
                proposal: .unspecified
            )
        }
    }
    
    private func idealRadius(itemSize: CGSize, count: Int) -> Double {
        guard count > 1 else { return 0 }
        let angleStep = (2 * Double.pi) / Double(count)
        let itemDiameter = Double(20)
        return (itemDiameter / 2) / sin(angleStep / 2)
    }
}
