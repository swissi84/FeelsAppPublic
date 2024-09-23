//
//  addMoodView.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import SwiftUI
import SwiftData

struct addMoodView: View {
    @State private var titel: String = ""
    
    
    
    var body: some View {
        VStack{
            Form{
                TextField("titel", text: $titel)
                
                
            }
        }
    }
}
    
    
    #Preview {
    ContentView()
}
