
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI

extension Color {
    static let deepBrown = Color(red: 0.5, green: 0.3, blue: 0.3)
  static let deepRed = Color(red: 0.8, green: 0.1, blue: 0.1)
  static let mintGreen = Color(red: 0.6, green: 0.9, blue: 0.6)
  static let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
  static let navyBlue = Color(red: 0.0, green: 0.2, blue: 0.5)
  static let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)
  static let mustardYellow = Color(red: 0.9, green: 0.7, blue: 0.2)
  static let lavenderPurple = Color(red: 0.7, green: 0.5, blue: 0.9)
  static let coralOrange = Color(red: 1.0, green: 0.5, blue: 0.3)
  static let steelGray = Color(white: 0.4745)
  static let charcoalGray = Color(red: 0.2, green: 0.2, blue: 0.2)
  static let turquoise = Color(red: 0.25, green: 0.88, blue: 0.82)
  static let pastelPink = Color(red: 1.0, green: 0.8, blue: 0.86)
  static let sandBeige = Color(red: 0.94, green: 0.87, blue: 0.73)
}
struct ColorsView: View {
  var body: some View {
    ZStack {
      Color.deepBrown
        .edgesIgnoringSafeArea(.all)
      Text("Bun venit în aplicație!")
        .font(.largeTitle)
        .foregroundColor(.charcoalGray)
    }
  }
}
#Preview {
  ColorsView()
}
