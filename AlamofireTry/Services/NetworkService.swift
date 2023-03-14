//
//  NetworkService.swift
//  AlamofireTry
//
//  Created by Jonathan Ricky Sandjaja on 14/03/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    
    static let shared = NetworkService()
    
    func loginUser(username: String, password: String, completion: @escaping (_ data: User) -> Void) {
        let baseURL = "https://dummyjson.com/auth/login"
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        var params: [String: String] = [:]
        if username != "" && password != "" {
            params["username"] = username
            params["password"] = password
        }
        
        AF.request(baseURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            do {
                var userResponse: User?
                if response.response?.statusCode == 200 {
                    userResponse = try JSONDecoder().decode(User.self, from: response.data ?? Data())
                    guard let user = userResponse else { return }
                    completion(user)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
