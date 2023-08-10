//
//  GameEndViewController.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 07.08.2023.
//

import SwiftUI

struct GameEndView: View {
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameModel

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				VStack {
					if gameModel.withPunishment {
						Text("Проигравший выполняет задание")
							.padding()
							.multilineTextAlignment(.center)
							.font(.custom(CustomFonts.DelaGothicOne, size: 24))
					} else {
						Text("Время вышло!")
							.padding()
							.multilineTextAlignment(.center)
							.font(.custom(CustomFonts.DelaGothicOne, size: 24))
					}
					Image("explosion")
					if gameModel.withPunishment {
						Text(gameModel.punishment)
							.padding()
							.foregroundColor(.violet)
							.font(.custom(CustomFonts.DelaGothicOne, size: 20))
							.multilineTextAlignment(.center)
					}
					VStack(spacing: 15) {
						if gameModel.withPunishment {
							Button {
								gameModel.getPunishment()
							} label: {
								Text("Другое задание")
									.font(.custom(CustomFonts.DelaGothicOne, size: 22))
							}
							.frame(width: 274, height: 79)
							.background(.violet)
							.foregroundColor(.yellowGradient)
							.clipShape(RoundedRectangle(cornerRadius: 50))
							.shadow(radius: 15)
						}
						Button {
							restartGame()
						} label: {
							Text("Начать заново")
								.font(.custom(CustomFonts.DelaGothicOne, size: 22))
						}
						.frame(width: 274, height: 79)
						.background(.violet)
						.foregroundColor(.yellowGradient)
						.clipShape(RoundedRectangle(cornerRadius: 50))
						.shadow(radius: 15)

					}
				}
			}
            
		}
        
        .navigationTitle("Title")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Игра")
                        .font(.custom(CustomFonts.DelaGothicOne, size: 30))
                        .foregroundColor(.violet)
                }
            }
        }
	}

	// MARK: - Methods

	private func restartGame() {
		gameModel.isPlaying = false
		gameModel.isOver = false
	}
}

// MARK: - Preview

struct GameEndView_Previews: PreviewProvider {
	static var previews: some View {
		GameEndView(gameModel: GameModel())
	}
}
