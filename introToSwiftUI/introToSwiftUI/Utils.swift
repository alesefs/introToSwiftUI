//
//  Utils.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 09/05/24.
//

import Foundation
import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

extension Color {
    static let lightTeal = Color(red: 0 / 255, green: 220 / 255, blue: 220 / 255)
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
    static let lightGray = Color(red: 204 / 255, green: 204 / 255, blue: 204 / 255, opacity:1.0)
    static let darkGray = Color(hex: 0x444444, opacity: 1.0)
}
