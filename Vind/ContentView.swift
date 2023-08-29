//
//  ContentView.swift
//  Vind
//
//  Created by Vadym Malakhatko on 15.08.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        switch viewModel.isAuthenticated {
          case true: MainView()
          case false: SignInView()
        }
      }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
