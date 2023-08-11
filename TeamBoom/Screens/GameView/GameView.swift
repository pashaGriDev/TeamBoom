//
//  GameView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct GameView: View {
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameViewModel
	var buttonPressed: String? = ""
    @Environment(\.dismiss) private var dismiss

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
                if gameModel.isPlaying || gameModel.count != 0 {
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
        .navigationTitle("Игра")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    if !gameModel.isOver && gameModel.isPlaying {
                        gameModel.isPaused = true
                        player2.pause()
                        if gameModel.withBackgroundMusic {
                            player.pause()
                        }
                    }
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.violet)
                            .font(.title)
                    }
                }
            }
        }
	}
}

// MARK: - Preview

struct GameView_Previews: PreviewProvider {
	static let gameModel = GameViewModel()

	static var previews: some View {
		GameView(gameModel: gameModel, buttonPressed: "")
	}
}
