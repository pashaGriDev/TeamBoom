//
//  MainViewController.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 07.08.2023.
//

import SwiftUI

struct MainView: View {
	// MARK: - States & Properties

	@StateObject private var gameModel = GameViewModel()
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
						.scaleEffect(gameModel.isBombAnimating ? 0.80 : 0.90)
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
					VStack(spacing: 7) {
						NavigationLink(destination: GameView(gameModel: gameModel, buttonPressed: pressedLink)
                            .onAppear(perform: {
                                gameModel.count = 0
                                gameModel.isPaused = false
                                gameModel.isPlaying = false
                            }),
									   tag: "start",
									   selection: $pressedLink) {
							Text(gameModel.isPaused ? "Рестарт" : "Старт")
								.modifier(MenuButtonModifier())
						}
						.buttonStyle(ThemeAnimationStyle())

						NavigationLink(destination: GameView(gameModel: gameModel, buttonPressed: pressedLink)
                            .onAppear(perform: {
                                if gameModel.count != 0 {
                                    if gameModel.withBackgroundMusic {
                                        playSound(key: gameModel.backgroundSound, player: &player)
                                    }
                                    playSound(key: gameModel.tickSound, player: &player2)
                                    gameModel.setUpTimer()
                                    gameModel.isPaused = false
                                }
                            }),
									   tag: "continue",
									   selection: $pressedLink) {
							Text("Продолжить")
								.font(.custom(CustomFonts.DelaGothicOne, size: 22))
								.frame(width: 274, height: 79)
								.background(gameModel.isPaused ? .violet : .gray)
								.foregroundColor(.yellowGradient)
								.clipShape(RoundedRectangle(cornerRadius: 50))
								.shadow(radius: 5, y: 5)
								.overlay {
									RoundedRectangle(cornerRadius: 50)
										.stroke(.black)
								}
						}
						.buttonStyle(ThemeAnimationStyle())
						.disabled(!gameModel.isPaused)

						NavigationLink(destination: CategoriesView(gameModel: gameModel), label: {
							Text("Категории")
								.modifier(MenuButtonModifier())
						})
						.buttonStyle(ThemeAnimationStyle())

						HStack {
							NavigationLink(destination: SettingsView(gameModel: gameModel)
                                .onAppear(perform: {
                                    gameModel.isOver = false
                                    gameModel.isPlaying = false
                                    gameModel.count = 0
                                    gameModel.isPaused = false
                                }),
                                           tag: "settings",
                                           selection: $pressedLink) {
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
