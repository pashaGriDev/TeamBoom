//
//  GameModel.swift
//  ModelsTraining
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

final class GameModel: ObservableObject {

	// MARK: - Properties

	@Published var selectedCategories: [Category] = []
	@Published var question = ""
	@Published var endGame = "Test punish"
	private let nakazaniya: PunishModel = Bundle.main.decode("funnyActions.json")
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

	func gameOver() {
		endGame = nakazaniya.punishments.randomElement() ?? ""
	}
}
