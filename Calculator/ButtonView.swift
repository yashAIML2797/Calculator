//
//  ButtonView.swift
//  Calculator
//
//  Created by Yash Uttekar on 10/11/24.
//

import SwiftUI

struct ButtonView: View {
    @State private var scale = false
    
    var label: String
    var width: CGFloat
    var height: CGFloat
    var textColor: Color
    var color1: Color
    var color2: Color
    var action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: height * 0.4)
            .foregroundStyle(
                LinearGradient(colors: [color2, color1],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .shadow(.inner(color: color1, radius: 3, x: 3, y: 3))
                .shadow(.inner(color: color2, radius: 3, x: -3, y: -3))
            )
            .overlay {
                Text(label)
                    .font(.system(size: 25, weight: .medium))
                    .foregroundStyle(textColor)
            }
            .frame(width: width,
                   height: height)
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        scale = true
                    })
                    .onEnded({ _ in
                        action()
                        scale = false
                    })
            )
            .scaleEffect(CGSize(width: scale ? 0.95 : 1,
                                height: scale ? 0.95 : 1))
            .animation(.easeOut(duration: 0.2), value: scale)
    }
}

#Preview {
    ButtonView(label: "0", width: 0, height: 0, textColor: .black, color1: Color("Orange"), color2: Color("Orange.Shadow"), action: {})
}
