//
//  TapBarView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 27.02.2024.
//

import SwiftUI
import Combine

struct TapBarView: View {
    @State private var two : String = "Two"
    @State private var selection: Int = 1
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "bg")
        }
    
    var body: some View {
       
        TabView(selection: $selection ) {
            ArticlesView()
                .tag(1)
                .tabItem { Label("Articles", systemImage: "doc.fill") }
            
            EventsView()
                .tag(2)
                .tabItem { Label("Events", systemImage: "trophy.fill") }
              
           ButgetView()
                .tag(3)
                .tabItem { Label("Butget", systemImage: "dollarsign.circle.fill") }
            
           PostsView()
                .tag(4)
                .tabItem { Label("Posts", systemImage: "doc.richtext.fill") }
            
            SettingsView()
                 .tag(5)
                 .tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    TapBarView()
}
