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

	private let durations: [String: Double] = ["Короткое": 5.0, "Среднее": 10.0, "Длинное": 20.0, "Случайное": Double.random(in: 5...20)]
	private let punishments: PunishModel = Bundle.main.decode("funnyActions.json")
	let categories: CategoryModel = Bundle.main.decode("categories.json")
	// States
	let backgroundSounds: [String: String] = ["Мелодия 1": "backgroundMusic", "Мелодия 2": "backgroundMusic2", "Мелодия 3": "backgroundMusic3"]
	let tickSounds: [String: String] = ["Тикание 1": "ticking", "Тикание 2": "ticking2", "Тикание 3": "ticking3"]
	let bombSounds: [String: String] = ["Взрыв 1": "explosion", "Взрыв 2": "explosion2", "Взрыв 3": "explosion3"]
	// Game flags
	@Published var isOver = false
	@Published var isPlaying = false
	@Published var isPaused = false
	@Published var boomed = false
	@Published var isBombAnimating = false
	// Settings
	@Published var selectedCategories: [Category] = []
	@Published var selectedDuration: String = "Среднее"
	@Published var gameTime: Double = 10.0
	@Published var withBackgroundMusic: Bool = true
	@Published var withPunishment: Bool = true
	@Published var isBackgroundMusic: Bool = true
	@Published var backgroundSound: String = "backgroundMusic"
	@Published var tickSound: String = "ticking"
	@Published var explosionSound: String = "explosion"
	// Game properties
	@Published var count: Double = 0
	@Published var question = ""
	@Published var punishment = ""
	// Cancellables
	private var cancellables = Set<AnyCancellable>()

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

	func getCategories() -> [Category] {
		categories.categories
	}

	func getDurations() -> [String: Double] {
		durations
	}

	func changeDuration(duration: String) {
		selectedDuration = duration
		gameTime = durations[selectedDuration] ?? 0.0
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
						if withBackgroundMusic {
							player.pause()
						}

						player2.pause()
					}
				}
				if self.count >= 1.048*gameTime {
					for item in cancellables {
						if withBackgroundMusic {
							player.pause()
						}
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
