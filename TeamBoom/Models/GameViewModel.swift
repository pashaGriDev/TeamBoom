//
//  GameModel.swift
//  ModelsTraining
//
//  Created by Artem on 07.08.2023.
//
// swiftlint:disable line_length
import Combine
import SwiftUI

final class GameViewModel: ObservableObject {

	// MARK: - States&Properties

	private let durations: [String: Double] = ["Короткое": 10.0, "Среднее": 20.0, "Длинное": 45.0, "Случайное": Double.random(in: 10...45)]
	private let punishments: PunishModel = Bundle.main.decode("funnyActions.json")
	private let categories: CategoryModel = Bundle.main.decode("categories.json")
	// States
	let backgroundSounds: [String: String] = ["Мелодия 1": "backgroundMusic", "Мелодия 2": "backgroundMusic2", "Мелодия 3": "backgroundMusic3"]
	let tickSounds: [String: String] = ["Тикание 1": "ticking", "Тикание 2": "ticking2", "Тикание 3": "ticking3"]
	let bombSounds: [String: String] = ["Взрыв 1": "explosion", "Взрыв 2": "explosion2", "Взрыв 3": "explosion3"]
	// Game flags
	@AppStorage("isOver") var isOver = false
	@AppStorage("isPlaying") var isPlaying = false
	@AppStorage("isPaused") var isPaused = false
	@AppStorage("boomed") var boomed = false
	@AppStorage("isBombAnimating") var isBombAnimating = false
	// Settings
    @Published var selectedCategories: [Category] = [] {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(selectedCategories) {
                UserDefaults.standard.set(encoded, forKey: "selectedCategories")
            }
        }
    }
	@AppStorage("selectedDuration") var selectedDuration: String = "Среднее"
	@AppStorage("gameTime") var gameTime: Double = 10.0
	@AppStorage("withBackgroundMusic") var withBackgroundMusic: Bool = true
	@AppStorage("withPunishment") var withPunishment: Bool = true
    @AppStorage("isBackgroundMusic") var isBackgroundMusic: Bool = true
	@AppStorage("backgroundSound") var backgroundSound: String = "backgroundMusic"
	@AppStorage("tickSound") var tickSound: String = "ticking"
	@AppStorage("explosionSound") var explosionSound: String = "explosion"
	// Game properties
	@AppStorage("count") var count: Double = 0
	@AppStorage("question") var question = ""
	@AppStorage("punishment") var punishment = ""
	// Cancellables
	private var cancellables = Set<AnyCancellable>()
    // swiftlint:enable line_length
	// MARK: - Init

	init() {

        if let savedItems = UserDefaults.standard.data(forKey: "selectedCategories") {
            let decoder = JSONDecoder()

            if let decodedItems = try? decoder.decode([Category].self, from: savedItems) {
                selectedCategories = decodedItems
                return
            }
        }

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
				count += 0.05
				if count >= gameTime*0.98 && !boomed {
					playSound(key: explosionSound, player: &player2)
					boomed = true
				}

				if isPaused {
					for item in cancellables {
						item.cancel()
						if withBackgroundMusic {
							player.pause()
						}
						player2.pause()
					}
				}

				if count >= 1.048*gameTime {
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
