//
//  UserModel.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 05/10/2022.
//

import Foundation


// MARK: User
struct User: Codable {
    let results: [UserDetails]
    let info: Info
}

// MARK: - Result
struct UserDetails: Codable, Identifiable {
    var id = UUID()
//    let gender: String
    let name: Name
    let location: Location
    let email: String
//    let login: Login
//    let dob, registered: Dob
//    let phone, cell: String
    let apiID: ID?
    let picture: Picture
//    let nat: String
    
    enum CodingKeys: String, CodingKey {
        case apiID = "id"
        case name
        case location
        case email
        case picture
        
    }
}


// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}



// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

// MARK: - ID
struct ID: Codable {
    let name, value: String
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
//    let postcode: String?
//    let coordinates: Coordinates
//    let timezone: Timezone
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, timezoneDescription: String

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium: String
}

extension UserDetails {
    static func mock() -> UserDetails {
        UserDetails(name: Name(title: "Mr", first: "Nas", last: "Oye"), location: Location(street: Street(number: 4938, name: "Docfastraat"), city: "Velswijk", state: "Overijssel", country: "Netherlands"), email: "nas@g", apiID: nil, picture: Picture(large: "https://randomuser.me/api/portraits/men/47.jpg", medium: "https://randomuser.me/api/portraits/med/men/47.jpg"))
        
    }
}
