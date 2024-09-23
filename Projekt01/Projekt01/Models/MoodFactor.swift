//
//  MoodFactor.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import Foundation
import SwiftData

@Model
class MoodFactor : Identifiable {
    var id = UUID()
    var titel : String
    var moodEntries : [MoodEntry] = []
    
    
    init(id: UUID = UUID(), titel: String) {
        self.id = id
        self.titel = titel
    }
}
