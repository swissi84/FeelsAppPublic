
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI
import SwiftData

struct MoodEntryView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \MoodEntry.date, order: .reverse) var moodEntries: [MoodEntry]

    var body: some View {
        List {
            ForEach(moodEntries) { moodEntry in
                NavigationLink(destination: EntryDetailView(moodEntry: moodEntry)) {
                    ZStack {
                        backgroundColor(for: moodEntry.moodPicture)
                            .frame(height: 70)
                            .cornerRadius(10)
                            .shadow(radius: 10, x: 5, y: 5)

                        HStack {

                            VStack(alignment: .leading) {
                                Text(moodEntry.titel)
                                    .font(.headline)
                                Spacer()
                                Text("Datum \(moodEntry.date.formatted(.dateTime.year().month().day()))")
                                    .font(.footnote)
                            }

                            Spacer()

                            VStack {
                                Text(moodEntry.moodPicture)
                                    .font(.largeTitle)
                            }
                        }

                        .padding()

                        .foregroundStyle(Color.white)
                    }
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        context.delete(moodEntry)
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Stimmungs-Einträge")
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
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: MoodEntry.self, configurations: configuration)

    let context = ModelContext(container)
    let previewMoodEntries = [
        MoodEntry(titel: "Super", mood: 9.0, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, moodPicture: "😭", selectedWeather: "Sonnig", text: "", moodfactors: []),
        MoodEntry(titel: "Mittel", mood: 5, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, moodPicture: "😂", selectedWeather: "Wolkig", text: "", moodfactors: []),
        MoodEntry(titel: "Gut", mood: 4, date: Date(), moodPicture: "😃", selectedWeather: "Regen", text: "", moodfactors: []),
        MoodEntry(titel: "Beschissen", mood: 1, date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, moodPicture: "😢", selectedWeather: "Sonnig", text: "", moodfactors: []),
        MoodEntry(titel: "Schlecht", mood: 2, date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, moodPicture: "😢", selectedWeather: "Wolkig", text: "", moodfactors: []),
        MoodEntry(titel: "Hervorragend", mood: 8, date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, moodPicture: "😃", selectedWeather: "Wolkig", text: "", moodfactors: []),
        MoodEntry(titel: "Naja", mood: 3, date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, moodPicture: "😐", selectedWeather: "Wolkig", text: "", moodfactors: []),
    ]

    previewMoodEntries.forEach { context.insert($0) }
    try? context.save()

    return MoodEntryView()
        .modelContainer(container)
}

