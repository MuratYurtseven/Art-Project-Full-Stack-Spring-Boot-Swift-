//
//  HomeViewModel.swift
//  ArtApp
//
//  Created by Murat on 28.02.2025.
//

import Foundation
@MainActor
class HomeViewModel:ObservableObject {
    @Published private(set) var mostPopularPaintings:[Painting] = []
    @Published private(set) var RecommendedPaintings:[Painting] = []
    @Published private(set) var MostLikedPaintings:[Painting] = []
    @Published private(set) var MostVisitedPaintings:[Painting] = []
    @Published private(set) var PaintingOfTheDay:Painting? = nil
    
    init(){
        getMostPopularPaintings()
        getRecommendedPaintings()
        getMostLikedPaintings()
        getMostVisitedPaintings()
        getPaintingOfTheDay()
    }
    
    func getMostPopularPaintings(){
        NetworkManager.shared.getMostPopularPaintings { result in
            switch result {
            case .success(let mpPaintings):
                DispatchQueue.main.async {
                    self.mostPopularPaintings = mpPaintings
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getRecommendedPaintings(){
        NetworkManager.shared.getRecommendedPaintings { result in
            switch result {
            case .success(let rPaintings):
                DispatchQueue.main.async {
                    self.RecommendedPaintings = rPaintings
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
    func getMostLikedPaintings(){
        NetworkManager.shared.getMostLikedPaintings { result in
            switch result {
            case .success(let mlPaintings):
                DispatchQueue.main.async {
                    self.MostLikedPaintings = mlPaintings
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getMostVisitedPaintings(){
        NetworkManager.shared.getMostVisitedPaintings { result in
            switch result {
            case .success(let mvPaintnigs):
                DispatchQueue.main.async {
                    self.MostVisitedPaintings = mvPaintnigs
                }
                print(mvPaintnigs)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getPaintingOfTheDay(){
        NetworkManager.shared.getPaintingOfTheDay { result in
            switch result {
            case .success(let potd):
                DispatchQueue.main.async {
                    self.PaintingOfTheDay = potd
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
