//
//  Endpoint.swift
//  ArtApp
//
//  Created by Murat on 25.02.2025.
//

import Foundation

protocol EndpointProtocol{
    var baseUrl: String{get}
    var path: String{get}
    var method: HttpMethod{get}
    var header: [String:String]?{get}
    var parameters: [String:Any]?{get}
    
    func request() -> URLRequest
}

enum HttpMethod: String{
    case get = "GET"
}

enum Endpoint {
    case getAllPaintings(page: Int, size: Int)
    case searchPaintings(keyword: String)
    case getPopularPaintings
    case getRecommendedPaintings
    case getMostLikedPaintings
    case getMostVisitedPaintings
    case getPaintingOfTheDay
    case getArtistById(id: Int)
}

extension Endpoint: EndpointProtocol {
    var baseUrl: String {
        return "http://192.168.1.83:8080/paintings"
    }
    
    var path: String {
        switch self {
        case .getAllPaintings:
            return "/allPaintings"
        case .searchPaintings:
            return "/search"
        case .getPopularPaintings:
            return "/mostPopularPaintings"
        case .getRecommendedPaintings:
            return "/recommendedPaintings"
        case .getMostLikedPaintings:
            return "/mostLikedPaintings"
        case .getMostVisitedPaintings:
            return "/mostVisitedPaintings"
        case .getPaintingOfTheDay:
            return "/randomPainting"
        case .getArtistById(let id):
            return "/artist/\(id)"
        }
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var header: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getAllPaintings(let page, let size):
            return ["page": page, "size": size]
        case .searchPaintings(let keyword):
            return ["keyword": keyword]
        default:
            return nil
        }
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseUrl + path) else {
            fatalError("URL oluşturulamadı")
        }
        
        if let parameters = parameters, method == .get {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        if method != .get, let parameters = parameters {
            do {
                let data = try JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = data
            } catch {
                print("Parametre serileştirme hatası: \(error.localizedDescription)")
            }
        }
        
        if let headers = header {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}
