
//  Created by Eggenschwiler Andre on 25.09.24.

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
            Spacer()
            ZStack{
                BackColor.backgroundColor4.ignoresSafeArea()

                VStack {
                    Spacer()
                    Text("")
                    Text("Wie geht es dir heute?")
                        .font(.title)
                        .fontWeight(.light)

                    VStack{
                        TextField("", text: $title)
                            .padding(10)
                            .background(Color.white.opacity(0.6))
                            .cornerRadius(16)
                            .frame(width:340)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black,lineWidth: 0.5)
                            )
                    }
                    Divider()
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
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black,lineWidth: 0.5)
                                )
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)

                        case let mood where mood <= 4.0:
                            Text("😢")
                                .font(.largeTitle)
                                .frame(width: 100, height: 50)
                                .background(Color.orange)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black,lineWidth: 0.5)
                                )
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)
                        case let mood where mood <= 6.0:
                            Text("😐")
                                .font(.largeTitle)
                                .frame(width: 100, height: 50)
                                .background(Color.yellow)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black,lineWidth: 0.5)
                                )
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)

                        case let mood where mood <= 8.0:
                            Text("😃")
                                .font(.largeTitle)
                                .frame(width: 100, height: 50)
                                .background(Color.mint)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black,lineWidth: 0.5)
                                )
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)

                        case let mood where mood <= 10.0:
                            Text("😂")
                                .font(.largeTitle)
                                .frame(width: 100, height: 50)
                                .background(Color.green)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black,lineWidth: 0.5)
                                )
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)
                        default:
                            Text("😐")
                                .font(.headline)
                                .frame(width: 50, height: 50)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black,lineWidth: 0.5)
                                )
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)
                        }

                        Text("Stimmungs und Wetterfaktoren:")
                            .padding(.vertical, 20)
                        SelectMoodFactorView(selectedMoodFactors: $selectedMoodFactors)
                            .padding(.vertical, -20)
                        SelectWeatherView(selectedWeather: $selectedWeather)

                        Text("Für was bist du gerade dankbar?")
                        ZStack{
                            TextField("Title", text: $text, axis: .vertical)
                                .lineLimit(3...7)
                                .padding()
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(16)

                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.black,lineWidth: 0.5)
                                )
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

                            .font(.title3)
                            .foregroundStyle(.white)
                            .frame(width: 130, height: 42, alignment: .center)
                            .background(.red)
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)
                            Spacer(minLength:30)

                        } else {
                            Text("Speichern")
                                .font(.title3)
                                .foregroundStyle(.black)
                                .frame(width: 130, height: 42, alignment: .center)
                                .background(.white)
                                .cornerRadius(16)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 6)
                            Spacer(minLength:30)
                        }
                    }
                    .alert(isPresented: $alert) {
                        Alert(
                            title: Text("Eintrag Gespeichert"),
                            dismissButton: .default(Text("OK")))
                    }

                    .padding()
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                }

                .padding()
                Spacer()
            }
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
