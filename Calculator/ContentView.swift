//
//  ContentView.swift
//  Calculator
//
//  Created by Yash Uttekar on 09/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expression = ""
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let operators = ["÷", "X", "-", "+", "="]
    let others = ["C", "+/-", "%"]
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
                
                HStack {
                    VStack(spacing: spacing) {
                        HStack(spacing: spacing) {
                            ForEach(others, id: \.self) { i in
                                Text("\(i)")
                                    .frame(width: side,
                                           height: side)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        expression.append("\(i)")
                                    }
                                    .border(.red)
                            }
                        }
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(side), spacing: spacing), count: 3), alignment: .leading, spacing: spacing) {
                            ForEach(numbers, id: \.self) { i in
                                Text("\(i)")
                                    .frame(width: side,
                                           height: side)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        expression.append(i)
                                    }
                                    .border(.red)
                            }
                        }
                        
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
                        }
                    }
                    
                    VStack(spacing: spacing) {
                        ForEach(operators, id: \.self) { i in
                            Text("\(i)")
                                .frame(width: side,
                                       height: side)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    expression.append(i)
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
