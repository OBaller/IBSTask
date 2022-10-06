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
    func getUsers() -> AnyPublisher<UserDetails, Error> {
        let components = URLComponents(string: "https://randomuser.me/api")!
        let request = URLRequest(url: components.url!, timeoutInterval: 5)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
//            .decode(type: [User].self, decoder: JSONDecoder())
            .decode(type: UserDetails.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
