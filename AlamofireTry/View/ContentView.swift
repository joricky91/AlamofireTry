//
//  ContentView.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = UserViewModel()
    @State var username = ""
    @State var password = ""
    @State var isActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $username, prompt: Text("Enter your email"))
                    .padding(.bottom)
                    .textInputAutocapitalization(.never)
                
                SecureField("", text: $password, prompt: Text("Enter your password"))
                    .padding(.bottom)
                    .textInputAutocapitalization(.never)
                
                NavigationLink(destination: UserListView(vm: vm), isActive: $isActive, label: {
                    Button {
                        vm.login(username: username, password: password)
                        isActive = true
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(width: 300, height: 40)
                            .background(.primary)
                            .cornerRadius(8)
                    }
                })

            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
