import SwiftUI
import SwiftData

struct MovieListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        MovieDetailView(movie: movie)
                    }
                }
                .onDelete(perform: deleteMovie(indexes:))
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem {
                    Button("Add movie", systemImage: "plus", action: addMovie)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addMovie() {
        context.insert(Movie(title: "New Movie", releaseDate: .now))
    }
    
    private func deleteMovie(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    MovieListView()
        .modelContainer(SampleData.shared.modelContainer)
}
