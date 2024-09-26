//
//import SwiftUI
//
//struct SettingView: View {
//  @AppStorage("username") var username = ""
//  @AppStorage("email") var email = ""
//  @AppStorage("birthday") var birthday = ""
//  @AppStorage("location") var location = ""
//  @AppStorage("darkmode") var darkmode = false
//  @State private var selectedImage: String = "profil"
//  @State private var showImageSheet = false
//  var body: some View {
//    NavigationStack {
//      VStack {
//        Image(selectedImage)
//          .resizable()
//          .frame(width: 100, height: 100)
//          .cornerRadius(180)
//          .scaledToFit()
//          .padding()
//          .onTapGesture {
//            showImageSheet = true
//          }
//          .sheet(isPresented: $showImageSheet) {
//            ImageSheetProfil(selectedImage: $selectedImage, showImageSheet: $showImageSheet)
//          }
//        Form {
//          Section(header: Text("Personal Information")) {
//            TextField("Username", text: $username)
//            TextField("Email", text: $email)
//            TextField("Birthday", text: $birthday)
//            TextField("Location", text: $location)
//          }
//          Section(header: Text("Preferences")) {
//            Toggle("Dark Mode", isOn: $darkmode)
//          }
//        }
//        .navigationTitle("Feels Profil")
//        .navigationBarTitleDisplayMode(.inline)
//      }
//    }
//  }
//}
//
//
//#Preview {
//  SettingView()
//}
