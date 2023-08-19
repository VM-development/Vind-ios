//
//  AuthenticationS.swift
//  Vind
//
//  Created by Vadym Malakhatko on 17.08.2023.
//

import Foundation

protocol AuthenticationService {
    func signIn(email: String, password: String, completion: @escaping (User?, Error?) -> Void)
    func signInWithGoogle(completion: @escaping (User?, Error?) -> Void)
    //func loginWithApple()
    
    func signUp(email: String, password: String, completion: @escaping (User?, Error?) -> Void)
    
    func signOut() throws
}
