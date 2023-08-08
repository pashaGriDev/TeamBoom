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
	@Published var endGame = ""
	private let nakazaniya: PunishModel = Bundle.main.decode("funnyActions.json")
	private let kategorii: CategoryModel = Bundle.main.decode("categories.json")

	// MARK: - Methods

	func updateSelections(index: Int) {
		selectedCategories.append(kategorii.categories[index])
	}

	func askQuestion() {
		question = selectedCategories.randomElement()?.questions.randomElement() ?? ""
	}

	func gameOver() {
		endGame = nakazaniya.punishments.randomElement() ?? ""
	}
}
