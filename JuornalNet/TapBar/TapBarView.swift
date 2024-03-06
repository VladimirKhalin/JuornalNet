//
//  TapBarView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 27.02.2024.
//

import SwiftUI
import Combine

struct TapBarView: View {
   // @ObservedObject var router = TabRouter()
    @State private var two : String = "Two"
    @State private var selection: Int = 1
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "bg")
        }
    
    var body: some View {
       
        TabView(selection: $selection ) {
            //TabView(selection: $router.screen ) {
            ArticlesView()
                .tag(1)
                .tabItem { Label("Articles", systemImage: "doc.fill") }
             //   .environmentObject(router)
            
           
            EventsView()
                .tag(2)
                .tabItem { Label("Events", systemImage: "trophy.fill") }
               // .environmentObject(router)
            
            
           ButgetView()
                .tag(3)
                .tabItem { Label("Butget", systemImage: "dollarsign.circle.fill") }
              //  .environmentObject(router)
            
           PostsView()
                .tag(4)
                .tabItem { Label("Posts", systemImage: "doc.richtext.fill") }
             //   .environmentObject(router)
            
            SettingsView()
                 .tag(5)
                 .tabItem { Label("Settings", systemImage: "gearshape.fill") }
               //  .environmentObject(router)
            
        }
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    TapBarView()
}
