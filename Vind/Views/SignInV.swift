import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                // Email and Password Section
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemFill))
                    .cornerRadius(8)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemFill))
                    .cornerRadius(8)
                
                // Login with Email and Password Button
                Button(action: {
                    authenticationViewModel.login(email: email, password: password)
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                // Or Separator
                Spacer()
                // Sign in with Apple Button
//                Button(action: {
//                    // Handle Sign In with Apple
//                }) {
//                    HStack {
//                        Image(systemName: "applelogo")
//                            .foregroundColor(.white)
//                        Text("Sign In with Apple")
//                            .foregroundColor(.white)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: 50)
//                    .background(Color.black)
//                    .cornerRadius(8)
//                }
                
                // Sign in with Google Button
                Button(action: {
                    authenticationViewModel.signInGoogle()
                }) {
                    HStack {
                        Image("google_logo") // Assuming you have a 'google_logo' image asset
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("Sign In with Google")
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
                    SignUpView().navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                        
                        Text("Sign Up")
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

