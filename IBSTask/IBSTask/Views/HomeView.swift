//
//  HomeView.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 04/10/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @StateObject private var userViewModel = UserViewModel()
    @State private var search = ""
    
    var listData: [UserDetails] {
        if (userViewModel.searchTerm.isEmpty) {
            return userViewModel.userData
        } else {
            return userViewModel.searchResults
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(listData, id: \.id) { users in
                        ListCell(user: users)
                    }
                }
                .listStyle(PlainListStyle())
                .alert(item: $userViewModel.apiError) { appAlert in
                    Alert(title: Text("Error"), message: Text("""
                                \(appAlert.errorString)
                                Please try again later!
                                """))
                }
                .searchable(text: $userViewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .always))
                
//                VStack {
//                    List(listData) { users in
//                        ListCell(user: users)
//                    }
//                    .listStyle(PlainListStyle())
//                    .animation(.default, value: userViewModel.searchTerm)
//                }
//                .alert(item: $userViewModel.apiError) { appAlert in
//                    Alert(title: Text("Error"), message: Text("""
//                                \(appAlert.errorString)
//                                Please try again later!
//                                """))
//                }
//                .searchable(text: $userViewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .always))
                
                if userViewModel.isLoading {
                    ZStack {
                        Color(.white)
                            .opacity(0.3)
                            .ignoresSafeArea()
                        ProgressView("Fetching Random Users")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
