//
//  ViewModel.swift
//  ModelsTraining
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

class GameViewModel: ObservableObject {

    @Published var selectedCategories: [Category] = []
    @Published var question = ""
    @Published var endGame = ""
    let nakazaniya: PunishModel = Bundle.main.decode("funnyActions.json")
    let kategorii: CategoryModel = Bundle.main.decode("categories.json")

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
