//
//  TabBarView.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import SwiftUI

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

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(vm: UserViewModel())
    }
}
