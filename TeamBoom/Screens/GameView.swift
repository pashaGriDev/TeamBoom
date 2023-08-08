//
//  GameView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameView: View {
	// MARK: - States & Properties

	@State private var isGame = false
	@State private var isOver = false
	@State private var question = "How are you man? ddddddddoooppp"
	@State private var punishment = "Punishment"
	@ObservedObject var gameModel = GameModel()
	var gameTime = 7.0

	// MARK: - UI

	var body: some View {
		ZStack {
			BackgroundGradientView()
			if isGame {
				LottieBombView(name: "animation1", loopMode: .playOnce, animationSpeed: 7.76/gameTime)
					.scaleEffect(1)
					.saturation(1.7)
					.animation(.easeIn, value: isGame)
			}
			VStack {
				Text(gameModel.question)
					.frame(width: 300)
					.font(.largeTitle)
					.padding(.horizontal, 10)
					.opacity(isGame ? 1 : 0)
					.offset(y: isGame ? 50 : -100)
					.animation(.easeIn(duration: 0.8), value: isGame)
				if isOver {
					Text(gameModel.endGame)
						.padding()
						.font(.largeTitle)
						.opacity(isGame ? 0 : 1)
						.offset(y: isGame ? 100 : -100)
				}
				Spacer()
				Button("Start Game") {
					gameModel.updateSelections(index: 1)
					gameModel.askQuestion()
					isOver = false
					isGame.toggle()

					DispatchQueue.main.asyncAfter(deadline: .now() + gameTime) {
						isOver.toggle()
						isGame.toggle()
						gameModel.gameOver()
					}
				}
				.modifier(ButtonViewModifier())
				.padding(.bottom, 30)
				.opacity(isGame ? 0 : 1)
				.offset(x: isGame ? 300 : 0)
				.animation(.default, value: isGame)
			}
		}
	}
}

// MARK: - Preview

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView()
	}
}
