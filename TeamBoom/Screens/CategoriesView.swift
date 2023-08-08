//
//  CategoriesView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 07.08.2023.
//

import SwiftUI

struct CategoriesView: View {
	// MARK: - States & Properties

	private let gameModel: GameModel
	private let columns = [GridItem(.adaptive(minimum: 175))]

	// MARK: - Init

	init(gameModel: GameModel) {
		self.gameModel = gameModel
	}

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				ScrollView {
					LazyVGrid(columns: columns) {
						ForEach(gameModel.categories.categories, id: \.id) { category in
							Button {
								addCategory(category: category)
							} label: {
								ZStack {
									if isSelectedCategory(category: category) {
										VStack(alignment: .leading) {
											Image(systemName: "checkmark.circle.fill")
												.resizable()
												.frame(width: 30, height: 30)
												.foregroundColor(.white)
												.position(x: 30, y: 30)
										}
									}
									VStack {
										Image(category.image)
											.resizable()
											.frame(width: 100, height: 100)
										Text(category.title)
											.foregroundColor(Color.init(red: 1, green: 1, blue: 0))
											.font(.headline)
											.padding(.horizontal)
									}
								}
								.frame(width: 175, height: 175)
								.background(Color(red: 0.5, green: 0.18, blue: 0.65))
								.clipShape(RoundedRectangle(cornerRadius: 50))
								.overlay {
									RoundedRectangle(cornerRadius: 50)
										.stroke(.black)
								}
							}
						}
					}
				}
				.padding(.vertical)
			}
			.navigationTitle("Категории")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

// MARK: - Private methods

extension CategoriesView {
	private func addCategory(category: Category) {
		guard let index = gameModel.selectedCategories.firstIndex(where: { $0.id == category.id}) else {
			gameModel.selectedCategories.append(category)
			return
		}
		gameModel.selectedCategories.remove(at: index)
	}

	private func isSelectedCategory(category: Category) -> Bool {
		gameModel.selectedCategories.contains { $0.id == category.id}
	}
}

// MARK: - Preview

struct CategoriesView_Previews: PreviewProvider {
	static let gameModel = GameModel()

	static var previews: some View {
		CategoriesView(gameModel: GameModel())
	}
}
