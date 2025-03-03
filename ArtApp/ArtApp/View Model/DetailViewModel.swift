//
//  DetailViewModel.swift
//  ArtApp
//
//  Created by Murat on 3.03.2025.
//

import Foundation

class DetailViewModel:ObservableObject{
    @Published private(set) var artist:Artist?
    
    func fetchArtist(id:Int){
        NetworkManager.shared.getArtistById(id: id) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.artist = success
                }

            case .failure(let failure):
                print(failure)
            }
        }
    }
}
