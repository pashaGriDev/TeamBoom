//
//  GameModel.swift
//  ModelsTraining
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

final class GameModel: ObservableObject {

	// MARK: - States&Properties

	@Published var selectedCategories: [Category] = []
	@Published var question = ""
	@Published var punishment = ""
	@Published var isOver = false
	@Published var isPlaying = false

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
}
