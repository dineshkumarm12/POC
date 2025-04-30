//
//  SceneDelegate.swift
//  LOR
//
//  Created by Dineshkumar on 24/04/25.
//
import Foundation

struct MobilePermissions: Codable, Identifiable {
    let id: String
    let name: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case user = "User__r"
    }
}

struct User: Codable {
    let email: String

    enum CodingKeys: String, CodingKey {
        case email = "Email"
    }
}

struct MobilePermissionResponse: Codable {
    let totalSize: Int
    let done: Bool
    let records: [MobilePermissions]
}
