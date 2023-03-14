//
//  TabBarView.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var vm: UserViewModel
    
    var body: some View {
        TabView {
            UserListView(vm: vm)
                .tabItem {
                    Label("User List", systemImage: "list.clipboard")
                }
            
            UserProfileView(vm: vm)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(vm: UserViewModel())
    }
}
