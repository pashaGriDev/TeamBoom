//
//  ToolBarButtonModifer.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 10.08.2023.
//

import SwiftUI

struct ToolBarButtonModifer: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.custom(CustomFonts.DelaGothicOne, size: 30))
			.foregroundColor(.violet)
	}
}

