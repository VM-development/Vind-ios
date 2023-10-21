//
//  Login.swift
//  Vind
//
//  Created by Vadym Malakhatko on 16.08.2023.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var user: User? = User(id: "", name: "test", email: "test@test.com", password: "test")
    @Published var isAuthenticated = false
    
    private var authService: AuthenticationService
    
    init(authService: AuthenticationService) {
        self.authService = authService
    }
    
    func login(email: String, password: String) {
        authService.signIn(email: email, password: password) { [weak self] (user, error) in
            self?.user = user
            self?.isAuthenticated = user != nil
        }
    }
    
    func signInGoogle() {
        authService.signInWithGoogle() { [weak self] (user, error) in
            self?.user = user
            self?.isAuthenticated = user != nil
        }
    }
    
    func signUp(email: String, password: String) {
        authService.signUp(email: email, password: password) { [weak self] (user, error) in
            self?.user = user
            self?.isAuthenticated = user != nil
        }
    }
    
    func signOut() {
        do {
            try authService.signOut()
            self.user = nil
            self.isAuthenticated = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }

}
