//
//  MoodEntryView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 24.09.24.
//

import SwiftUI
import SwiftData


struct MoodEntryView: View {
    @Environment(\.modelContext) var context
    @Query var moodEntries: [MoodEntry]
    
    
    
    var body: some View {
        NavigationLink(destination: EntryDetailView(), label: {
            if !moodEntries.isEmpty {
                List{
                    ForEach (moodEntries) { moodEntry in
                        HStack{
                            VStack{
                                HStack{
                                    Text("Datum \(moodEntry.date.formatted(.dateTime.year().month().day()))")
                                   
                                    Text("\(String(format: "%.2f", moodEntry.mood))")
                                    
                                }
                            }
                            Spacer()
                            Text("\(moodEntry.moodPicture)")
                        }
                    }
                    .cornerRadius(10)
                }
            } else {
                Text("kein Eintrag vorhanden")
            }
         
          }
  )  }
}



