# AlamofireTry

This is a project I created to try and use Alamofire, a Swift library for HTTP Networking. I used user API from dummyJSON for this project. This project features:
- Login using username and password
- Display list of users
- See every user's details
- See user's profile from login

Tech Stack:
- Swift
- SwiftUI
- MVVM Design Pattern
- Alamofire

I encountered some problems in this project. The problem is about Tab Bar, because it's still around when I navigate to another view, and I tried to wrap the TabView with NavigationView, but now the navigationTitle on each view won't show up. The solution I come up with is:
```swift
struct TabBarView: View {
    @ObservedObject var vm: UserViewModel
    @State var selection = "User List"
    
    var body: some View {
        TabView(selection: $selection) {
            UserListView(vm: vm)
                .tag("User List")
                .tabItem {
                    Label("User List", systemImage: "list.clipboard")
                }
            
            UserProfileView(vm: vm)
                .tag("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(self.selection)
        .navigationBarTitleDisplayMode(.large)
    }
}
```

Because the ContentView (login view) already has a NavigationView, I remove it from the TabView, and add a selection and tag to every tabItem. Then, I display the title based on the selection.

Links:
- https://dummyjson.com/docs/users
- https://dummyjson.com/docs/auth
