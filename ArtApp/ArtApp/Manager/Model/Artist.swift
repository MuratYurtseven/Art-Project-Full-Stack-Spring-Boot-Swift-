//
//  Artist.swift
//  ArtApp
//
//  Created by Murat on 25.02.2025.
//

import Foundation

struct Artist:Codable,Hashable{
    let name, surname: String
    let profileImageURL: String
    let aboutLife, bornTime, deadTime: String
    let artistID: Int

    enum CodingKeys: String, CodingKey {
        case name, surname
        case profileImageURL = "profileImageUrl"
        case aboutLife, bornTime, deadTime
        case artistID = "artistId"
    }
}
