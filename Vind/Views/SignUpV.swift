//
//  SignUpV.swift
//  Vind
//
//  Created by Vadym Malakhatko on 16.08.2023.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
//                Text("Sign Up")
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//                
//                // Email and Password Section
//                TextField("Email", text: $email)
//                    .padding()
//                    .background(Color(.secondarySystemFill))
//                    .cornerRadius(8)
//                
//                SecureField("Password", text: $password)
//                    .padding()
//                    .background(Color(.secondarySystemFill))
//                    .cornerRadius(8)
//                
//                // Login with Email and Password Button
//                Button(action: {
//                    authenticationViewModel.signUp(email: email, password: password)
//                }) {
//                    Text("Log In")
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity, maxHeight: 50)
//                        .background(Color.blue)
//                        .cornerRadius(8)
//                }
                
                // Or Separator
                Spacer()
                // Sign in with Apple Button
//                Button(action: {
//                    // Handle Sign In with Apple
//                }) {
//                    HStack {
//                        Image(systemName: "applelogo")
//                            .foregroundColor(.white)
//                        Text("Sign Up with Apple")
//                            .foregroundColor(.white)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: 50)
//                    .background(Color.black)
//                    .cornerRadius(8)
//                }
                
                // Sign in with Google Button
                Button(action: {
                    // Handle Sign In with Google
                }) {
                    HStack {
                        Image("google_logo") // Assuming you have a 'google_logo' image asset
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("Sign Up with Google")
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                
                NavigationLink  {
                    SignInView().navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Have an account?")
                            .font(.footnote)
                        
                        Text("Login")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
                
            }
            .padding(.all, 20)
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
