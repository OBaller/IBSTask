//
//  UserDataView.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 12/10/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserDataView: View {
    @StateObject var userDataList = UserViewModel()
    @State private var search = ""
    
    var listData: [UserDetails] {
        if (userDataList.searchTerm.isEmpty) {
            return userDataList.userData
        } else {
            return userDataList.searchResults
        }
    }
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List(listData) { person in
                        ListCell(user: person)
                    }
                    .listStyle(PlainListStyle())
                    .animation(.default, value: userDataList.searchTerm)
                }
                .alert(item: $userDataList.apiError) { appAlert in
                    Alert(title: Text("Error"), message: Text("""
                                \(appAlert.errorString)
                                Please try again later!
                                """))
                }
                .searchable(text: $userDataList.searchTerm, placement: .navigationBarDrawer(displayMode: .always))
                
                if userDataList.isLoading {
                    ZStack {
                        Color(.white)
                            .opacity(0.3)
                            .ignoresSafeArea()
                        ProgressView("Fetching Random Persons")
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemBackground)))
                            .shadow(radius: 10)
                    }
                }
                
            }
            .navigationBarTitle(Text("Search"), displayMode: .inline)
        }

        
    }
}

struct UserDataView_Previews: PreviewProvider {
    static var previews: some View {
        UserDataView()
    }
}
