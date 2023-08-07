//
//  ButtonViewModifier.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct ButtonViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(.violet)
            .padding()
            .background(.yellowOfButton)
            .padding()
            .background(.orangeGradient)
            .padding()
            .background(.yellowGradient)
    }
}
