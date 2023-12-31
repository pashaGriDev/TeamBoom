//
//  CategoriesView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 07.08.2023.
//

import SwiftUI

struct CategoriesView: View {
	// MARK: - States & Properties

	@ObservedObject var gameModel: GameViewModel
	private let columns = [GridItem(.adaptive(minimum: 175))]

	// MARK: - UI

	var body: some View {
		ZStack {
			BackgroundGradientView()
			VStack {
				ScrollView(showsIndicators: false) {
					LazyVGrid(columns: columns) {
						ForEach(gameModel.getCategories(), id: \.title) { category in
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
										Image(systemName: category.image)
											.resizable()
											.frame(width: 60, height: 60)
											.foregroundColor(.yellowOfButton)
										Text(category.title)
											.foregroundColor(.yellowOfButton)
											.font(.custom(CustomFonts.DelaGothicOne, size: 16))
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
							.buttonStyle(ThemeAnimationStyle())
							.padding(.vertical, 4)
							.shadow(radius: 5, y: 5)
						}
					}
					.padding()
				}
				.padding(.top, 32)
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .principal) {
				VStack {
					Text("Категории")
						.modifier(ToolBarButtonModifer())
				}
			}
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: CustomBackButton())
	}
}

// MARK: - Methods

extension CategoriesView {
	private func addCategory(category: Category) {
		guard let index = gameModel.selectedCategories.firstIndex(where: { $0.title == category.title}) else {
			gameModel.selectedCategories.append(category)
			return
		}
		if gameModel.selectedCategories.count < 2 {
			return
		}
		gameModel.selectedCategories.remove(at: index)
	}

	private func isSelectedCategory(category: Category) -> Bool {
		gameModel.selectedCategories.contains { $0.title == category.title}
	}
}

// MARK: - Preview

struct CategoriesView_Previews: PreviewProvider {
	static let gameModel = GameViewModel()

	static var previews: some View {
		CategoriesView(gameModel: GameViewModel())
	}
}
