//
//  MenuButtonModifier.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 10.08.2023.
//

import SwiftUI

struct MenuButtonModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.custom(CustomFonts.DelaGothicOne, size: 22))
			.frame(width: 274, height: 79)
			.background(.violet)
			.foregroundColor(.yellowGradient)
			.clipShape(RoundedRectangle(cornerRadius: 50))
			.shadow(radius: 15)
	}
}
