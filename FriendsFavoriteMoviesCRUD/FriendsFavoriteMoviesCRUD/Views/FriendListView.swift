import SwiftUI
import SwiftData

struct FriendListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Friend.name) private var friends: [Friend]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(friends) { friend in
                    NavigationLink(friend.name) {
                        FriendDetailView(friend: friend)
                    }
                }
                .onDelete(perform: deleteFriend(indexes:))
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem {
                    Button("Add friend", systemImage: "plus", action: addFriend)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addFriend() {
        context.insert(Friend(name: "New friend"))
    }
    
    private func deleteFriend (indexes: IndexSet) {
        for index in indexes {
            context.delete(friends[index])
        }
    }
}

#Preview {
    FriendListView()
        .modelContainer(SampleData.shared.modelContainer)
}
