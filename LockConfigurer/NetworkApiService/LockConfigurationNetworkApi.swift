//
//  LockConfigurationNetworkApi.swift
//  LockConfigurer
//
//  Created by Ghassen on 28.03.2024.
//

import Foundation

enum DataError: Error {
    // Use an enum to handle errors type more effectively.
    case invalidData
    case decodeError
}

class LockConfigurationNetworkApiService{
    
    private let url = URL(string: "https://mocki.io/v1/bea92fe9-a7d3-4ce1-a16c-51447afca828")
    static let shared = LockConfigurationNetworkApiService()
    
    //Get all lock configuration data asynchronously from the API and decode it into the LockConfigurationModel.
    func getLockData(completion: @escaping (Result<LockConfigurationModel,Error>) -> Void) {
        URLSession.shared.dataTask(with: self.url!) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard let data else {
                completion(.failure(DataError.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let products = try decoder.decode(LockConfigurationModel.self, from: data)
                completion(.success(products))
            }
            catch {
                completion(.failure(DataError.decodeError))
            }
        }.resume()
    }
    
}
