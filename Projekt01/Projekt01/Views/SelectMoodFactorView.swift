
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI
import SwiftData

struct SelectMoodFactorView: View {
    @Binding var selectedMoodFactors: Set<MoodFactor>

    @State var moodFactors: [MoodFactor] = [
        MoodFactor(titel: "Finanzen"),
        MoodFactor(titel: "Familie"),
        MoodFactor(titel: "Gesundheit"),
        MoodFactor(titel: "Arbeit"),
        MoodFactor(titel: "Stress"),
        MoodFactor(titel: "Freizeit"),
        MoodFactor(titel: "Sport"),
        MoodFactor(titel: "Erfolg")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(moodFactors) { factor in
                    Button(action: {
                        toggleSelection(factor)
                    }) {
                        Text(factor.titel)
                            .font(.footnote)
                            .bold()
                            .padding(.horizontal,14)
                            .padding(.bottom,6)
                            .padding(.top,6)
                            .background(selectedMoodFactors.contains(factor) ? Color.blue : Color.deepBrown)
                            .foregroundColor(.white)
                            .clipShape(.capsule)
                       
                    }
                }
            }
            .padding()
        }
    }

    private func toggleSelection(_ factor: MoodFactor) {
        if selectedMoodFactors.contains(factor) {
            selectedMoodFactors.remove(factor)
        } else {
            selectedMoodFactors.insert(factor)
        }
    }
}
