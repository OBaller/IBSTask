//
//  String+Extension.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 09/10/2022.
//

import Foundation

extension String {
    var isEmailValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
    
    var isPasswordValid: Bool {
        let passwordRegex = "[A-Za-z]{6,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return predicate.evaluate(with: self)
    }
}
