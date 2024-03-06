//
//  ScreenFive.swift
//  Test00001
//
//  Created by Vladimir Khalin on 27.02.2024.
//

import SwiftUI
import RealmSwift
import StoreKit

struct SettingsView: View {
    @State private var isEmptyScreen = true
    @State private var isSharing = false
    let contentToShare = "Share you App"
    
    @State var showAlert = false
    
    let titles = ["Share app", "Rate app", "Usage profile", "Reset progress"]
    let logos = ["square.and.arrow.up.fill", "star.fill", "doc.text.fill", "personalhotspot.circle"]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    
                    ZStack(alignment: .top){
                        ScrollView(showsIndicators: false) {
                            VStack {
                                ForEach(0...3, id: \.self) { cell in
                                    Button{
                                        switch cell {
                                        case 0: self.isSharing.toggle()
                                        case 1: requestAppReview()
                                        case 3: self.showAlert.toggle()
                                        default:
                                            print("")
                                        }
                                    } label: {
                                        SettingsCellView(logo: logos[cell], title: titles[cell])
                                            .frame(height: 111)
                                            .padding(.horizontal, 16)
                                    }
                                }
                            }
                            .sheet(isPresented: $isSharing) {
                                ShareAppView(shareItems: [contentToShare])
                            }
                            .alert(isPresented: self.$showAlert){
                                Alert(title: Text("Reset Confirmation"), message: Text("Your progress will be permanently reset. \n Do you really want to delite all data?"), primaryButton: Alert.Button.default(Text("Reset"), action: {
                                    deliteAllfromDb()
                                }), secondaryButton: Alert.Button.cancel(Text("Cancel"), action: {
                                    print("Cancel")
                                })
                                )
                            }
                        }
                        .padding(.top, 16)
                        .navigationTitle("Settings")
                    }
                }
            }
            .frame(width: width, height: height)
        }
    }
    private func deliteAllfromDb() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func requestAppReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}

#Preview {
    SettingsView()
        .environment(\.colorScheme, .dark)
}

