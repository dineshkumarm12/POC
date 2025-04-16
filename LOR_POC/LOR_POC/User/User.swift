//
//  User.swift
//  LOR_POC
//
//  Created by Dinesh Kumar.M on 15/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//




import Foundation

import Foundation

struct SalesforceUser: Codable {
    let id: String
    let assertedUser: Bool
    let userId: String
    let organizationId: String
    let username: String
    let nickName: String
    let displayName: String
    let email: String
    let emailVerified: Bool
    let firstName: String
    let lastName: String
    let timezone: String
    let photos: UserPhotos
    let addrStreet: String?
    let addrCity: String?
    let addrState: String?
    let addrCountry: String?
    let addrZip: String?
    let mobilePhone: String?
    let mobilePhoneVerified: Bool
    let isLightningLoginUser: Bool
    let status: Status
    let urls: SalesforceURLs
    let active: Bool
    let userType: String
    let language: String
    let locale: String
    let utcOffset: Int
    let lastModifiedDate: String
    let isAppInstalled: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case assertedUser = "asserted_user"
        case userId = "user_id"
        case organizationId = "organization_id"
        case username
        case nickName = "nick_name"
        case displayName = "display_name"
        case email
        case emailVerified = "email_verified"
        case firstName = "first_name"
        case lastName = "last_name"
        case timezone
        case photos
        case addrStreet = "addr_street"
        case addrCity = "addr_city"
        case addrState = "addr_state"
        case addrCountry = "addr_country"
        case addrZip = "addr_zip"
        case mobilePhone = "mobile_phone"
        case mobilePhoneVerified = "mobile_phone_verified"
        case isLightningLoginUser = "is_lightning_login_user"
        case status
        case urls
        case active
        case userType = "user_type"
        case language
        case locale
        case utcOffset
        case lastModifiedDate = "last_modified_date"
        case isAppInstalled = "is_app_installed"
    }
}

struct UserPhotos: Codable {
    let picture: String
    let thumbnail: String
}

struct Status: Codable {
    let createdDate: String?
    let body: String?

    enum CodingKeys: String, CodingKey {
        case createdDate = "created_date"
        case body
    }
}

struct SalesforceURLs: Codable {
    let enterprise: String
    let metadata: String
    let partner: String
    let rest: String
    let sobjects: String
    let search: String
    let query: String
    let recent: String
    let toolingSoap: String?
    let toolingRest: String?
    let profile: String
    let feeds: String
    let groups: String
    let users: String
    let feedItems: String?
    let feedElements: String?
    let customDomain: String?

    enum CodingKeys: String, CodingKey {
        case enterprise
        case metadata
        case partner
        case rest
        case sobjects
        case search
        case query
        case recent
        case toolingSoap = "tooling_soap"
        case toolingRest = "tooling_rest"
        case profile
        case feeds
        case groups
        case users
        case feedItems = "feed_items"
        case feedElements = "feed_elements"
        case customDomain = "custom_domain"
    }
}
