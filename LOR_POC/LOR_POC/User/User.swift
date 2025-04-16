//
//  User.swift
//  LOR_POC
//
//  Created by Dinesh Kumar.M on 15/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//




import Foundation

struct SalesforceUser: Codable {
    let id: String
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
    let photos: Photos
    let addrCity: String?
    let addrState: String?
    let addrCountry: String?
    let addrZip: String?
    let mobilePhone: String?
    let mobilePhoneVerified: Bool
    let isLightningLoginUser: Bool
    let status: Status?
    let urls: Urls
    let active: Bool
    let userType: String
    let language: String
    let locale: String
    let utcOffset: Int
    let lastModifiedDate: String
    let isAppInstalled: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case user_id
        case organization_id
        case username
        case nick_name
        case display_name
        case email
        case email_verified
        case first_name
        case last_name
        case timezone
        case photos
        case addr_city
        case addr_state
        case addr_country
        case addr_zip
        case mobile_phone
        case mobile_phone_verified
        case is_lightning_login_user
        case status
        case urls
        case active
        case user_type
        case language
        case locale
        case utc_offset
        case last_modified_date
        case is_app_installed
    }

}

struct Photos: Codable {
    let picture: String
    let thumbnail: String
    
    
    enum CodingKeys: String, CodingKey {
        case picture
        case thumbnail
    }

}

struct Status: Codable {
    let createdDate: String?
    let body: String?
}

struct Urls: Codable {
    let enterprise: String
    let metadata: String
    let partner: String
    let rest: String
    let sobjects: String
    let search: String
    let query: String
    let recent: String
    let toolingSoap: String
    let toolingRest: String
    let profile: String
    let feeds: String
    let groups: String
    let users: String
    let feedItems: String
    let feedElements: String
    let customDomain: String
}
