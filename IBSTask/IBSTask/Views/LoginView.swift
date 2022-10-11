//
//  LoginView.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 30/09/2022.
//

import SwiftUI

struct LoginView: View {

    @State var isLinkActive = false
    @State var email: String = ""
    @State var password: String = ""
    @State var loginFormError = LoginFormError()
    @ObservedObject var loginVM: LoginViewModel

var body: some View {
    NavigationView {
        VStack(spacing: 18) {
            EntryField(placeholder: "Email", prompt: loginVM.emailError?.errorDescription ?? "", isPassword: false, borderColor: loginVM.emailErrorBorderColor, field: $loginVM.email)
            
            EntryField(placeholder: "Password", prompt: loginVM.passwordError?.errorDescription ?? "", isPassword: true, borderColor: loginVM.passwordErrorBorderColor, field: $loginVM.password)
            
            Button {
                if loginVM.isValid() {
                    loginVM.isAuthenticated = true
                }
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                    .background(.black.opacity(0.8))
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginVM: LoginViewModel())
    }
}
