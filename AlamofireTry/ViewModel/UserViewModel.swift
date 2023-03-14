//
//  UserViewModel.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user: UserLogin?
    @Published var users: [User] = []
    @Published var userDetails: User?
    
    func login(username: String, password: String) {
        LoginServices.shared.loginUser(username: username, password: password) { [weak self] data in
            guard let self = self else { return }
            self.user = data
        }
    }
    
    func getUsers() {
        UserService.shared.getAllUser { [weak self] data in
            guard let self = self else { return }
            self.users = data
        }
    }
    
    func userDetails(userID: Int) {
        UserService.shared.getUserDetails(userID: userID) { [weak self] data in
            guard let self = self else { return }
            self.userDetails = data
        }
    }
    
}
