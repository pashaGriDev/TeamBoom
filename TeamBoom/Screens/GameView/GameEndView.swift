//
//  GameEndViewController.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 07.08.2023.
//

import SwiftUI

struct GameEndView: View {
    private let timeIsOverTitle = "Время вышло!"
    private let taslTitle = "Проигравший выполняет задание"
    
    private var isPunishment: Bool {
        gameModel.withPunishment
    }
    
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameViewModel

	// MARK: - UI

	var body: some View {
			VStack {
                Text(isPunishment ? taslTitle : timeIsOverTitle)
                    .padding()
                    .font(.custom(CustomFonts.DelaGothicOne, size: 24))
                
				Image("explosion")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
				if isPunishment {
					Text(gameModel.punishment)
                        .padding()
						.foregroundColor(.violet)
						.font(.custom(CustomFonts.DelaGothicOne, size: 20))
                        .minimumScaleFactor(0.7)
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
                .multilineTextAlignment(.center)
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

// MARK: - Modifier

struct CustomButtonEndViewStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 274, height: 79)
            .background(.violet)
            .foregroundColor(.yellowGradient)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .shadow(radius: 5, y: 5)
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.black)
            }
    }
}

extension View {
    func customButtonEndViewStyle() -> some View {
        modifier(CustomButtonEndViewStyle())
    }
}
