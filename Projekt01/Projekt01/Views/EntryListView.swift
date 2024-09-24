//
//  EntryListView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 24.09.24.
//

import SwiftUI

struct EntryListView: View {
    
    
    var body: some View {
        NavigationStack{
            VStack{
            MoodEntryView()
                
            }
        }
            .navigationTitle("Einträge")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    EntryListView()
}
