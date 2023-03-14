//
//  UserListView.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var vm: UserViewModel
    
    var body: some View {
        if (vm.user?.email ?? "") != "" {
            VStack {
                Text(vm.user?.username ?? "")
                
                Text(vm.user?.email ?? "")
            }
        } else {
            ProgressView()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(vm: UserViewModel())
    }
}
