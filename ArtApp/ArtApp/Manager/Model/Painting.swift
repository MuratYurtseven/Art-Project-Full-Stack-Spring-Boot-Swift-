//
//  Painting.swift
//  ArtApp
//
//  Created by Murat on 24.02.2025.
//
import Foundation

struct Painting:Codable,Hashable{
    let paintID: Int
    let name: String
    let imageURL: String
    let description: String?
    let location: Location
    let artistID: Int
    let analysis, completionDate: String
    let popularity, recommendedRate, likedRate, visitedRate: Double

    enum CodingKeys: String, CodingKey {
        case paintID = "paintId"
        case name
        case imageURL = "imageUrl"
        case description, location
        case artistID = "artistId"
        case analysis, completionDate, popularity, recommendedRate, likedRate, visitedRate
    }
}
