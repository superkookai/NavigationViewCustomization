//
//  MainView.swift
//  NavigationViewCustomization
//
//  Created by Weerawut Chaiyasomboon on 10/12/2567 BE.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ColorView()
                .tabItem {
                    Text("Colors")
                    Image(systemName: "paintpalette")
                }
                .tag(0)
                
            
            AccountView()
                .tabItem {
                    Text("Account")
                    Image(systemName: "person.circle")
                }
                .tag(1)
                
        }
        .tint(.black)
        
    }
}

#Preview {
    MainView()
}

struct AccountView: View {
    var body: some View { Text("Account") }
}
