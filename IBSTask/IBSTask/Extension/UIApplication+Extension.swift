//
//  UIApplication+Extension.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 09/10/2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
