//
//  Projekt01App.swift
//  Projekt01
//
//  Created by Florian Rhein on 20.09.24.
//

import SwiftUI

@main
struct Projekt01App: App {
    @AppStorage("darkmode") private var darkmode = false
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn = false
   
    
    var body: some Scene {
        WindowGroup {
            if isUserLoggedIn {
                TabView{
                    ContentView()
                        .preferredColorScheme(darkmode ? .dark : .light)
                    
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    
                    EntryListView()
                        .tabItem {
                            Label("Einträge", systemImage: "list.bullet.clipboard")
                        }
                    
                    
                    AddMoodEntryView()
                        .tabItem {
                            Label("Eintrag erstellen", systemImage: "square.and.pencil")
                        }
                    
                    ProfilView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                    
                }
                .modelContainer(for: [
                    MoodEntry.self,
                    ])
                
            } else {
                LoginView()
            }
        }
    }
}
