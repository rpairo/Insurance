//
//  Color+CustomColors.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 19/3/21.
//

import SwiftUI

extension Color {
    // MARK: Backgrounds
    public static var bgGreen: Color { Color(UIColor(named: "bg_green") ?? .green) }

    public static var bgMain: Color { Color(UIColor(named: "bg_main") ?? .white) }

    public static var bgSurfaceHighlight: Color { Color(UIColor(named: "bg_surface_highlight") ?? .purple) }

    public static var bgSurface: Color { Color(UIColor(named: "bg_surface") ?? .lightGray) }

    // MARK: Texts
    public static var textHighlight: Color { Color(UIColor(named: "txt_highlight") ?? .purple) }

    public static var textMinor: Color { Color(UIColor(named: "txt_minor") ?? .gray) }

    public static var textMinorMuted: Color { Color(UIColor(named: "txt_minorMuted") ?? .lightGray) }

    public static var textNormal: Color { Color(UIColor(named: "txt_normal") ?? .blue) }

    public static var textWhite: Color { Color(UIColor(named: "txt_white") ?? .white) }

    // MARK: UI
    public static var separator: Color { Color(UIColor(named: "separator") ?? .lightGray) }
}
