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
    var id: UUID
    var titel: String
    var mood: Double
    var date: Date
    var moodPicture: String = ""
    
    @Relationship(deleteRule: .nullify, inverse: \User.moodEntries)
    var users: [User] = []
    
    @Relationship(deleteRule: .nullify, inverse: \MoodFactor.moodEntries)
    var moodfactors: [MoodFactor] = []
    
    init(id: UUID, titel: String, mood: Double, date: Date, moodPicture: String, users: [User], moodfactors: [MoodFactor]) {
        self.id = id
        self.titel = titel
        self.mood = mood
        self.date = date
        self.moodPicture = moodPicture
        self.users = users
        self.moodfactors = moodfactors
    }
    
}



