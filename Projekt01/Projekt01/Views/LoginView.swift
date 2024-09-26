
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI

struct LoginView: View {
    
    @AppStorage("username")
    private var username: String = ""
    
    @AppStorage("isUserLoggedIn")
    private var isUserLoggedIn = false
    
    var body: some View {
        ZStack {
            BackColor.backgroundColor4.ignoresSafeArea()
            VStack {
                
                Image("header")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                if username.isEmpty {
                    Text("Bitte gib deinen Namen zum Einloggen ein.")
                } else {
                    Text("Willkommen \(username) zu Feels")
                }
                TextField("beutzername", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Anmelden") {
                    
                    isUserLoggedIn = true
                }
                .disabled(username.isEmpty)
            }
            .padding()
            .bold()
            .monospaced()
        }
    }
}
#Preview {
    LoginView()
}
