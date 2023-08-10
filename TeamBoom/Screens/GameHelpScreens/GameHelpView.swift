//
//  GameHelpView.swift
//  TeamBoom
//
//  Created by Андрей Бородкин on 10.08.2023.
//

import SwiftUI

struct GameHelpView: View {
	// MARK: - UI

	var body: some View {
		ZStack {
			BackgroundGradientView()
			VStack(spacing: 15) {
				NavigationLink(destination: GameRulesView()) {
					Text("Правила игры")
						.font(.custom(CustomFonts.DelaGothicOne, size: 22))
						.frame(width: 274, height: 79)
						.background(.violet)
						.foregroundColor(.yellowGradient)
						.clipShape(RoundedRectangle(cornerRadius: 50))
						.shadow(radius: 15)
				}
				NavigationLink(destination: GameRulesView()) {
					Text("Категории")
						.font(.custom(CustomFonts.DelaGothicOne, size: 22))
						.frame(width: 274, height: 79)
						.background(.violet)
						.foregroundColor(.yellowGradient)
						.clipShape(RoundedRectangle(cornerRadius: 50))
						.shadow(radius: 15)
				}
				NavigationLink(destination: GameRulesView()) {
					Text("Настройки")
						.font(.custom(CustomFonts.DelaGothicOne, size: 22))
						.frame(width: 274, height: 79)
						.background(.violet)
						.foregroundColor(.yellowGradient)
						.clipShape(RoundedRectangle(cornerRadius: 50))
						.shadow(radius: 15)
				}
			}
			.toolbar {
				ToolbarItem(placement: .principal) {
					VStack {
						Text("Помощь")
							.font(.custom(CustomFonts.DelaGothicOne, size: 40))
							.foregroundColor(Color.violet)
					}
				}
			}
		}
	}
}

// MARK: - Preview

struct GameHelpView_Previews: PreviewProvider {
	static var previews: some View {
		GameHelpView()
	}
}
