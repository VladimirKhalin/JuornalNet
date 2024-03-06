//
//  JuornalNetApp.swift
//  JuornalNet
//
//  Created by Vladimir Khalin on 05.03.2024.
//

import SwiftUI

@main
struct JuornalNetApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConsraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            SplashView()
        }
    }
}
