//
//  ContentView.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 30/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var loginViewModel = LoginViewModel()
    @State private var showText: Bool = false
    @State private var emailString  : String = ""
    @State private var textEmail    : String = ""
    @State private var isEmailValid : Bool   = true
    
    var body: some View {
        VStack {
            HStack {
                TextField("Email", text: $loginViewModel.email)
            }
            .padding()
            .background(.bar)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(loginViewModel.invalidusername == 0 ? Color.clear : Color.red)
//                .foregroundColor(loginViewModel.emailPrompt)
            )
            .padding(.bottom, 20)
            .modifier(ShakeEffect(animatableData: CGFloat(loginViewModel.invalidusername)))
            
            HStack {
                if showText {
                    TextField("", text: $loginViewModel.password)
                }else {
                    SecureField("Password", text: $loginViewModel.password)
                }
                Button(action: {
                    showText.toggle()
                }, label: {
                    Image(systemName: showText ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                })
            }
            .padding()
            .background(.bar)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(loginViewModel.invalidpassword == 0 ? Color.clear : Color.red)
//                .foregroundColor(loginViewModel.passwordPrompt)
            )
            .padding(.bottom, 20)
            .modifier(ShakeEffect(animatableData: CGFloat(loginViewModel.invalidpassword)))
            
            
            Button(action: {
                withAnimation(.default) {
                    loginViewModel.loginUser()
                }
            }, label: {
                Text("Login")
                    .font(.headline).bold().foregroundColor(.white).padding()
                    .frame(height: 50)
                    .frame(width: UIScreen.main.bounds.width - 22)
                    .background(.black)
                    .cornerRadius(10)
                    
            })
            
        }.padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
