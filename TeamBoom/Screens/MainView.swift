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
                        .scaleEffect(gameModel.isBombAnimating ? 1.09 : 1.0)
                        .animation(Animation.easeInOut(duration: 2.7).repeatForever(autoreverses: true))
                                        .onAppear {
                                            gameModel.startBombImageAnimation()
                                        }
                                        .padding(.bottom, 15)
					VStack(spacing: 15) {
						NavigationLink(destination: GameView(gameModel: gameModel), label: {
							Text("Старт")
                                .font(.custom(CustomFont.DelaGothicOne, size: 22))
								.frame(width: 274, height: 79)
								.background(.violet)
								.foregroundColor(.yellowGradient)
								.clipShape(RoundedRectangle(cornerRadius: 50))
								.shadow(radius: 15)
						})
                        .buttonStyle(ThemeAnimationStyle())

						NavigationLink(destination: CategoriesView(gameModel: gameModel), label: {
							Text("Категории")
                                .font(.custom(CustomFont.DelaGothicOne, size: 22))
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
                            Button {
                                // Rules code.
                            } label: {
                                Image("question-mark")
                                    .padding(.trailing, 30)
                            }
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
