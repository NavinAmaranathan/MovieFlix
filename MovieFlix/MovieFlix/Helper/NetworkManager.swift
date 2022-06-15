//
//  NetworkManager.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func getDataFromServer<T: Decodable>(for url: String, resultType: T.Type, completionHandler: @escaping ((T?) -> Void)) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(String(describing: error?.localizedDescription))")
                completionHandler(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200  else {
                completionHandler(nil)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completionHandler(result)
            } catch let error {
                print("Error in parsing\(error)")
                completionHandler(nil)
            }
        }.resume()
    }
}
