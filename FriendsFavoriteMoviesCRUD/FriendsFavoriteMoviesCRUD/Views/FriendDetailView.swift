import SwiftUI

struct FriendDetailView : View {
    @Bindable var friend: Friend
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle("Friends")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FriendDetailView(friend: SampleData.shared.friend)
    }
}
