//
//  CustomButtonEndViewStyle.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 13.08.2023.
//

import SwiftUI

struct CustomButtonEndViewStyle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 274, height: 79)
			.background(.violet)
			.foregroundColor(.yellowGradient)
			.clipShape(RoundedRectangle(cornerRadius: 50))
			.shadow(radius: 5, y: 5)
			.overlay {
				RoundedRectangle(cornerRadius: 50)
					.stroke(.black)
			}
	}
}

extension View {
	func customButtonEndViewStyle() -> some View {
		modifier(CustomButtonEndViewStyle())
	}
}
