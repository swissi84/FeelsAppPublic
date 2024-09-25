//
//  SelectMoodFactorView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 24.09.24.
//
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
                            .font(.subheadline)
                            .bold()
                            .padding(5)
                            .background(selectedMoodFactors.contains(factor) ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
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
