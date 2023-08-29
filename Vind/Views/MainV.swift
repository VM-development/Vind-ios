//
//  MainV.swift
//  Vind
//
//  Created by Vadym Malakhatko on 29.08.2023.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 20) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.tag(0)
                
                ExploreView()
                    .tabItem {
                        Image(systemName: "wind.circle.fill")
                        Text("Find")
                    }.tag(1)
                
                CreateView()
                    .tabItem {
                        Image(systemName: "plus.diamond")
                        Text("Create")
                    }.tag(2)
                
                MessagesView()
                    .tabItem {
                        Image(systemName: "message.circle.fill")
                        Text("Messages")
                    }.tag(3)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }.tag(4)
                
                
                // Continue in the same pattern for the rest of your tabs...
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
