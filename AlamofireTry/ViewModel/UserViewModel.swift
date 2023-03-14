//
//  UserViewModel.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user: User?
    
    func login() {
        NetworkService.shared.loginUser(username: "kminchelle", password: "0lelplR") { [weak self] data in
            guard let self = self else { return }
            
            self.user = data
            print(self.user?.username ?? "no value")
        }
    }
    
}
