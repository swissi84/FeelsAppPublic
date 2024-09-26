
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI

struct ImageSheetProfil: View {
    @Binding var selectedImage: String
    @Binding var showImageSheet : Bool

    let availableImages = ["Cat", "Dog", "Student", "Man", "Cowboy", "Girl", "Weird", "Turtle", "Weird2"]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            Image(selectedImage)
                .resizable()

                .frame(width: 85, height: 85)
                .cornerRadius(180)

            Text("Wähle ein Bild aus")
                .font(.headline)
                .padding()

            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(availableImages, id: \.self) { image in
                        Image(image)
                            .resizable()

                            .frame(width: 85, height: 85)
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
            .font(.footnote)
            .foregroundColor(.white)
            .bold()
            .padding(.horizontal,14)
            .padding(.bottom,6)
            .padding(.top,6)
            .background((Color.navyBlue))
            .clipShape(.capsule)
            .padding()
        }
        .padding()
    }
}


