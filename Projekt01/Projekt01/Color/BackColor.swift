
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI
import Foundation
import SwiftData

struct BackColor {

    static let backgroundColor4 = Color.orange.opacity(0.2)

   static let backgroundColor = LinearGradient(gradient: Gradient(colors: [Color.cyan,Color.purple]),startPoint: .topLeading,endPoint: .bottomTrailing)
   static let backgroundColor2 = LinearGradient(gradient: Gradient(colors: [Color.pastelPink,Color.orange]),startPoint: .topLeading,endPoint: .bottomTrailing)
    static let backgroundColor3 = LinearGradient(gradient: Gradient(colors: [Color.lavenderPurple,Color.indigo]),startPoint: .topLeading,endPoint: .bottomTrailing)
   static let backgroundColor5 = LinearGradient(gradient: Gradient(colors: [Color.lavenderPurple.opacity(0.3),Color.lemonYellow.opacity(0.4)]),startPoint: .topLeading,endPoint: .bottomTrailing)
}
