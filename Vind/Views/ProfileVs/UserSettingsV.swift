//
//  UserSettingsV.swift
//  Vind
//
//  Created by Vadym Malakhatko on 22.10.2023.
//

import SwiftUI

struct UserSettingsV: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                authenticationViewModel.signOut()
            }) {
                       Text("Logout")
                           .font(.headline)
                           .padding()
                           .foregroundColor(.red)
                           .cornerRadius(8)
                   }
               }
               .padding()
    }
}

struct UserSettingsV_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsV().environmentObject(AuthenticationViewModel(authService: MockAuthenticationService()))
    }
}
