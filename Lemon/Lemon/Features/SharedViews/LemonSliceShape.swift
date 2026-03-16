//
//  LemonSliceShape.swift
//  Lemon
//
//  Created by Kazim Ahmad on 16/03/2026.
//

import SwiftUI

struct LemonSliceShape: Shape {
    func path(in rect: CGRect) -> Path {
        let cornerRadius: CGFloat = 8
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let left = CGPoint(x: rect.minX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.maxY)
        
        return Path { path in
            path.move(to: top)
            path.addArc(tangent1End: right,
                        tangent2End: left,
                        radius: cornerRadius)
            
            path.addArc(tangent1End: left,
                        tangent2End: top,
                        radius: cornerRadius)
            
            path.addArc(tangent1End: top,
                        tangent2End: right,
                        radius: 4)

            path.closeSubpath()
        }
    }
}
