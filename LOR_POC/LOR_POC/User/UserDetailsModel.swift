//
//  UserInfo.swift
//  LOR_POC
//
//  Created by Dinesh Kumar.M on 15/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//


import Foundation
import Combine
import SalesforceSDKCore

class UserDetailsModel: ObservableObject {
    @Published var userInfo: SalesforceUser?
/*
    @MainActor
    func fetchLoggedInUserInfo() {
        Task {
            guard let user = UserAccountManager.shared.currentUserAccount,
                  let identityURL = user.credentials.identityUrl else {
                print("No logged-in user or identity URL.")
                return
            }

            var request = RestRequest(method: .GET, path: identityURL.path, queryParams: nil)
            request.endpoint = identityURL.host ?? ""
            request.requiresAuthentication = true

            do {
                let response = try await RestClient.shared.send(request: request)
                let json = try response.asJson() as? [String: Any]

                if let json {
                    let name = json["display_name"] as? String ?? "Unknown"
                    let email = json["email"] as? String ?? "Unknown"
                    let id = json["user_id"] as? String ?? "Unknown"

                    self.userInfo = SalesforceUser(id: id, name: name, email: email)
                }
            } catch {
                print("Failed to fetch user info: \(error)")
            }
        }
    }*/
    
   /* @MainActor
    func fetchLoggedInUserInfo() {
        Task {
            guard let user = UserAccountManager.shared.currentUserAccount,
                  let identityURL = user.credentials.identityUrl else {
                print(">>>>No logged-in user or identity URL.")
                return
            }
            print("User, \(user), Identity URL, \(identityURL)")
            var request = RestRequest(method: .GET, path: identityURL.path, queryParams: nil)
            request.endpoint = identityURL.host ?? ""
            request.requiresAuthentication = true

            do {
                let response = try await RestClient.shared.send(request: request)
                let decodedUser = try response.asDecodable(type: SalesforceUser.self)
                self.userInfo = decodedUser
            } catch {
                print("Failed to decode user info: \(error)")
            }
        }
    }*/
    
    /*@MainActor
    func fetchLoggedInUserInfo() {
        Task {
            guard let user = UserAccountManager.shared.currentUserAccount,
                  let identityURL = user.credentials.identityUrl else {
                print("No logged-in user or identity URL.")
                return
            }

            var request = RestRequest(method: .GET, path: "", queryParams: nil)
            request.customUrl = identityURL // 🔥 this overrides path+endpoint logic
            request.requiresAuthentication = true

            do {
                let response = try await RestClient.shared.send(request: request)
                let decodedUser = try response.asDecodable(type: SalesforceUser.self)
                self.userInfo = decodedUser
            } catch {
                print("Failed to decode user info: \(error)")
            }
        }
    }*/
    
   
    
    
   /* @MainActor
    func fetchLoggedInUserInfo() {
        Task {
            guard
                let user = UserAccountManager.shared.currentUserAccount,
                let instanceUrl = user.credentials.instanceUrl,
                let accessToken = user.credentials.accessToken,
                let orgId = user.credentials.organizationId,
                let userId = user.credentials.userId
            else {
                print("Missing credentials")
                return
            }

            let identityURL = instanceUrl.appendingPathComponent("/id/\(orgId)/\(userId)")

           
            
            var request = URLRequest(url: identityURL)
            request.httpMethod = "GET"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

    
            do {
                let (data, response) = try await URLSession.shared.data(for: request)

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    let errorBody = String(data: data, encoding: .utf8) ?? "No error body"
                    print("❌ Invalid response. Status: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
                    print("❌ Response body: \(errorBody)")
                    return
                }

                let decodedUser = try JSONDecoder().decode(SalesforceUser.self, from: data)
                self.userInfo = decodedUser
            } catch {
                print("Failed to fetch user info: \(error)")
            }
        }
    }*/
    
    @MainActor
    func fetchLoggedInUserInfo() {
        Task {
            guard let user = UserAccountManager.shared.currentUserAccount,
                  let identityURL = user.credentials.identityUrl,
                  let accessToken = user.credentials.accessToken else {
                print("Missing credentials")
                return
            }

            print("🔗 Using identity URL: \(identityURL)")
            print("🔗 Calling identity URL: \(identityURL)")
            print("🔗 identity URL: \(identityURL)")
            print("🔐 access token: \(accessToken)")
            print("🔐 access token: \(accessToken.prefix(20))...")
            print("✅ Instance URL: \(user.credentials.instanceUrl)")

            var request = URLRequest(url: identityURL)
            request.httpMethod = "GET"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

            do {
                let (data, response) = try await URLSession.shared.data(for: request)

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    let errorBody = String(data: data, encoding: .utf8) ?? "No error body"
                    print("❌ Invalid response. Status: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
                    print("❌ Response body: \(errorBody)")
                    return
                }

                let decodedUser = try JSONDecoder().decode(SalesforceUser.self, from: data)
                self.userInfo = decodedUser
            } catch {
                print("Failed to fetch user info: \(error)")
            }
        }
    }
}
