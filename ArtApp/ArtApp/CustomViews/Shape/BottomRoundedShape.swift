//
//  BottomRoundedShape.swift
//  ArtApp
//
//  Created by Murat on 28.02.2025.
//

import SwiftUI

struct BottomRoundedShape: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let cornerRadius: CGFloat = 32.0
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))

        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY),
            control: CGPoint(x: rect.maxX, y: rect.maxY)
        )

        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius),
            control: CGPoint(x: rect.minX, y: rect.maxY)
        )

        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        path.closeSubpath()
        return path
    }
}

#Preview {
    VStack{
        BottomRoundedShape()
    }
}
