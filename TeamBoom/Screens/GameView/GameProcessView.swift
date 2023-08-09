//
//  GameProcessView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 08.08.2023.
//

import SwiftUI

struct GameProcessView: View {
	// MARK: - States&Properties

	private let gameModel: GameModel
	private let gameTime: Double

	// MARK: - Init

	init(gameModel: GameModel, gameTime: Double) {
		self.gameModel = gameModel
		self.gameTime = gameTime
	}

	// MARK: - UI

	var body: some View {
		VStack {
			Text(gameModel.question)
				.font(.title.bold())
				.foregroundColor(Color.violet)
				.frame(width: 300)
				.multilineTextAlignment(.center)
				.padding(.horizontal, 10)
			Spacer()
			LottieBombView(name: "animation1", loopMode: .playOnce, animationSpeed: 7.76/gameTime)
				.scaleEffect(1)
				.saturation(1.7)
				.animation(.easeIn, value: gameModel.isPlaying)
			Spacer()
			Button("Пауза") {
				player.stop()
				player2.stop()
			}
			.modifier(ButtonViewModifier())
			.padding(.bottom, 30)
		}
	}
}

// MARK: - Preview

struct GameProcessView_Previews: PreviewProvider {
	static var previews: some View {
		GameProcessView(gameModel: GameModel(), gameTime: 5.0)
	}
}
