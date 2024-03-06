//
//  ContentView.swift
//  ComponentOfBoard
//
//  Created by Dmitry Parhomenko on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double(Int.random(in: 1...255))
    @State private var userName = ""
    @State private var displayName = ""
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Color(.init(srgbRed: 0.1, green: 0.3, blue: 0.5, alpha: 1))
                .ignoresSafeArea()
            VStack(spacing: 40) {
                ImageView()
                TextSliderView(sliderValue: $sliderValue)
                TextFieldView(displayName: $displayName)
                SliderView(sliderValue: $sliderValue)
                TextField("Enter yor name", text: $userName)
                    .textFieldStyle(.roundedBorder)
                Button(action: getText) {
                    Text("Done")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                }
                .frame(minWidth: 150, minHeight: 60)
                .background(.gray)
                .clipShape(.rect(cornerRadius: 10))
                .alert("Wrong format", isPresented: $isPresented) {
                    Button("Ok") {userName = ""}
                } message: {
                    Text("Enter your name")
                }
                Spacer()
            }
            .padding(20)
        }
    }
    
    private func getText() {
        if let _ = Double(userName) {
            isPresented.toggle()
            return
        } else {
            displayName = userName
            userName = ""
        }
    }
}

#Preview {
    ContentView()
}

struct ImageView: View {
    var body: some View {
        Image(systemName: "swift")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundStyle(.tint)
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        Slider(
            value: $sliderValue,
            in: 1...255,
            step: 1
        )
    }
}

struct TextSliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        Text(lround(sliderValue).formatted())
            .frame(width: 300, height: 40)
            .font(.system(.title, design: .rounded, weight: .heavy))
            .background(.blue, in: .buttonBorder)
            .foregroundStyle(.white)
    }
}

struct TextFieldView: View {
    @Binding var displayName: String
    
    var body: some View {
        Text(displayName)
            .frame(width: 300, height: 40)
            .font(.system(.title, design: .rounded, weight: .heavy))
        
            .foregroundStyle(.white)
            .overlay(
                RoundedRectangle(
                    cornerRadius: 10
                ).stroke(.white, lineWidth: 1)
            )
    }
}
