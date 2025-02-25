//
//  NetworkManager.swift
//  ArtApp
//
//  Created by Murat on 24.02.2025.
//

import Foundation

class NetworkManager{
    private init(){}
    
    static let shared = NetworkManager()
    
    private func request<T:Decodable>(endpoint: Endpoint,completion:@escaping(Result<T,Error>) -> Void){
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            
            if let error = error{
                completion(.failure(error))
            }
            guard let response = response as? HTTPURLResponse,response.statusCode >= 200,response.statusCode <= 299 else {
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalied Response data", code: 0)))
                return
            }
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodeData))
            }catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    

    func getAllPaintins(page:Int,completion:@escaping(Result<[Painting],Error>) -> Void){
        let endpoint = Endpoint.getAllPaintings(page: page, size: 10)
        request(endpoint: endpoint, completion: completion)
    }
    
    func searchPaintings(keyword:String,completion:@escaping(Result<[Painting],Error>) -> Void){
        let endpoint = Endpoint.searchPaintings(keyword: keyword)
        request(endpoint: endpoint, completion: completion)
    }
    
    func getMostPopularPaintings(completion:@escaping(Result<[Painting],Error>) -> Void){
        let endpoint = Endpoint.getPopularPaintings
        request(endpoint: endpoint, completion: completion)
    }
    
    func getRecommendedPaintings(completion:@escaping(Result<[Painting],Error>) -> Void){
        let endpoint = Endpoint.getRecommendedPaintings
        request(endpoint: endpoint, completion: completion)
    }
    
    func getMostLikedPaintings(completion:@escaping(Result<[Painting],Error>) -> Void){
        let endpoint = Endpoint.getMostLikedPaintings
        request(endpoint: endpoint, completion: completion)
    }
    
    func getMostVisitedPaintings(completion:@escaping(Result<[Painting],Error>) -> Void){
        let endpoint = Endpoint.getMostVisitedPaintings
        request(endpoint: endpoint, completion: completion)
    }
    
    func getPaintingOfTheDay(completion:@escaping(Result<Painting,Error>) -> Void){
        let endpoint = Endpoint.getPaintingOfTheDay
        request(endpoint: endpoint, completion: completion)
    }
    
    func getArtistById(id: Int, completion:@escaping(Result<Artist,Error>) -> Void){
        let endpoint = Endpoint.getArtistById(id: id)
        request(endpoint: endpoint, completion: completion)
    }
}
