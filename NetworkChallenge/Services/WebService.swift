//
//  API.swift
//  NetworkChallenge
//
//  Created by Ayslana Riene on 15/08/22.
//

import Foundation

class WebService {
    
    func getPosts(url: URL) async throws -> [PostListModel] {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([PostListModel].self, from: data)
        } catch {
            print(error)
        }
        return []
    }

    
    static func createUser(name: String, email: String, password: String) async -> CurrentUser? {
           
        var urlRequest = URLRequest(url: Constants.Urls.createUser)
           
        let body: [String:Any] = ["name": name,
                                  "email": email,
                                  "password": password
           ]
           
           urlRequest.httpMethod = "POST"
           let jsonBody = try? JSONSerialization.data(withJSONObject: body)

           urlRequest.httpBody = jsonBody
           urlRequest.allHTTPHeaderFields = [
               "Content-Type": "application/json"
           ]


           do {
               let (data,_) = try await URLSession.shared.data(for: urlRequest)
                       let userData = try JSONDecoder().decode(CurrentUser.self, from: data)
               print(userData)
                       return userData
                   }catch {
                       print(error)
                   }
                   return nil
                   
               }
    
    func getUsers(url: URL) async throws -> [UserListModel] {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([UserListModel].self, from: data)
        } catch {
            print(error)
        }
        return []
    }
    
//    static func loginSession(email: String, password: String) async -> Session? {
//         let url = URL(string: "\(Constants.BASE_URL)users/login")
//         var urlRequest = URLRequest(url: url!)
//
//         let loginString = NSString(format: "%@:%@", email, password)
//         let loginData: NSData = loginString.data(using: String.Encoding.utf8.rawValue)! as NSData
//
//         let base64LoginString = loginData.base64EncodedString(options: [])
//
//         urlRequest.httpMethod = "POST"
//         urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//         urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
//
//         do {
//             let (data, _) = try await URLSession.shared.data(for: urlRequest)
//             let decodedLoginResponse: Session = try JSONDecoder().decode(Session.self, from: data)
//             print(decodedLoginResponse)
//             return decodedLoginResponse
//         } catch {
//             print("\(error)")
//         }
//
//         return nil
//     }
    

}
