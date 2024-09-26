
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI
import SwiftData

@Model
class MoodFactor: Identifiable, Hashable {
    var id: UUID = UUID()
    var titel: String

    var moodFactors: [MoodEntry] = []

    init(titel: String) {
        self.titel = titel

    }


    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


    static func == (lhs: MoodFactor, rhs: MoodFactor) -> Bool {
        return lhs.id == rhs.id
    }
}















