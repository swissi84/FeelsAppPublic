
//  Created by Eggenschwiler Andre on 25.09.24.

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
                            .font(.footnote)
                            .bold()
                            .padding(.horizontal,14)
                            .padding(.bottom,6)
                            .padding(.top,6)
                            .background(selectedWeather.contains(weather) ? Color.blue : Color.navyBlue)
                            .foregroundColor(.white)
                            .clipShape(.capsule)

                    }
                }
            }
            .padding()
        }
    }

    private func toggleSelection(_ weather: Weather) {
        if selectedWeather.contains(weather) {
            selectedWeather.remove(weather)
        } else if selectedWeather.count < 3 {
            selectedWeather.insert(weather)
        }
    }
}





#Preview {
    @Previewable @State var selectedWeather: Set<Weather> = []
    SelectWeatherView(selectedWeather: $selectedWeather)
}
