//
//  UserProfileView.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var vm: UserViewModel
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Text("\(vm.user?.firstName ?? "") \(vm.user?.lastName ?? "")")
                .font(.title)
                .fontWeight(.bold)
            
            AsyncImage(url: URL(string: vm.user?.image ?? ""), content: { image in
                    image
                    .resizable()
                    .frame(width: 100, height: 100)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .clipShape(Circle())
            .padding(.bottom)
            
            Text(vm.user?.gender ?? "")
            
            Text(vm.user?.username ?? "")
            
            Text(vm.user?.email ?? "")
            
            Button {
                vm.addNewUserToAPI()
                isPresented = true
            } label: {
                Text("Add New User")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: 300, height: 40)
                    .background(.primary)
                    .cornerRadius(8)
            }
        }
        .alert(isPresented: $isPresented) {
            Alert(title: Text("Success"), message: Text("Successfully added user with name \(vm.newUser?.firstName ?? "") \(vm.newUser?.lastName ?? "")"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(vm: UserViewModel())
    }
}
