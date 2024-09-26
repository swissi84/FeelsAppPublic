
//  Created by Eggenschwiler Andre on 25.09.24.

import SwiftUI
import SwiftData

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
