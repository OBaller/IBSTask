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
    @Published  var password = ""
    @Published var invalidpassword = 0
    @Published var invalidusername = 0
    @Published var isEmailCriteriaValid = false
    @Published var isPasswordCriteriaValid = false
    @Published var canSubmit = false
    private var cancellableSet: Set<AnyCancellable> = []
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$")
    
//    init() {
//        $email
//            .map { email in
//                return self.emailPredicate.evaluate(with: email)
//            }
//            .assign(to: \.isEmailCriteriaValid, on: self)
//            .store(in: &cancellableSet)
//
//        $password
//            .map { password in
//                return self.passwordPredicate.evaluate(with: password)
//            }
//            .assign(to: \.isPasswordCriteriaValid, on: self)
//            .store(in: &cancellableSet)
//
//        Publishers.CombineLatest($isEmailCriteriaValid, $isPasswordCriteriaValid)
//            .map { isEmailCriteriaValid, isPasswordCriteriaValid in
//                return (isEmailCriteriaValid && isPasswordCriteriaValid)
//            }
//            .assign(to: \.canSubmit, on: self)
//            .store(in: &cancellableSet)
//    }
    
//    var emailPrompt: Color {
//        isEmailCriteriaValid ? Color.red : Color.clear
//    }
    
//    var passwordPrompt: Color {
//        isPasswordCriteriaValid ? Color.red : Color.clear
//    }
    
    func loginUser() {
//        print("Logging in \(email).")
//        email = ""
//        password = ""
        if email == "" {
            self.invalidusername += 1
            print("Username is required")
        } else if password == "" {
            self.invalidpassword += 1
            self.invalidusername = 0
            print("password is required")
        }else {
            self.invalidpassword = 0
            print("email : \(email) pass : \(password)")
        }
    }
}
