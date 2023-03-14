//
//  UserViewModel.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user: User?
    
    func login(username: String, password: String) {
        LoginServices.shared.loginUser(username: username, password: password) { [weak self] data in
            guard let self = self else { return }
            self.user = data
        }
    }
    
}
