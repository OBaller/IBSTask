//
//  TextFieldModel.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 09/10/2022.
//

import Foundation

struct TextFieldModel: Identifiable {
    var id = UUID()
    var input: String
    var isValidate: Bool = true
}
