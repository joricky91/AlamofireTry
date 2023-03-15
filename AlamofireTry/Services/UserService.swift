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
    
    func addNewUser(completion: @escaping (_ data: User) -> Void) {
        let url = "https://dummyjson.com/users/add"
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        var params: [String: AnyObject] = [:]
        params["firstName"] = "Jonathan" as AnyObject
        params["lastName"] = "Ricky" as AnyObject
        params["age"] = 22 as AnyObject
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            do {
                var newUser: User?
                if response.response?.statusCode == 200 {
                    newUser = try JSONDecoder().decode(User.self, from: response.data ?? Data())
                    guard let newUserData = newUser else { return }
                    completion(newUserData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
