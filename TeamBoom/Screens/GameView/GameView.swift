//
//  GameView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameView: View {
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameModel
	var buttonPressed: String? = ""

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				if gameModel.isPlaying {
					if gameModel.isOver {
						GameEndView(gameModel: gameModel)
					} else {
						GameProcessView(gameModel: gameModel)
					}
				} else {
					GameStartView(gameModel: gameModel)
				}
			}
			.onAppear {
				if buttonPressed == "start" {
					gameModel.isPlaying = false
					gameModel.isPaused = false
					gameModel.isOver = false
				}
			}
		}
	}
}

// MARK: - Preview

struct GameView_Previews: PreviewProvider {

	static let gameModel = GameModel()
	static var previews: some View {
		GameView(gameModel: gameModel, buttonPressed: "")
	}
}
