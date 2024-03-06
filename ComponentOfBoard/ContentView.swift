//
//  ContentView.swift
//  ComponentOfBoard
//
//  Created by Dmitry Parhomenko on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = 100.0
    @State private var userName = ""
    
    
    var body: some View {
        ZStack {
            Color(.init(srgbRed: 0.1, green: 0.3, blue: 0.5, alpha: 1))
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Image(systemName: "swift")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.tint)
                
                Text(sliderValue.formatted())
                    .frame(width: 150, height: 40)
                    .background(.blue, in: .buttonBorder)
                    .foregroundStyle(.white)
                    .font(.system(.title, design: .rounded, weight: .heavy))
                Text("№1")
                    .frame(width: 150, height: 40)
                    .font(.system(.title, design: .rounded, weight: .heavy))
                    .foregroundStyle(.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 1))
                Slider(
                    value: $sliderValue,
                    in: 1...255,
                    step: 1
                )
                TextField("Enter yor name", text: $userName)
                    .textFieldStyle(.roundedBorder)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Done")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                }
                .frame(minWidth: 150, minHeight: 60)
                .background(.gray)
                .clipShape(.rect(cornerRadius: 10))
                
                Spacer()
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
