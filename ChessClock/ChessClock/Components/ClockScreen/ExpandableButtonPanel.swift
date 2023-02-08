//
//  ExpandableButtonPanel.swift
//  ChessClock
//
//  Created by Silas Nevstad on 2/8/23.
//

import SwiftUI

struct ExpandableButtonItem: Identifiable {
    let id = UUID()
    let label: String
    let labelInactive: String
    @Binding var pressed: Bool
    private(set) var action: (() -> Void)? = nil
}

struct ExpandableButtonPanel: View {
    let primaryItem: ExpandableButtonItem
    let secondaryItems: [ExpandableButtonItem]
    
    private let noop: () -> Void = {}
    private let size: CGFloat = 70
    private var cornerRadius: CGFloat { get { size / 1.5 } }
    private let shadowColor = Color.black.opacity(0.4)
    private let shadowPosition: (x: CGFloat, y: CGFloat) = (x: 2, y: 2)
    private let shadowRadius: CGFloat = 3
    
    @State private var isExpanded = false
    
    var body: some View {
        
        HStack (spacing: 1) {
            if isExpanded {
                ForEach(secondaryItems) { item in
                    Button(action: {
                        let action = item.action ?? self.noop
                        action()
                    }) {
                        Image(systemName: item.pressed ? item.label : item.labelInactive)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: self.isExpanded ? item.label == "pause.fill" || item.label == "play.fill" ? UIScreen.main.bounds.width/17 : UIScreen.main.bounds.width/13.5 : 0, height: self.isExpanded ? UIScreen.main.bounds.height/12 : 0)
                            .foregroundColor(.black)
                            .padding(16)
                            .background(Color("Grey"))
                            .clipShape(Circle())
                    }
                    .frame(width: self.isExpanded ? self.size : 0, height: self.isExpanded ? self.size : 0)
                    .opacity(self.isExpanded ? 1 : 0)
                }
            }
            
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
                self.primaryItem.action?()
            }) {
                Image(systemName: primaryItem.pressed ? primaryItem.label : primaryItem.labelInactive)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width/13, height: UIScreen.main.bounds.height/10)
                    .foregroundColor(.black)
                    .padding(16)
                    .background(Color("Grey"))
                    .clipShape(Circle())
                    .rotationEffect(Angle(degrees: isExpanded ? 45 : 0))
            }
            .frame(width: size, height: size)
        }
        .padding(3)
        .background(Color("Grey"))
        .cornerRadius(cornerRadius)
        .font(.title)
        .shadow(
            color: shadowColor,
            radius: shadowRadius,
            x: shadowPosition.x,
            y: shadowPosition.y
        )
    }
}

