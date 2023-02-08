//
//  GradientButtonStyle.swift
//  ChessClock
//
//  Created by Silas Nevstad on 2/8/23.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.92 : 1.0)
    }
}
