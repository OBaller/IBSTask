//
//  UserViewModel.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 05/10/2022.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var userData: [UserDetails] = []
    @Published var searchResults: [UserDetails] = []
    @Published var apiError: ApiError? = nil
    @Published var isLoading: Bool = false
    @Published var searchTerm = ""

    init() {
        self.isLoading = true
        for _ in (0 ... 2) {
            getUserData()
        }
        filteredUsers()
    }

    func stopActivityIndicatorLoading() {
        if self.userData.count == 3 {
            self.isLoading = false
        }
    }
    
    func getUserData() {
        let apiService: APIService = APIService.shared
       
        apiService.getJSON(urlString: "https://randomuser.me/api", completion: { (result: Result<User, APIService.APIError>) in
            switch result {
                
            case .success(let users):
                DispatchQueue.main.async {
                    self.userData.append(contentsOf: users.results)
                    self.stopActivityIndicatorLoading()
                }
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.apiError = ApiError(errorString: errorString)
                    }
                }
            }
        })
    }
    
    func filteredUsers() {
        $searchTerm
            .map { searchTerm in
                self.userData.filter({ users in
                    let fullName =
                    (users.name?.first?.lowercased() ?? "") + (users.name?.last?.lowercased() ?? "")
                    return fullName.contains(searchTerm.lowercased())

                })
            }
            .assign(to: &$searchResults)
    }
    
}
