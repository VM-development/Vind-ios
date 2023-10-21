//
//  MockAuthenticationS.swift
//  Vind
//
//  Created by Vadym Malakhatko on 21.09.2023.
//

import Foundation

class MockAuthenticationService: AuthenticationService {
    func signUp(email: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        completion(User(id: "", name: "test", email: email, password: password), nil)
    }
    
    func signOut() throws {
    }
    
    func signIn(email: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        completion(User(id: "", name: "test", email: email, password: password), nil)
    }
    
    func signInWithGoogle(completion: @escaping (User?, Error?) -> Void) {
        completion(User(id: "", name: "test", email: "", password: ""), nil)
    }
    
}
