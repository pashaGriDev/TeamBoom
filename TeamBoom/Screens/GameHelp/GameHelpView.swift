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
						.modifier(MenuButtonModifier())
				}
				NavigationLink(destination: GameCategoriesView()) {
					Text("Категории")
						.modifier(MenuButtonModifier())
				}
				NavigationLink(destination: GameRulesView()) {
					Text("Настройки")
						.modifier(MenuButtonModifier())
				}
			}
			.toolbar {
				ToolbarItem(placement: .principal) {
					VStack {
						Text("Помощь")
							.modifier(ToolBarButtonModifer())
					}
				}
			}
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: CustomBackButton())
		}
	}
}

// MARK: - Preview

struct GameHelpView_Previews: PreviewProvider {
	static var previews: some View {
		GameHelpView()
	}
}
