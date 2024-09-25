//
//  HomeView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//






import SwiftUI
import SwiftData
import Charts

struct HomeView: View {
    @AppStorage("username") var username = "Andy"
    @State private var isRotated = false
    
    @Environment(\.modelContext) var context
    
    
    @State private var filteredMoodEntries: [MoodEntry] = []
    private var dateSevenDaysAgo: Date {
        Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date()
    }
    
//    @Query(sort: \MoodEntry.date, order: .reverse)
//    var moodEntries: [MoodEntry]
//    
    @Query(sort: \MoodEntry.date, order: .reverse)
    private var moodEntries: [MoodEntry]
    
    init() {
        let date =  Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date()
       
        _moodEntries = Query(filter: #Predicate<MoodEntry> { $0.date > date }   )
    }
    
    var averageMood: Double {
          let totalMood = moodEntries.reduce(0) { $0 + $1.mood }
          return moodEntries.isEmpty ? 0 : totalMood / Double(moodEntries.count)
      }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Willkommen")
                    .font(.largeTitle)
                Text(username)
                    .font(.largeTitle)
                
                Spacer()
               Text("Stimmungs Tendenz:")
                    .padding()
                    .font(.system(size: 30))
                if averageMood > 5.0 {
                    Image(systemName: "arrow.up.right.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color.green)
                } else {
                    Image(systemName: "arrow.down.backward.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color.red)
                }
               
                
                
                Spacer()
                
               Text("Stimmungen der letzten 7 Tage:")
                    .font(.title2)
                    
                Chart {
                    ForEach(moodEntries) { moodEntry in
                        BarMark(
                            x: .value("Datum", moodEntry.date, unit: .day),
                            y: .value("Mood", moodEntry.mood)
                        )
                    }
                }
                .frame(width: 300, height: 300)
                .padding(40)
            }
//            .onAppear {
//                
//                filteredMoodEntries = moodEntries.filter { $0.date > dateSevenDaysAgo }
//            }
        }
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: MoodEntry.self, configurations: configuration)
    
    let context = ModelContext(container)
    let previewMoodEntries = [
        MoodEntry(titel: "Super", mood: 9.0, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, moodPicture: "🙂", selectedWeather: "Sonnig", text: "", moodfactors: []),
        MoodEntry(titel: "Mittel", mood: 5, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, moodPicture: "😄", selectedWeather: "Wolkig", text: "", moodfactors: []),
        MoodEntry(titel: "Gut", mood: 4, date: Date(), moodPicture: "😁", selectedWeather: "Regen", text: "", moodfactors: []),
        MoodEntry(titel: "Beschissen", mood: 1, date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, moodPicture: "🙁", selectedWeather: "Sonnig", text: "", moodfactors: []),
        MoodEntry(titel: "Schlecht", mood: 2, date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, moodPicture: "😟", selectedWeather: "Wolkig", text: "", moodfactors: []),
        MoodEntry(titel: "Hervorragend", mood: 8, date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, moodPicture: "😄", selectedWeather: "Wolkig", text: "", moodfactors: []),
        MoodEntry(titel: "Naja", mood: 3, date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, moodPicture: "😐", selectedWeather: "Wolkig", text: "", moodfactors: []),
    ]
    
    previewMoodEntries.forEach { context.insert($0) }
    try? context.save()
    
    return HomeView()
        .modelContainer(container)
}

