//
//  CategoriesView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 07.08.2023.
//

import SwiftUI

struct CategoriesView: View {
	// MARK: - States & Properties

	let categories = ["Category1",
					  "Category2",
					  "Category3",
					  "Category4",
					  "Category5",
					  "Category6"]

	private let columns = [
		GridItem(.adaptive(minimum: 175))
	]

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				ScrollView {
					LazyVGrid(columns: columns) {
						ForEach(categories, id: \.self) { category in
							Button {
								// Добавить логику выбора категории + логика отображения checkmark
								toggleCategory()
							} label: {
								ZStack {
									VStack(alignment: .leading) {
										Image(systemName: "checkmark.circle.fill")
											.resizable()
											.frame(width: 30, height: 30)
											.foregroundColor(.white)
											.position(x: 30, y: 30)
									}
									VStack {
										Image(category)
											.resizable()
											.frame(width: 100, height: 100)
										Text(category)
											.foregroundColor(Color.init(red: 1, green: 1, blue: 0))
											.font(.headline)
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
		}
	}

}

// MARK: - Private methods

extension CategoriesView {
	private func toggleCategory() {

	}
}

// MARK: - Preview

struct CategoriesView_Previews: PreviewProvider {
	static var previews: some View {
		CategoriesView()
	}
}
