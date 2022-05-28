//
//  Extension.swift
//  NolaTravelApp
//
//  Created by Thenardo Ardo on 23/05/22.
//

import Foundation
import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
