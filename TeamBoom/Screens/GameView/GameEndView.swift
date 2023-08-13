//
//  GameEndViewController.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 07.08.2023.
//

import SwiftUI

struct GameEndView: View {
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameViewModel

	private let timeIsOverTitle = "Время вышло!"
	private let taslTitle = "Проигравший выполняет задание"
	private var isPunishment: Bool {
		gameModel.withPunishment
	}

	// MARK: - UI

	var body: some View {
		VStack {
			Text(isPunishment ? taslTitle : timeIsOverTitle)
				.padding()
				.font(.custom(CustomFonts.DelaGothicOne, size: 24))
				.multilineTextAlignment(.center)
			Image("explosion")
				.resizable()
				.scaledToFit()
			if isPunishment {
				Text(gameModel.punishment)
					.padding()
					.foregroundColor(.violet)
					.font(.custom(CustomFonts.DelaGothicOne, size: 20))
					.minimumScaleFactor(0.7)
					.multilineTextAlignment(.center)
			}
			VStack(spacing: 15) {
				if gameModel.withPunishment {
					Button {
						gameModel.getPunishment()
					} label: {
						Text("Другое задание")
					}
					.customButtonEndViewStyle()
				}
				Button {
					restartGame()
				} label: {
					Text("Начать заново")
				}
				.customButtonEndViewStyle()
			}
			.font(.custom(CustomFonts.DelaGothicOne, size: 22))
			.padding(.bottom, 30)
		}
	}
}

// MARK: - Methods

extension GameEndView {
	private func restartGame() {
		gameModel.isPlaying = false
		gameModel.isOver = false
		gameModel.isPaused = false
	}
}

// MARK: - Preview

struct GameEndView_Previews: PreviewProvider {
	static var previews: some View {
		GameEndView(gameModel: GameViewModel())
	}
}
