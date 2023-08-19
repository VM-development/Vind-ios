//
//  VindApp.swift
//  Vind
//
//  Created by Vadym Malakhatko on 15.08.2023.
//

import SwiftUI
import FirebaseCore
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct VindApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel(authService: FirebaseAuthenticationService())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authenticationViewModel)
        }
    }
}
