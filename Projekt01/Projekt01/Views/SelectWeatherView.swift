//
//  MultiSelectWeatherView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 24.09.24.
//
import SwiftUI

struct SelectWeatherView: View {
    @Binding var selectedWeather: Set<Weather>

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Weather.allCases) { weather in
                    Button(action: {
                        toggleSelection(weather)
                    }) {
                        Text(weather.rawValue)
                            .font(.subheadline)
                            .bold()
                            .padding(5)
                            .background(selectedWeather.contains(weather) ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
    
    private func toggleSelection(_ weather: Weather) {
        if selectedWeather.contains(weather) {
            selectedWeather.remove(weather)
        } else {
            selectedWeather.insert(weather)
        }
    }
}

#Preview {
    @Previewable @State var selectedWeather: Set<Weather> = []
    SelectWeatherView(selectedWeather: $selectedWeather)
}
