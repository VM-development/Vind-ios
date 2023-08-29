//
//  ProfileV.swift
//  Vind
//
//  Created by Vadym Malakhatko on 29.08.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        
        Button(action: {
            authenticationViewModel.signOut()
        }, label: {
            Text("Sign Out")
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
