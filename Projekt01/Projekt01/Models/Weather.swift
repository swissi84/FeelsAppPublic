//
//  enum.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import Foundation
import SwiftData

enum Weather: String, CaseIterable, Identifiable, Hashable {
    case sunny = "☀️ Sonnig"
    case rainy = "🌧 Regen"
    case cloudy = "☁️ Wolkig"
    case cold = "🥶 Kalt"
    case snow = "❄️ Schnee"
    case windy = "🌬 Windig"
    case hot = "🥵 Heiss"
   
    var id: String { self.rawValue }
    
}

