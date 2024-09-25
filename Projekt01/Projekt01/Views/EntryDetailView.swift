//
//  EntryDetailView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 24.09.24.
//

import SwiftUI
import SwiftData

struct EntryDetailView: View {
    var moodEntry: MoodEntry
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack() {
                    Text(moodEntry.titel)
                        .font(.largeTitle)
                        .padding()
                    
                    HStack {
                        ForEach(moodEntry.moodfactors) { factor in
                            Text(factor.titel)
                                .padding(10)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(1)
                        }
                    }
                    .padding(.bottom)
                    
                    HStack {
                        ForEach(Weather.allCases) { weather in
                            if moodEntry.selectedWeather.contains(weather.rawValue) {
                                Text(weather.rawValue)
                                    .padding(10)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .padding(1)
                                    .padding(.vertical, 2)
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    Text(moodEntry.moodPicture)
                        .font(.system(size: 50))
                        .padding()
                    
                    Text("Stimmung: \(String(format: "%.0f", moodEntry.mood))")
                        .font(.headline)
                        .padding()
                    
                    if !moodEntry.text.isEmpty {
                        Text(moodEntry.text)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .padding(.bottom)
                    }
                    
                    Spacer()
                    
                    Text("Datum: \(moodEntry.date.formatted(.dateTime.year().month().day()))")
                        .padding()
                }
                .padding()
            }
            .navigationTitle("Detailansicht")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    EntryDetailView(
        moodEntry: MoodEntry(
            titel: "Test Stimmung",
            mood: 5.0,
            date: Date(),
            moodPicture: "😄",
            selectedWeather: "☀️ Sonnig",
            text: "Ich bin dankbar für einen schönen Tag.",
            moodfactors: [MoodFactor(titel: "Arbeit"), MoodFactor(titel: "Gesundheit")]
        )
    )
}



    
