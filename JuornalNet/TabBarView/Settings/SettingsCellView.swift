//
//  SettingsCellView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 27.02.2024.
//

import SwiftUI

struct SettingsCellView: View {
    @State var logo: String
    @State var title: String
    @State var colorRed = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
    
            HStack{
                VStack(alignment: .leading, spacing: 14){
                    Image(systemName: logo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 38, height: 41)
                    
                    Text(title)
                        .font(.subheadline)
                }
                .padding(.horizontal, 20)
                Spacer()
                }
                .foregroundColor(.white)
                .frame(width: width, height: height)
                .background(Color(colorRed ? "red_bg" : "card_bg"))
            .cornerRadius(30)   
        }
        .onAppear{
            if title == "Reset progress" {
                colorRed = true
            }
        }
    }
}

#Preview {
    SettingsCellView(logo: "square.and.arrow.up.fill", title: "Share app")
        .frame(width: 358, height: 111)
}
