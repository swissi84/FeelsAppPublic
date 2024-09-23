//
//  MoodEntry.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import Foundation
import SwiftData

@Model
class MoodEntry: Identifiable {
    let id: UUID
    var titel: String
    var mood: Double
    var date: Date
    var moodPicture: String = ""
    
    @Relationship(deleteRule: .cascade, inverse: \User.moodEntries)
    var moodEntries: [MoodEntry]
    
    @Relationship(deleteRule: .cascade, inverse: \MoodEntry.moodEntries)
    var moodfactor: [MoodEntry]
    
    init(id: UUID, titel: String, mood: Double, date: Date, moodPicture: String, moodEntries: [MoodEntry], moodfactor: [MoodEntry]) {
        self.id = id
        self.titel = titel
        self.mood = mood
        self.date = date
        self.moodPicture = moodPicture
        self.moodEntries = moodEntries
        self.moodfactor = moodfactor
    }
    
}



