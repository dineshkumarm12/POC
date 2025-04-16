//
//  User.swift
//  LOR_POC
//
//  Created by Dinesh Kumar.M on 15/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//

struct SalesforceUser: Codable {
    let id: String
    let name: String
    let email: String

    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case name = "display_name"
        case email
    }
}
