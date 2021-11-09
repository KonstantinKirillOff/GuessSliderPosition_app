//
//  ButtonView.swift
//  GuessSliderPosition_app
//
//  Created by Константин Кириллов on 09.11.2021.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16))
                .bold()


        }
        .frame(width: 150, height: 40)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Проверь меня!", action: {})
    }
}
