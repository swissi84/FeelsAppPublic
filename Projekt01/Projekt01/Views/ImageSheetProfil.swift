//
//  ImageSheetProfil.swift
//  Projekt01
//
//  Created by Eggenschwiler Andre on 23.09.24.
//

import SwiftUI

struct ImageSheetProfil: View {
    @Binding var selectedImage: String
    @Binding var showImageSheet : Bool
    
    let availableImages = ["profil", "image1", "image2", "image3", "image4", "image5", "image6", "image7"] // Verfügbare Bilder
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            Image(selectedImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(180)
           
            Text("Wähle ein Bild aus")
                .font(.headline)
                .padding()
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(availableImages, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(180)
                                .onTapGesture {
                                    selectedImage = image
                                }
                        }
                    }
                    .padding()
                    
                }
                
                Button("Fertig") {
                    showImageSheet = false
                }
                .padding()
            }
            .padding()
        }
    }




