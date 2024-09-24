//
//  addMoodView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import SwiftUI
import SwiftData

struct AddMoodEntryView: View {
    @State private var title: String = ""
    @State private var mood: Double = 0.5
    @State private var reasonForGratitude: String = ""
    @State private var text: String = ""
    @State private var factor: String = ""
    
    @State private var selectedEmoji: String = "😎"
    let emojis: [String] = ["😃", "😡", "🥶"]
   
    var body: some View {
        VStack() {
            List{
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
                HStack {
                    Spacer()
                    Text("Stimmung: \(String(format: "%.1f", mood))")
                    Spacer()
                    
                }
                Text("Stimmungs Faktor")
                TextField("Stimmungs Faktor", text: $factor)
                
                Picker("Wähle ein Emoji",selection: $selectedEmoji) {
                    ForEach(emojis, id: \.self ) { emoji in
                        Text(emoji).tag(emoji)
                    }
                   
                    .pickerStyle(WheelPickerStyle())
                    Text("\(selectedEmoji)")
                }
                
                VStack{
                    Text("Wähle deine Wetter Faktoren:")
                    
                    SelectWeatherView()
                    
                    VStack {
                        Text("Für was bist du gerade Dankbar?")
                        TextEditor(text: $text)
                            .frame(height: 100)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                            .padding()
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
            Button("Speichern", systemImage: "square.and.arrow.down") {
            
            
        }
    }
}
#Preview {
AddMoodEntryView()
}














