//
//  MoodFactor.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

//import Foundation
//import SwiftData
//
//@Model
//class MoodFactor : Identifiable, Hashable {
//    var id = UUID()
//    var titel : String
//   // var moodEntries : [MoodEntry] = []
//    
//    
//    init(titel: String) {
//        
//        self.titel = titel
//    }
//    func hash(into hasher: inout Hasher) {
//         hasher.combine(id)
//     }
//
//    
//     static func == (lhs: MoodFactor, rhs: MoodFactor) -> Bool {
//         return lhs.id == rhs.id
//     }
// }
//    

import SwiftUI

class MoodFactor: Identifiable, Hashable {
    let id = UUID() // Eindeutige ID für Identifizierbarkeit
    var titel: String
    
    init(titel: String) {
        self.titel = titel
    }
    
    // Implementiere die Hashable-Anforderung
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // Implementiere die Gleichheitsprüfung
    static func == (lhs: MoodFactor, rhs: MoodFactor) -> Bool {
        return lhs.id == rhs.id
    }
}
