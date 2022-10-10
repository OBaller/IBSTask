//
//  UserViewModel.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 05/10/2022.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var personDataObjectList: [UserDetails] = []
    @Published var searchResults: [UserDetails] = []
    @Published var apiError: ApiError? = nil
    @Published var isLoading: Bool = false
    @Published var searchTerm = ""
    var tempPersonDataStore: [UserDetails] = []

    init() {
        self.isLoading = true
        for _ in (0 ... 2) {
            getPersonData()
        }
        filterPersonDataList()
    }

    func stopActivityIndicatorLoading() {
        if self.personDataObjectList.count == 3 {
            self.isLoading = false
        }
    }
    
    func getPersonData() {
        let apiService: APIService = APIService.shared
       
        apiService.getJSON(urlString: "https://randomuser.me/api", completion: { (result: Result<User, APIService.APIError>) in
            switch result {
                
            case .success(let person):
                DispatchQueue.main.async {
                    self.personDataObjectList.append(contentsOf: person.results)
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
    
    func filterPersonDataList() {
        $searchTerm
            .map { searchTerm in
                self.personDataObjectList.filter({ person in
                    let fullName =
                    (person.name?.first.lowercased() ?? "") + (person.name?.last.lowercased() ?? "")
                    return fullName.contains(searchTerm.lowercased())

                })
            }
            .assign(to: &$searchResults)
    }
    
}
