//
//  LoginViewModel.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 02/10/2022.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password      = ""
    @Published var emailErrorBorderColor: Color = Color(.secondarySystemBackground)
    @Published var passwordErrorBorderColor: Color = Color(.secondarySystemBackground)
    @Published var emailError: LoginError?
    @Published var passwordError: LoginError?
    @Published var isAuthenticated: Bool = false

    
    func clearErrors() {
        emailError = nil
        passwordError = nil
        emailErrorBorderColor = Color(.secondarySystemBackground)
        passwordErrorBorderColor = Color(.secondarySystemBackground)
    }
    
    func isValid() -> Bool {
        clearErrors()
        
        if email.isEmpty {
            emailError = LoginError.emailEmpty
            emailErrorBorderColor = .red
            
        } else if !email.isEmailValid {
            emailError = LoginError.emailInvalid
            emailErrorBorderColor = .red
        }
        
        if password.isEmpty {
            passwordError = LoginError.passwordEmpty
            passwordErrorBorderColor = .red
        } else if !password.isPasswordValid {
            passwordError = LoginError.passwordInvalid
            passwordErrorBorderColor = .red
        }
        
        return emailError == nil && passwordError == nil
    }
    
}


struct LoginFormError {
    var email: String = ""
    var password: String = ""
}
