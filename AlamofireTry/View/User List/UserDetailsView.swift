//
//  UserDetailsView.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import SwiftUI

struct UserDetailsView: View {
    @ObservedObject var vm: UserViewModel
    var currentUserID: Int = 0
    
    var body: some View {
        VStack {
            Text("\(vm.userDetails?.firstName ?? "") \(vm.userDetails?.lastName ?? "")")
                .font(.title)
                .fontWeight(.bold)
            
            AsyncImage(url: URL(string: vm.userDetails?.image ?? ""), content: { image in
                    image
                    .resizable()
                    .frame(width: 100, height: 100)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .clipShape(Circle())
            
            Text(vm.userDetails?.gender ?? "")
            
            Text("\(vm.userDetails?.age ?? 0) years old")
                .padding(.bottom)
            
            Text(vm.userDetails?.username ?? "")
            
            Text(vm.userDetails?.email ?? "")
        }
        .onAppear {
            vm.userDetails(userID: currentUserID)
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(vm: UserViewModel())
    }
}
