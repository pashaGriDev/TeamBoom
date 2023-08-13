//
//  ButtonViewModifier.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameButtonModifier: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		HStack {
			configuration.label
		}
		.font(.custom(CustomFonts.DelaGothicOne, size: 20))
		.foregroundColor(.yellowOfButton)
		.padding(.horizontal, 70)
		.padding(.vertical, 20)
		.background(.violet)
		.cornerRadius(30)
		.opacity(1)
		.shadow(radius: 5, y: 5)
		.overlay {
			RoundedRectangle(cornerRadius: 30)
				.stroke(.black)
		}
	}
}
