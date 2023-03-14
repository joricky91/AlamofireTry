//
//  UserService.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService {
    
    static let shared = UserService()
    
    func getAllUser(completion: @escaping (_ data: [User]) -> Void) {
        let baseURL = "https://dummyjson.com/users"
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(baseURL, method: .get, parameters: [:], headers: headers).responseJSON { response in
            do {
                var user: [User] = []
                if response.response?.statusCode == 200 {
                    let userResponse = try JSONDecoder().decode(UserResponse.self, from: response.data ?? Data())
                    user = userResponse.users
                    completion(user)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserDetails(userID: Int, completion: @escaping (_ data: User) -> Void) {
        let baseURL = "https://dummyjson.com/users/"
        let url = "\(baseURL)\(userID)"
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            do {
                var userData: User?
                if response.response?.statusCode == 200 {
                    userData = try JSONDecoder().decode(User.self, from: response.data ?? Data())
                    guard let user = userData else { return }
                    completion(user)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
