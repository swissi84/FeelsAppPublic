//
//  addMoodView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import SwiftUI
import SwiftData

struct AddMoodEntryView: View {
    @Environment(\.modelContext) var context
    
    @State private var title: String = ""
    @State private var mood: Double = 0.5
    @State private var reasonForGratitude: String = ""
    @State private var text: String = ""
    @State private var factor: String = ""
    
    @State private var selectedEmoji: String = "😎"
    let emojis: [String] = ["😃", "😡", "🥶"]
    
    
    var username: String = "Default User"
    
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Wie geht es dir heute?")
                TextField("Ein Wort für Deine Stimmung", text: $title)
                    .padding()
                HStack {
                    Text("Schlimm")
                    Spacer()
                    Text("Super")
                }
                Slider(value: $mood, in: 0...1,
                       label: { Text("Stimmung") },
                       minimumValueLabel: {
                    VStack {
                        Text("😟")
                            .font(.largeTitle)
                    }
                },
                       maximumValueLabel: {
                    VStack {
                        Text("😁")
                            .font(.largeTitle)
                    }
                })
                VStack {
                    Spacer()
                    Text("Stimmung: \(String(format: "%.1f", mood))")
                    Spacer()
                    
                    Divider()
                        .padding()
                    Text("Stimmungs Faktoren:")
                    SelectMoodFactorView()
                    HStack{
                        
                        Picker("Wähle ein Emoji",selection: $selectedEmoji) {
                            ForEach(emojis, id: \.self ) { emoji in
                                Text(emoji).tag(emoji)
                                    .pickerStyle(SegmentedPickerStyle())
                                    .font(.largeTitle)
                            }
                        }
                        Spacer()
                        Text("\(selectedEmoji)")
                            .font(.largeTitle)
                    }
                }
                
                VStack{
                    
                    Text("Wetter Faktoren:")
                    SelectWeatherView()
                    
                    
                    VStack {
                        Text("Für was bist du gerade Dankbar?")
                        TextEditor(text: $text)
                            .frame(height: 50)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                            .padding()
                        Spacer()
                    }
                    Spacer()
                }
                
                
                Button("Speichern", systemImage: "square.and.arrow.down") {
                    let newEntry = MoodEntry(
                                id: UUID(),
                                titel: title,
                                mood: mood,
                                date: Date(),
                                moodPicture: selectedEmoji
                                )
                            
                    context.insert(newEntry)
                            
                        
                           
                        }
                
            }
            .padding(40)
            .navigationTitle("Feels")
            .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
        
    }
}

#Preview {
    AddMoodEntryView()
}














