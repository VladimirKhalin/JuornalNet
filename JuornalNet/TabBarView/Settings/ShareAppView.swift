//
//  ShareAppView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 04.03.2024.
//

import SwiftUI

struct ShareAppView: UIViewControllerRepresentable {
    let shareItems: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        return activityViewController
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
