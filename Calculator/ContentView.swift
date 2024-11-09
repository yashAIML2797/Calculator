//
//  ContentView.swift
//  Calculator
//
//  Created by Yash Uttekar on 09/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expression = ""
    let buttons = ["C", "+/-", "%", "÷", "7", "8", "9", "X", "4", "5", "6", "-", "1", "2", "3", "+"]
    
    var body: some View {
        GeometryReader { geometry in
            let padding = geometry.size.width * 0.05
            let spacing = geometry.size.width * 0.025
            let availableSize = geometry.size.width - (padding * 2) - (spacing * 3)
            let side = (availableSize / 4)
            
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    Spacer()
                    Text(expression)
                        .font(.system(size: 30, weight: .bold))
                }
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 4), alignment: .leading, spacing: spacing) {
                    ForEach(buttons, id: \.self) { i in
                        Text("\(i)")
                            .frame(width: side,
                                   height: side)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                expression.append(i)
                            }
                            .border(.red)
                    }
                    
                    GridRow {
                        HStack(spacing: spacing) {
                            Text("0")
                                .frame(width: (geometry.size.width / 2) - padding - spacing,
                                       height: side)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    expression.append("0")
                                }
                                .border(.red)
                            Text(".")
                                .frame(width: side,
                                       height: side)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    expression.append(".")
                                }
                                .border(.red)
                            Text("=")
                                .frame(width: side,
                                       height: side)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    expression.append("=")
                                }
                                .border(.red)
                        }
                    }
                }
            }
            .padding(.horizontal, padding)
            .padding(.bottom, padding)
        }
    }
}

#Preview {
    ContentView()
}
