//
//  DiscoverViewModel.swift
//  ArtApp
//
//  Created by Murat on 3.03.2025.
//
import Foundation
@MainActor
class DiscoverViewModel: ObservableObject {
    @Published private(set) var allPaintings: [Painting] = []
    @Published var isLoading: Bool = false

    func getAllPaintings(page: Int) {
        guard !isLoading else { return }
        isLoading = true

        NetworkManager.shared.getAllPaintins(page: page) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.allPaintings.append(contentsOf: success.content)
                case .failure(let error):
                    print("Hata: \(error)")
                }
                self.isLoading = false
            }
        }
    }
}
