//
//  Animation Buttons.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 09.08.2023.
//

import SwiftUI

// MARK: - AnimationButtons

struct ThemeAnimationStyle: ButtonStyle {
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.scaleEffect(configuration.isPressed ? 0.85 : 1.0)
	}
}
