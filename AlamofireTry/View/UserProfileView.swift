//
//  UserProfileView.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var vm: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text(vm.user?.email ?? "")
                
                Text(vm.user?.username ?? "")
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(vm: UserViewModel())
    }
}
