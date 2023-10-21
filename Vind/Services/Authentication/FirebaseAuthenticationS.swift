//
//  FirebaseAuthenticationS.swift
//  Vind
//
//  Created by Vadym Malakhatko on 17.08.2023.
//

import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift



class FirebaseAuthenticationService: AuthenticationService {
    @MainActor 
    func signInWithGoogle(completion: @escaping (User?, Error?) -> Void) {
        guard let topVC = Utilities.shared.topViewController() else {
            completion(nil, URLError(.cannotFindHost))
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: topVC, completion: { (result, error) in
            if let error = error {
                completion(nil, error)
            }
            else{
                guard let idToken = result?.user.idToken?.tokenString else {
                    completion(nil, URLError(.badServerResponse))
                    return
                }
                guard let accessToken = result?.user.accessToken.tokenString else {
                    completion(nil, URLError(.badServerResponse))
                    return
                }
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
                Auth.auth().signIn(with: credential, completion: { (authResult, error) in
                    completion(User(from: authResult?.user), error)
                })
            }
        })
    }
//    
//    if let error = error {
//        completion(nil, error)
//    } else {
//        guard let idToken = result?.user.idToken?.tokenString else {
//            completion(nil, URLError(.badServerResponse))
//            return
//        }
//        guard let accessToken = result?.user.accessToken.tokenString else {
//            completion(nil, URLError(.badServerResponse))
//            return
//        }
//        
//        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                       accessToken: accessToken)
//        Auth.auth().signIn(with: credential, completion: { (authResult, error) in
//            completion(User(from: authResult?.user), error)
//        })
//    }
    
    func signIn(email: String, password: String, completion: @escaping (User?, Error?) -> Void) {
//        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
//            completion(User(from: authResult?.user) , error)
//        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (User?, Error?) -> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//            if let user = authResult?.user {
//                let changeRequest = user.createProfileChangeRequest()
//                changeRequest.commitChanges { (error) in
//                    completion(User(from: user), error)
//                }
//            } else {
//                completion(nil, error)
//            }
//        }
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}


extension User {
    init?(from firebaseUser: FirebaseAuth.User?) {
        guard
            let id = firebaseUser?.uid,
            let email = firebaseUser?.email,
            let name = firebaseUser?.displayName
        else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.email = email
        self.password = ""
    }
}

extension User {
    init?(from gidSignInResult: GIDSignInResult?) {
        guard
            let id = gidSignInResult?.user.userID,
            let email = gidSignInResult?.user.profile?.email,
            let name = gidSignInResult?.user.profile?.name
        else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.email = email
        self.password = ""
    
    }
}
