//
//  SearchViewModel.swift
//  ArtApp
//
//  Created by Murat on 3.03.2025.
//

import Foundation

class SearchViewModel:ObservableObject{
    @Published private(set) var result:[Painting] = []
    
    func search(text:String){
        NetworkManager.shared.searchPaintings(keyword: text) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.result = success
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
