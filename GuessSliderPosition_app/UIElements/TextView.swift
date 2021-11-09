//
//  TextView.swift
//  GuessSliderPosition_app
//
//  Created by Константин Кириллов on 09.11.2021.
//

import SwiftUI

struct TextView: View {
    let textValue: String
    
    var body: some View {
        Text("Подвиньте слайдер, как можно ближе к: \(textValue)")
            .font(.system(size: 16))
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(textValue: "40")
            .previewDevice("iPhone 11")
    }
}
