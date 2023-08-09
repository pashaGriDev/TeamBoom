//
//  GameView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameView: View {
	// MARK: - States&Properties

	@StateObject private var gameModel: GameModel

	// MARK: - Init

	init(gameModel: GameModel) {
		self._gameModel = StateObject(wrappedValue: gameModel)
	}

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
		}
	}
}

// MARK: - Preview

struct GameView_Previews: PreviewProvider {

	static let gameModel = GameModel()
	static var previews: some View {
		GameView(gameModel: gameModel)
	}
}
