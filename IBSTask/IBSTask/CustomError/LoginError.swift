//
//  LoginError.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 09/10/2022.
//

import SwiftUI

enum LoginError: Error, LocalizedError {
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    case passwordInvalid
    
   
    
    var errorDescription: String? {
        switch self {
        case .emailEmpty:
            return "Empty cannot be empty!"
        case .emailInvalid:
            return " Invalid email format"
        case .passwordEmpty:
            return "Password cannot be empty!"
        case .passwordInvalid:
            return "Invalid password format"
            
        }
    }
}
