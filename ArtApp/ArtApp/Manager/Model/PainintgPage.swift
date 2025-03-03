//
//  PainintgPage.swift
//  ArtApp
//
//  Created by Murat on 3.03.2025.
//

import Foundation
struct PainintgPage: Codable {
    let content: [Painting]
    let pageable: Pageable
    let last: Bool
    let totalElements, totalPages: Int
    let first: Bool
    let numberOfElements, size, number: Int
    let sort: Sort
    let empty: Bool
}


struct Pageable: Codable {
    let pageNumber, pageSize: Int
    let sort: Sort
    let offset: Int
    let paged, unpaged: Bool
}

struct Sort: Codable {
    let sorted, unsorted, empty: Bool
}
