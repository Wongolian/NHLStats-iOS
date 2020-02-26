//
//  TeamsWebService.swift
//  NHLStats
//
//  Created by Steven Wong on 2020-02-25.
//  Copyright © 2020 Steven Wong. All rights reserved.
//
// Teams API - https://statsapi.web.nhl.com/api/v1/teams

import Foundation

class TeamsWebService {

    func getTeams<T: Decodable>(urlString: String, completion: @escaping (T?) -> (Void)) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    completion(nil)
                    return
                    }
                }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let decoder = JSONDecoder()
                guard let decodedData = try? decoder.decode(T.self, from: data) else {
                    print("failed")
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
                }
            
            DispatchQueue.main.async {
                completion(decodedData)
            }
            
        }.resume()
        
    }
}
