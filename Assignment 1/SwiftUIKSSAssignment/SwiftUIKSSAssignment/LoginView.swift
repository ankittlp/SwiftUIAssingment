//
//  LoginView.swift
//  SwiftUIKSSAssignment
//
//  Created by Ankit Nigam on 15/06/24.
//

import SwiftUI
import Observation

@Observable
class LoginViewModel {
     var isLoggedIn: Bool = false
}

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @Environment(LoginViewModel.self) var loginViewModel: LoginViewModel
    var body: some View {
        Spacer()
        VStack(alignment: .center) {
            Image("Icon-App-60x60")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(.circle)
            Text("SwiftUI KSS Assignment")
                .font(.title)
        }
        VStack(alignment: .leading) {
            Text("Email")
            TextField("Enter your email here", text: $email).textFieldStyle(.roundedBorder)
            Text("Password")
            SecureField("Enter your password here", text: $password).textFieldStyle(.roundedBorder).padding(.bottom, 20)
            
            HStack {
                
                Spacer()
                VStack {
                    Button("Login") {
                        loginViewModel.isLoggedIn = true
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                    
                    Button("Forgot Password?") {
                        print("Forgot Password")
                    }
                }
                Spacer()
                
            
            }.frame(width: .infinity)
                
        }
        .padding(.all, 30.0)
        Spacer()
    }
}

#Preview {
    LoginView()
        .environment(LoginViewModel())
}
