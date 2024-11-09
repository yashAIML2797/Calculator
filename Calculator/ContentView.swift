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
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    Spacer()
                    Text(expression)
                        .font(.system(size: 30, weight: .bold))
                }
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 4), alignment: .leading, spacing: 0) {
                    ForEach(buttons, id: \.self) { i in
                        Text("\(i)")
                            .frame(width: geometry.size.width / (i == "0" ? 2 : 4),
                                   height: geometry.size.width / 4)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                expression.append(i)
                            }
                            .border(i == "" ? .clear : .red)
                    }
                    
                    GridRow {
                        HStack(spacing: 0) {
                            Text("0")
                                .frame(width: geometry.size.width / 2,
                                       height: geometry.size.width / 4)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    expression.append("0")
                                }
                                .border(.red)
                            Text(".")
                                .frame(width: geometry.size.width / 4,
                                       height: geometry.size.width / 4)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    expression.append(".")
                                }
                                .border(.red)
                            Text("=")
                                .frame(width: geometry.size.width / 4,
                                       height: geometry.size.width / 4)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    expression.append("=")
                                }
                                .border(.red)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
