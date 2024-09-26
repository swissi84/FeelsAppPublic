
//  Created by Eggenschwiler Andre on 25.09.24.

import Foundation
import SwiftData

@Model
class MoodEntry: Identifiable {
    var id: UUID = UUID()
    var titel: String
    var mood: Double
    var date: Date
    var moodPicture: String
    var selectedWeather: String
    var text: String

    @Relationship(deleteRule: .nullify, inverse: \MoodFactor.moodFactors)
    var moodfactors: [MoodFactor]

    init(titel: String, mood: Double, date: Date, moodPicture: String, selectedWeather: String, text: String, moodfactors: [MoodFactor]) {
        self.titel = titel
        self.mood = mood
        self.date = date
        self.moodPicture = moodPicture
        self.selectedWeather = selectedWeather
        self.text = text
        self.moodfactors = moodfactors
    }

}



