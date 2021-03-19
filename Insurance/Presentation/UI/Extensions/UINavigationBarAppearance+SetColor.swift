//
//  UINavigationBarAppearance+SetColor.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import SwiftUI

extension UINavigationBarAppearance {
    func setColor(title: UIColor? = nil, background: UIColor? = nil) {
        configureWithTransparentBackground()

        if let titleColor = title {
            largeTitleTextAttributes = [.foregroundColor: titleColor]
            titleTextAttributes = [.foregroundColor: titleColor]
        }

        backgroundColor = background

        UINavigationBar.appearance().scrollEdgeAppearance = self
        UINavigationBar.appearance().standardAppearance = self
    }
}
