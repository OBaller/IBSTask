//
//  APIService.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 05/10/2022.
//

import Foundation
import Combine
import SwiftUI

class APIService {
    static let shared = APIService()
    var cancellables = Set<AnyCancellable>()
    
    public enum APIError: Error {
        case error(_ errorString: String)
    }
    
   
    
    public func getJSON<T: Decodable>(urlString: String, completion: @escaping(Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid url", comment: ""))))
            return
        }
        
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        
       URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .receive(on: RunLoop.main)
            .sink { (taskCompletion) in
                switch taskCompletion {
                case .finished:
                    return
                case .failure(let decodingError):
                    completion(.failure(.error("Error: \(decodingError.localizedDescription)")))
                }
            } receiveValue: { (decodedData) in
                completion(.success(decodedData))
            }
            .store(in: &cancellables)
    }
}
