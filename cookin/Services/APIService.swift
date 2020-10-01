//
//  APIService.swift
//  cooker
//
//  Created by Irfan Shah on 16/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

public struct APIService {
    let baseURL = URL(string: "https://www.themealdb.com/api/json/v1/1")!
    let mediaIngredient = URL(string: "https://www.themealdb.com/images/ingredients/")
    
    public static let shared = APIService()
    let decoder = JSONDecoder()
    
    public enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }
    
    public enum Endpoint {
        case search, random, filter, lookup
        case category, ingredients
        
        func path() -> String {
            switch self {
            case .search: ///// Search By Name ["s": "Apple"] ///// Search By First Letter ["f": "A"]
                return "search.php"
            case .random: /// RANDOM WILL RETURN A SINGLE RANDOM MEAL
                return "random.php"
            case .filter: /// FILTER WITH CATEGORY ["c": "breakfast"] OR BY MAIN INGREDIENT ["i": "chicken_breast"]
                return "filter.php"
            case .lookup: /// FILTER A SINGLE MEAL BY MEAL ID
                return "lookup.php"
            case .category: /// RETURNS ALL CATEGORIES
                return "categories.php"
            case .ingredients: /// RETURNS ALL INGREDIENTS
                return "list.php"
            }
        }
    }
    
    public func GETMEDIA(of ingredient: String) -> URL {
        let url = mediaIngredient?.appendingPathComponent("\(ingredient).png")
        return url!
    }
    
    public func REQUEST<T: Codable>(endpoint: Endpoint,
                                    params: [String: String]?,
                                    completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let queryURL = baseURL.appendingPathComponent(endpoint.path())
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)!
        components.queryItems = []
        if let params = params {
            for (_, value) in params.enumerated() {
                components.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
            }
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.noResponse))
                }
                return
            }
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError(error: error!)))
                }
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(object))
                }
            } catch let error {
                DispatchQueue.main.async {
                    #if DEBUG
                    print("JSON Decoding Error: \(error)")
                    #endif
                    completionHandler(.failure(.jsonDecodingError(error: error)))
                }
            }
        }
        task.resume()
    }
    
}
