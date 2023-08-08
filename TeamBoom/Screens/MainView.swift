//
//  MainViewController.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 07.08.2023.
//

import SwiftUI

struct MainView: View {
	// MARK: - States & Properties

	@StateObject private var gameModel = GameModel()

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				VStack {
					Image("textBomb")
					Image("bomb")
					VStack(spacing: 15) {

						NavigationLink(destination: GameView(gameModel: gameModel)) {
							Text("Старт")
								.font(.system(size: 22, weight: .bold))
						}
						.frame(width: 274, height: 79)
						.background(.violet)
						.foregroundColor(.yellowGradient)
						.clipShape(RoundedRectangle(cornerRadius: 50))
						.shadow(radius: 15)

						NavigationLink(destination: CategoriesView(gameModel: gameModel)) {
							Text("Категории")
								.font(.system(size: 22, weight: .bold))
						}
						.frame(width: 274, height: 79)
						.background(.violet)
						.foregroundColor(.yellowGradient)
						.clipShape(RoundedRectangle(cornerRadius: 50))
						.shadow(radius: 15)

						HStack {
							Spacer()
							Image("question-mark")
								.padding(.trailing, 30)
						}
					}
				}
			}
		}
		.navigationBarTitle("Игра для компании", displayMode: .inline)
		.navigationBarTitleDisplayMode(.large)
	}
}

// MARK: - Preview

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
