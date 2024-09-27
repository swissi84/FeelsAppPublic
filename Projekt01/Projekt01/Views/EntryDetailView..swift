//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI
import SwiftData

struct EntryDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    var moodEntry: MoodEntry
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text(moodEntry.titel)
                        .font(.largeTitle)
                        .padding()
                    
                    HStack {
                        ForEach(moodEntry.moodfactors.prefix(3), id: \.self) { factor in
                            Text(factor.titel)
                                .padding(10)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(1)
                        }
                    }
                    
                    
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
                    VStack{
                        
                        Text(moodEntry.text)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                        
                    }
                    .padding(.vertical, 50)
                   
                VStack {
                        ZStack{
                            backgroundColor(for: moodEntry.moodPicture)
                                .frame(width: 100, height: 50)
                            
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black,lineWidth: 0.5)
                                )
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)
                            ZStack{
                                Text(moodEntry.moodPicture)
                                    .font(.largeTitle)
                                   
                            }
                            .padding()
                        }
                        
//                    Text("Stimmung: \(String(format: "%.0f", moodEntry.mood))")
//                            .font(.headline)
                            
                    }
                   
                    .padding(.vertical, 20)
                    
                    VStack{
                        
                        Text("Datum: \(moodEntry.date.formatted(.dateTime.year().month().day()))")
                            .padding(.vertical, 20)
                       
                        Button(role: .destructive) {
                            context.delete(moodEntry)
                                dismiss()
                            
                        } label: {
                            Label("Löschen", systemImage: "trash")
                                .frame(width: 100, height: 10)
                                .padding()
                                .foregroundStyle(Color.white)
                                .background(Color.red)
                                .cornerRadius(10)
                                .shadow(radius: 10, x: 5, y: 5)
                        }
                    }
                }
                
                .padding()
            }
        }
            .navigationTitle("Detailansicht")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func backgroundColor(for moodPicture: String) -> Color {
        switch moodPicture {
        case "😭":
            return Color.red
        case "😂":
            return Color.green
        case "😃":
            return Color.mint
        case "😢":
            return Color.orange
        case "😐":
            return Color.yellow
        default:
            return Color.gray
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

