//
//  GameModel.swift
//  ModelsTraining
//
//  Created by Artem on 07.08.2023.
//

import Combine
import SwiftUI

final class GameModel: ObservableObject {

	// MARK: - States&Properties

	@Published var selectedCategories: [Category] = []
	@Published var question = ""
	@Published var punishment = ""
	@Published var isOver = false
	@Published var isPlaying = false
	@Published var isPaused = false
    @Published var boomed = false
	@Published var gameTime: Double = 15.0
    @Published var count: Double = 0
	@Published var isBackgroundMusic: Bool = true
	@Published var backgroundSound: String = "backgroundMusic"
	@Published var tickSound: String = "ticking"
	@Published var explosionSound: String = "explosion"
    private var cancellables = Set<AnyCancellable>()
    @Published var isBombAnimating = false

	private let punishments: PunishModel = Bundle.main.decode("funnyActions.json")
	let categories: CategoryModel = Bundle.main.decode("categories.json")

	// MARK: - Init

	init() {
		guard let startCategory = categories.categories.first else {
			fatalError("Error in decoding categories.json file")
		}
		selectedCategories.append(startCategory)
	}

	// MARK: - Methods

	func askQuestion() {
		question = selectedCategories.randomElement()?.questions.randomElement() ?? ""
	}

	func getPunishment() {
		punishment = punishments.punishments.randomElement() ?? ""
	}

    func setUpTimer() {
        Timer
            .publish(every: 0.05, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                self.count += 0.05
                if self.count >= gameTime*0.98 && !boomed {
                    playSound(key: "explosion", player: &player2)
                    boomed = true
                }

                if self.isPaused {
                    for item in cancellables {
                        item.cancel()
                        player.pause()
                        player2.pause()
                    }
                }
                if self.count >= 1.048*gameTime {
                    for item in cancellables {
                        player.pause()
                        item.cancel()
                        isPaused = true
                        isOver = true
                        boomed = false
                        count = 0
                        getPunishment()
                    }
                }
            }
            .store(in: &cancellables)
    }

    func startBombImageAnimation() {
            isBombAnimating = true
        }
}
