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
        VStack {
            if vm.users.isEmpty {
                ProgressView()
            } else {
                List(vm.users) { user in
                    HStack {
                        AsyncImage(url: URL(string: user.image), content: { image in
                                image
                                .resizable()
                                .frame(width: 30, height: 30)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("\(user.firstName) \(user.lastName)")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text("\(user.age)")
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("User List")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            vm.getUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(vm: UserViewModel())
    }
}
