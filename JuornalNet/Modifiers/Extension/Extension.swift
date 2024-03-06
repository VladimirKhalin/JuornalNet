//
//  Extension.swift
//  JuornalNet
//
//  Created by Vladimir Khalin on 05.03.2024.
//

import SwiftUI

extension View {
    func textEditorBackground(_content: Color) -> some View {
        if #available(iOS 16.0, *) {
            return self.scrollContentBackground(.hidden)
        } else {
            UITextView.appearance().backgroundColor = .clear
            return self.background(_content)
        }
    }
    
}
