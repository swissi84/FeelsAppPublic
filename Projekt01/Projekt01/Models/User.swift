//
//  User.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    var id: UUID
    var username: String
    var email: String
    var birthday: Date
    var location: String
    var darkMode: Bool
    var profilImage: String
    var moodEntries: [MoodEntry] = []
    
    
    init(id: UUID, username: String, email: String, birthday: Date, location: String, darkMode: Bool, profilImage: String, moodEntries: [MoodEntry]) {
        self.id = id
        self.username = username
        self.email = email
        self.birthday = birthday
        self.location = location
        self.darkMode = darkMode
        self.profilImage = profilImage
        self.moodEntries = moodEntries
    }
    
    
    
}
