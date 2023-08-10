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
	@State private var pressedLink: String? = nil

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
					.ignoresSafeArea()
				VStack {
					Spacer()
					Image("bomb")
						.scaledToFit()
						.frame(width: 400, height: 400)
						.scaleEffect(gameModel.isBombAnimating ? 0.70 : 0.80)
						.animation(Animation.easeInOut(duration: 2.7).repeatForever(autoreverses: true), value: gameModel.isBombAnimating)
						.onAppear {
							withAnimation {
								gameModel.startBombImageAnimation()
							}
						}
						.offset(y: -60)
					Spacer()
					Spacer()
					Spacer()
				}
				Spacer()
				VStack(spacing: 5) {
					Image("textBomb")
					Spacer()
					VStack(spacing: 5) {
						NavigationLink(destination: GameView(gameModel: gameModel, buttonPressed: pressedLink),
									   tag: "start",
									   selection: $pressedLink) {
							Text("Старт")
								.font(.custom(CustomFonts.DelaGothicOne, size: 22))
								.frame(width: 274, height: 79)
								.background(.violet)
								.foregroundColor(.yellowGradient)
								.clipShape(RoundedRectangle(cornerRadius: 50))
								.shadow(radius: 15)
						}
						.buttonStyle(ThemeAnimationStyle())

						NavigationLink(destination: GameView(gameModel: gameModel, buttonPressed: pressedLink),
									   tag: "continue",
									   selection: $pressedLink) {
							Text("Продолжить")
								.font(.custom(CustomFonts.DelaGothicOne, size: 22))
								.frame(width: 274, height: 79)
								.background(gameModel.isPaused ? .violet : .gray)
								.foregroundColor(.yellowGradient)
								.clipShape(RoundedRectangle(cornerRadius: 50))
								.shadow(radius: 15)
						}
						.buttonStyle(ThemeAnimationStyle())
						.disabled(!gameModel.isPaused)

						NavigationLink(destination: CategoriesView(gameModel: gameModel), label: {
							Text("Категории")
								.font(.custom(CustomFonts.DelaGothicOne, size: 22))
								.frame(width: 274, height: 79)
								.background(.violet)
								.foregroundColor(.yellowGradient)
								.clipShape(RoundedRectangle(cornerRadius: 50))
								.shadow(radius: 15)
						})
						.buttonStyle(ThemeAnimationStyle())

						HStack {
							NavigationLink(destination: SettingsView(gameModel: gameModel)) {
								Image("settings")
									.padding(.leading, 30)
							}
							Spacer()
							NavigationLink(destination: GameHelpView()) {
								Image("question-mark")
									.padding(.trailing, 30)
							}
						}
					}
				}
			}
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .principal) {
					VStack(spacing: 5) {
						Text("Игра для компании")
							.font(.custom(CustomFonts.DelaGothicOne, size: 30))
							.foregroundColor(.black)
					}
				}
			}
		}
	}
}
// MARK: - Preview

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
