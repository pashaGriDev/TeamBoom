//
//  ButtonViewModifier.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameButtonModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title)
			.foregroundColor(.yellowOfButton)
			.padding(.horizontal, 70)
			.padding(.vertical, 20)
			.background(.violet)
			.cornerRadius(30)
			.opacity(1)
	}
}
