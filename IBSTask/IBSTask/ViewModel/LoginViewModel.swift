//
//  LoginViewModel.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 02/10/2022.
//

import Foundation
import Combine
import SwiftUI

struct LoginViewModel {
    var email = ""
    var password = ""
    var emailErrorBorderColor: Color = Color(.secondarySystemBackground)
    var passwordErrorBorderColor: Color = Color(.secondarySystemBackground)
    var emailError: LoginError?
    var passwordError: LoginError?
    
    mutating func clearErrors() {
        emailError = nil
        passwordError = nil
        emailErrorBorderColor = Color(.secondarySystemBackground)
        passwordErrorBorderColor = Color(.secondarySystemBackground)
    }
    
    mutating func isValid() -> Bool {
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
