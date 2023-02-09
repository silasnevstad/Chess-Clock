//
//  ColorSchemeButton.swift
//  ChessClock
//
//  Created by Silas Nevstad on 2/8/23.
//

import SwiftUI

struct ColorSchemeButton: View {
    var topColor: String
    var bottomColor: String
    private(set) var action: (() -> Void)? = nil
    private let noop: () -> Void = {}
    
    var body: some View {
        Button(action: self.action ?? self.noop) {
            ZStack {
                Circle()
                    .trim(from: 0.5, to: 1)
                    .fill(Color(topColor))
                    .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 13)
                Circle()
                    .trim(from: 0, to: 0.5)
                    .fill(Color(bottomColor))
                    .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 13)
            }
        }.buttonStyle(GradientButtonStyle())
    }
}
