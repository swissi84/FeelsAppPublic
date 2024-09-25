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
    @Query(sort: \MoodEntry.date, order: .reverse) var moodEntries: [MoodEntry]
    
    var body: some View {
        if !moodEntries.isEmpty {
            List {
                ForEach(moodEntries) { moodEntry in
                    NavigationLink(destination: EntryDetailView(moodEntry: moodEntry)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(moodEntry.titel)")
                                    .font(.headline)
                                Spacer()
                                Text("Datum \(moodEntry.date.formatted(.dateTime.year().month().day()))")
                                    .font(.footnote)
                                
                            }
                            Spacer()
                            VStack{
                                Text("\(moodEntry.moodPicture)")
                                    .font(.largeTitle)
                                Spacer()
                                Text("Stimmung: \(String(format: "%.0f", moodEntry.mood))")
                                
                            }
                            .swipeActions(edge: .trailing) {
                                Button(
                                    role: .destructive,
                                    action: {
                                        context.delete(moodEntry)
                                    },
                                    label:  {
                                        Label("delete", systemImage: "trash")
                                    }
                                )
                            }
                            
                            
                        }
                        .padding(8)
                    }
                }
                
            }
        } else {
            Text("Kein Eintrag vorhanden")
        }
    }
}




