//
//  ChatFilterButtonModifier.swift
//  WhatsAppClone
//
//  Created by Turker Alan on 16.10.2025.
//

import SwiftUI

struct ChatFilterButtonModifier: ViewModifier {
    var isSelected: Bool = false
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.whatsAppBlack.opacity(0.8))
            .font(.subheadline)
            .bold()
            .padding(8)
            .background(
                Capsule()
                    .fill(isSelected ? Color.green.opacity(0.2) : Color.clear)
            )
            .overlay {
                Capsule()
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .foregroundStyle(isSelected ? .green : .gray)
            }
    }
}

extension View {
    func chatFilterButtonModifier(isSelected: Bool = false) -> some View {
        modifier(ChatFilterButtonModifier(isSelected: isSelected))
    }
}
