//
//  MockService.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 09/10/2022.
//

import Foundation

class MockService {
    static let shared = MockService()
    
    func getData() -> [UserDetails] {
        return [
            UserDetails(name: Name(title: "Mrs", first: "Cassandra", last: "Leclercq"), location: Location(street: Street(number: 5526, name: "Rue Denfert-Rochereau"), city: "Dijon", state: "Côtes-D'Armor", country: "France"), email: "cassandra.leclercq@example.com", apiID: nil, picture: Picture(large: "https://randomuser.me/api/portraits/women/58.jpg", medium: "https://randomuser.me/api/portraits/med/women/58.jpg")),
            UserDetails(name: Name(title: "Mrs", first: "Sanja", last: "Maksimović"), location: Location(street: Street(number: 4312, name: "Marte Jorgović"), city: "Dimitrovgrad", state: "Toplica", country: "Serbia"), email: "sanja.maksimovic@example.com", apiID: nil, picture: Picture(large: "https://randomuser.me/api/portraits/women/39.jpg", medium: "https://randomuser.me/api/portraits/med/women/39.jpg")),
            UserDetails(name: Name(title: "Ms", first: "Débora", last: "Prieto"), location: Location(street: Street(number: 951, name: "Callejón Chiapas"), city: "Chapala", state: "San Luis Potosí", country: "Mexico"), email: "debora.prieto@example.com", apiID: nil, picture: Picture(large: "https://randomuser.me/api/portraits/women/79.jpg", medium: "https://randomuser.me/api/portraits/med/women/79.jpg"))
        ]
    }
}
