//
//  enum.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import Foundation


enum Weather: String, CaseIterable, Identifiable {
    case sunny = "Sonnig"
    case rainy = "Regnerisch"
    case cloudy = "Bewölkt"
    case cold = "Kalt"
    case snow = "Schnee"
    case stormy = "Stürmisch"
    case hot = "Heiss"
    
    var id: String { self.rawValue }
}

