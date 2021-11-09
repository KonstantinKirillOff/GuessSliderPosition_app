//
//  ContentView.swift
//  GuessSliderPosition_app
//
//  Created by Константин Кириллов on 09.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var randomValue  = Double.random(in: 0...100)
    
    var body: some View {
        VStack {
            TextView(textValue: "\(lround(randomValue))")
            ButtonView(title: "Начать заново") {
                randomValue = Double.random(in: 0...100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
