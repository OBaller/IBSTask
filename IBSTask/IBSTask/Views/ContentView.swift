//
//  ContentView.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 30/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authentication = LoginViewModel()
    var body: some View {
        if self.authentication.isAuthenticated {
            HomeView()
        } else {
            LoginView(loginVM: self.authentication)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
