
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI

struct LoginView: View {
    
    @AppStorage("username")
    private var username: String = ""
    
    @AppStorage("isUserLoggedIn")
    private var isUserLoggedIn = false
    
    var body: some View {
        VStack {
            ZStack {
                BackColor.backgroundColor4.ignoresSafeArea()
                VStack {
                    Image("header")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                    if username.isEmpty {
                        Text("Bitte gib deinen Namen zum Einloggen ein.")
                    } else {
                        Text("Willkommen \(username) zu Feels")
                    }
                    
                    TextField("Benutzername", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button("Anmelden") {
                        
                        isUserLoggedIn = true
                    }
                    .disabled(username.isEmpty)
                }
                .padding(25)
                .fontWeight(.light)
            }
            Spacer()
        }
    }
}
#Preview {
    LoginView()
}
