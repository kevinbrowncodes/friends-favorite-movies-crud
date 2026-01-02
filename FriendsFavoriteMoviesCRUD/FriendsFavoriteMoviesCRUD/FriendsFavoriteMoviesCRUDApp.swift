import SwiftUI
import SwiftData

@main
struct FriendsFavoriteMoviesCRUDApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Movie.self, Friend.self])
    }
}
