//
//  SliderView.swift
//  GuessSliderPosition_app
//
//  Created by Константин Кириллов on 09.11.2021.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var sliderValue: Float
    let alphaValue: Float
    let sliderColor = UIColor(.red)
    
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.thumbTintColor = sliderColor.withAlphaComponent(CGFloat(alphaValue))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue)
    }
    
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Float

        init(value: Binding<Float>) {
            self._value = value
        }

        @objc func didChangeSlider(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(60), alphaValue: 0.6)
    }
}
