//
//  InnerShadow.swift
//  CaptionQuick
//
//  Created by Peyman Osatian on 2024-07-20.
//

import SwiftUI

struct InnerShadow: ViewModifier {
    var color: Color
    var radius: CGFloat
    var x: CGFloat
    var y: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                content
                    .mask(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(color, lineWidth: radius)
                            .offset(x: x, y: y)
                            .blur(radius: radius)
                            .mask(content)
                    )
                    .blendMode(.multiply)
            )
    }
}

extension View {
    func innerShadow(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) -> some View {
        self.modifier(InnerShadow(color: color, radius: radius, x: x, y: y))
    }
}
