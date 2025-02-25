//
//  Location.swift
//  ArtApp
//
//  Created by Murat on 24.02.2025.
//

import Foundation

struct Location: Codable,Hashable {
    let id: Int
    let locationName: String
    let latitude, longitude: Double
}
