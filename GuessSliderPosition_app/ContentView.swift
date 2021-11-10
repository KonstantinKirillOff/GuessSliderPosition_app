//
//  ContentView.swift
//  GuessSliderPosition_app
//
//  Created by Константин Кириллов on 09.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Float.random(in: 0...100)
    @State private var alphaValue = Float.random(in: 0...1)
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            TextView(textValue: "\(targetValue)")
            HStack() {
                Text("\(0)")
                SliderView(sliderValue: $sliderValue, alphaValue: alphaValue)
                    .onChange(of: sliderValue) { newValue in
                        alphaValue = Float(computeScore())/Float(100)
                    }
                    .onAppear {
                        alphaValue = Float(computeScore())/Float(100)
                    }
                Text("\(100)")
            }
            .padding()
            
            ButtonView(title: "Проверь меня!") { showAlert.toggle() }
            .alert("Your result", isPresented: $showAlert, actions: {}) {
                    Text("\(lrintf(sliderValue))")
            }

            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 0...100)
                sliderValue = Float.random(in: 0...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lrintf(sliderValue))
        return 100 - difference
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
