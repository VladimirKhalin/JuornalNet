//
//  Modiviers.swift
//  Test00001
//
//  Created by Vladimir Khalin on 01.03.2024.
//

import Foundation
import SwiftUI

struct MiniButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFPro-Regular", size: 11))
            .foregroundColor(.white)
            .fixedSize()
            //.containerRelativeFrame(.vertical)
            .frame(height: 21)
            .padding(.horizontal, 6)
            .background(Color("article_cell_bg"))
            .cornerRadius(10.0)
    }
}
// .modifier(MiniButtonModifier())


struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
        }
    }
}
