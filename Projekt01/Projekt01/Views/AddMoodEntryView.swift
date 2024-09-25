////
////  addMoodView.swift
////  Projekt01
////
////  Created by Eggenschwiler Andre on 23.09.24.
import SwiftUI
import SwiftData

struct AddMoodEntryView: View {
    @Environment(\.modelContext) var context
    @State private var isAnimating = false
    @State private var title: String = ""
    @State private var mood: Double = 0.5
    @State var text: String = ""
    @State var selectedWeather: Set<Weather> = []
    @State var selectedMoodFactors: Set<MoodFactor> = []
    @State var selectedDate: Date = Date()
    
    @State private var selectedEmoji: Set<String> = []
    @State private var emojis: [String] = ["😭", "😢", "😐", "😃", "😂"]
   
    @Query(sort: \MoodEntry.mood, order: .reverse)
    var moodEntries: [MoodEntry]
    
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
                    Button("Speichern") {
                        let weatherString = selectedWeather.map { $0.rawValue }.joined(separator: ", ")
                        
                        let moodFactorsArray = Array(selectedMoodFactors)
                        
                        let newEntry = MoodEntry(
                            titel: title,
                            mood: mood,
                            date: selectedDate,
                            moodPicture: Array(selectedEmoji).joined(separator: ""),
                            selectedWeather: weatherString,
                            text: text,
                            moodfactors: moodFactorsArray
                        )
                        
                        context.insert(newEntry)
                        resetForm()
                    }
                }
                .foregroundStyle(Color.white)
                .frame(width: 120, height: 15)
                .bold()
                .padding()
                .background(Color.red)
                .cornerRadius(10)
                .navigationTitle("Feels")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding()
                }
            .padding()
            Spacer()
        }
    }
    
    func toggleSelection(_ emoji: String) {
        if selectedEmoji.contains(emoji) {
            selectedEmoji.remove(emoji)
        } else {
            selectedEmoji.insert(emoji)
        }
    }
    
    func resetForm() {
        title = ""
        mood = 5.0
        selectedEmoji = []
        text = ""
        selectedWeather.removeAll()
        selectedMoodFactors.removeAll()
    }
}

#Preview {
    AddMoodEntryView()
}
