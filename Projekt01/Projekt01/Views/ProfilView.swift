
//  Created by Eggenschwiler Andre on 25.09.24.


import SwiftUI

struct ProfilView: View {
    @AppStorage("username") var username = ""
    @AppStorage("email") var email = ""
    @AppStorage("birthday") var birthday = ""
    @AppStorage("location") var location = ""
    @AppStorage("darkmode") var darkmode = false
    @AppStorage("selectedImage") var selectedImage: String = "Man"

    @State private var showImageSheet = false

    var body: some View {

        VStack {
            Image(selectedImage)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(180)
                .scaledToFit()
                .padding()
                .onTapGesture {
                    showImageSheet = true
                }
                .sheet(isPresented: $showImageSheet) {
                    ImageSheetProfil(selectedImage: $selectedImage, showImageSheet: $showImageSheet)
                }

            Form {
                Section(header: Text("Persönliche Informationen")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                    TextField("Birthday", text: $birthday)
                    TextField("Location", text: $location)

                }

                Section(header: Text("Persönliche Einstellungen")) {
                    Toggle("Dark Mode", isOn: $darkmode)
                }
                .navigationTitle("Einträge")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}




#Preview {
    ProfilView()
}


















