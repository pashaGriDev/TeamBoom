//
//  Color.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    var violet: Color {
        Color(red: 0.5, green: 0.18, blue: 0.56)
    }

    var yellowOfButton: Color {
        Color(red: 0.98, green: 1.0, blue: 0)
    }
    
    var yellowGradient: Color {
        Color(red: 0.96, green: 0.97, blue: 0.04)
    }
    
    var orangeGradient: Color {
        Color(red: 1.0, green: 0.6, blue: 0.019).opacity(0.63)
    }

}

