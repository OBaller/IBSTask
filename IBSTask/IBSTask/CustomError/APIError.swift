//
//  APIError.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 09/10/2022.
//

import Foundation

struct ApiError: Identifiable {
    let id = UUID().uuidString
    let errorString: String
}
