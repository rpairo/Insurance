//
//  View+NavigationBarColor.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 21/3/21.
//

import SwiftUI

struct NavigationBarColor: ViewModifier {
    // MARK: Constructor
    init(background: UIColor, title: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = background
        coloredAppearance.titleTextAttributes = [.foregroundColor: title]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: title]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = title
    }

    // MARK: Views
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBar(background: Color, title: Color) -> some View {
        self.modifier(
            NavigationBarColor(
                background: UIColor(background),
                title: UIColor(title)
            )
        )
    }
}
