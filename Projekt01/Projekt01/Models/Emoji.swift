//
//  Emoji.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 25.09.24.
//

import Foundation
import SwiftUI
import SwiftData

enum Emoji: String {
        case verySad = "😭"
        case sad = "😢"
        case neutral = "😐"
        case happy = "😃"
        case veryHappy = "😂"
        
        static func emoji(for mood: Double) -> Emoji {
            switch mood {
            case 1.0...2.0:
                return .verySad
            case 2.1...4.0:
                return .sad
            case 4.1...6.0:
                return .neutral
            case 6.1...8.0:
                return .happy
            case 8.1...10.0:
                return .veryHappy
            default:
                return .neutral
            }
        }
    }


