////
////  addMoodView.swift
////  Projekt01
////
////  Created by Eggenschwiler Andre on 23.09.24.
import Foundation
import SwiftUI
import SwiftData

struct AddMoodEntryView: View {
    @State private var alert:Bool = false
    @State private var title: String = ""
    @State private var mood: Double = 5.0
    @State var text: String = ""
    @State var selectedWeather: Set<Weather> = []
    @State var selectedMoodFactors: Set<MoodFactor> = []
    @State var selectedDate: Date = Date()
    
    
    @Environment(\.modelContext) var context
    
    @Query(sort: \MoodEntry.mood, order: .reverse)
    var moodEntries: [MoodEntry]
    
    var selectedEmoji: String {
         return Emoji.emoji(for: mood).rawValue
     }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Wie geht es dir heute?")
                    .font(.headline)
                
                TextField("Ein Wort für Deine Stimmung", text: $title)
                    .padding(5)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Text("Schlimm")
                    Spacer()
                    Text("Super")
                }
                
                Slider(value: $mood, in: 1...10, label: { Text("Stimmung") },
                       minimumValueLabel: { Text("😟").font(.largeTitle) },
                       maximumValueLabel: { Text("😁").font(.largeTitle) })
                
                VStack {
                    
                    switch mood {
                    case let mood where mood <= 2.0:
                        Text("😭")
                            .font(.largeTitle)
                            .frame(width: 100, height: 50)
                            .background(Color.red)
                            .cornerRadius(10)
                        
                        
                    case let mood where mood <= 4.0:
                        Text("😢")
                            .font(.largeTitle)
                            .frame(width: 100, height: 50)
                            .background(Color.orange)
                            .cornerRadius(10)
                        
                        
                    case let mood where mood <= 6.0:
                        Text("😐")
                            .font(.largeTitle)
                            .frame(width: 100, height: 50)
                            .background(Color.yellow)
                            .cornerRadius(10)
                        
                        
                    case let mood where mood <= 8.0:
                        Text("😃")
                            .font(.largeTitle)
                            .frame(width: 100, height: 50)
                            .background(Color.mint)
                            .cornerRadius(10)
                        
                        
                    case let mood where mood <= 10.0:
                        Text("😂")
                            .font(.largeTitle)
                            .frame(width: 100, height: 50)
                            .background(Color.green)
                            .cornerRadius(10)
                        
                        
                    default:
                        Text("😐")
                            .font(.headline)
                            .frame(width: 50, height: 50)
                        
                    }
                    
                    
                    Text("Stimmungs- und Wetterfaktoren:")
                        .padding(.vertical, 5)
                    SelectMoodFactorView(selectedMoodFactors: $selectedMoodFactors)
                        .padding(.vertical, -20)
                    SelectWeatherView(selectedWeather: $selectedWeather)
                    
                    VStack {
                        Text("Für was bist du gerade dankbar?")
                        TextEditor(text: $text)
                            .frame(height: 50)
                            .padding(1)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(5)
                            .padding()
                    }
                }
                
                DatePicker(selection: $selectedDate, label: { Text("Datum") })
                
                
                
                VStack{
                    if !title.isEmpty && !text.isEmpty {
                        Button("Speichern") {
                            alert = true
                            let weatherString = selectedWeather.map { $0.rawValue }.joined(separator: ", ")
                            
                            let moodFactorsArray = Array(selectedMoodFactors)
                            
                            let newEntry = MoodEntry(
                                titel: title,
                                mood: mood,
                                date: selectedDate,
                                moodPicture: selectedEmoji,
                                selectedWeather: weatherString,
                                text: text,
                                moodfactors: moodFactorsArray
                            )
                            
                            context.insert(newEntry)
                            resetForm()
                        }
                        
                        .foregroundStyle(Color.white)
                        .frame(width: 120, height: 15)
                        .bold()
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding()
                        
                    } else {
                        Text("Speichern")
                            .foregroundStyle(Color.white)
                            .frame(width: 120, height: 15)
                            .bold()
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                            .padding()
                    }
                }
                .alert(isPresented: $alert) {
                    Alert(
                        title: Text("Eintrag Gespeichert"),
                        dismissButton: .default(Text("OK")))
                }
                
                .padding()
                
                .navigationTitle("Feels")
                .navigationBarTitleDisplayMode(.inline)
            }
            .padding()
            Spacer()
            
        }
    }

    
    func resetForm() {
        title = ""
        mood = 5.0
        text = ""
        selectedWeather.removeAll()
        selectedMoodFactors.removeAll()
    }
}

#Preview {
    AddMoodEntryView()
}
