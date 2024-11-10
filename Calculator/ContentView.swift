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
                                ButtonView(label: "\(i)", width: side, height: side,
                                           textColor: .black,
                                           color1: Color("LightGray"),
                                           color2: Color("LightGray.Shadow")) {
                                    expression.append("\(i)")
                                }
                            }
                        }
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(side), spacing: spacing), count: 3), alignment: .leading, spacing: spacing) {
                            ForEach(numbers, id: \.self) { i in
                                ButtonView(label: "\(i)", width: side, height: side,
                                           textColor: Color("TextDark"),
                                           color1: Color("White"),
                                           color2: Color("White.Shadow")) {
                                    expression.append("\(i)")
                                }
                            }
                        }
                        
                        HStack(spacing: spacing) {
                            ButtonView(label: "0",
                                       width: (geometry.size.width / 2) - padding - spacing,
                                       height: side,
                                       textColor: Color("TextDark"),
                                       color1: Color("White"),
                                       color2: Color("White.Shadow")) {
                                expression.append("0")
                            }
                            ButtonView(label: ".", width: side, height: side,
                                       textColor: Color("TextDark"),
                                       color1: Color("White"),
                                       color2: Color("White.Shadow")) {
                                expression.append(".")
                            }
                        }
                    }
                    
                    VStack(spacing: spacing) {
                        ForEach(operators, id: \.self) { i in
                            ButtonView(label: "\(i)", width: side, height: side,
                                       textColor: .white,
                                       color1: Color("Orange"),
                                       color2: Color("Orange.Shadow")) {
                                expression.append("\(i)")
                            }
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
