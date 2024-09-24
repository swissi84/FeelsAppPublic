//
//  SelectMoodFactorView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 24.09.24.
//

//import SwiftUI
//import SwiftData
//
//struct SelectMoodFactorView: View {
//    @State var selectedMoodFactor: MoodFactor
//    @State var selectedMoodFactors: [MoodFactor] = [
//        MoodFactor(titel: "Finanzen"),
//        MoodFactor(titel: "Familie"),
//        MoodFactor(titel: "Gesundheit"),
//        MoodFactor(titel: "Arbeit")
//    ]
//
//    
//        var body: some View {
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(selectedMoodFactors) { factor in
//                        Button(action: {
//                            toggleSelection(factor)
//                        }) {
//                            Text(factor.titel)
//                                .font(.footnote)
//                                .padding(5)
//                                .background(selectedMoodFactors.contains(factor) ? Color.blue : Color.gray)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                        }
//                        func toggleSelection(_ factor: MoodFactor) {
//                            if selectedMoodFactors.contains(factor) {
//                                    selectedMoodFactors.remove(factor)
//                                } else {
//                                    selectedMoodFactors.insert(factor)
//                                }
//                            }
//                        
//                    }
//                }
//                .padding()
//            }
//        }
//    }


import SwiftUI

struct SelectMoodFactorView: View {
    @State private var selectedMoodFactors: Set<MoodFactor> = []
    
    @State private var moodFactors: Set<MoodFactor> = [
        MoodFactor(titel: "Finanzen"),
        MoodFactor(titel: "Familie"),
        MoodFactor(titel: "Gesundheit"),
        MoodFactor(titel: "Arbeit"),
        MoodFactor(titel: "Stess"),
        MoodFactor(titel: "Freizeit"),
        MoodFactor(titel: "Sport"),
        MoodFactor(titel: "Erfolg")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(moodFactors), id: \.id) { factor in
                    Button(action: {
                        toggleSelection(factor)
                    }) {
                        Text(factor.titel)
                            .font(.footnote)
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

#Preview {
    SelectMoodFactorView()
}
