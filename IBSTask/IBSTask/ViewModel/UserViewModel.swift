//
//  UserViewModel.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 05/10/2022.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
//    @Published var users: [UserDetails] = []
    @Published var users: UserDetails?


    private var cancellable: AnyCancellable?
    
    func getUsers() {
        cancellable = APIService.shared.getUsers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
//                    self.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished loading")
                }
            } receiveValue: { users in
                print(users)
                self.users = users
            }
    }
    
}
