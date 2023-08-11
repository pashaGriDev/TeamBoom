//
//  CategoryModel.swift
//  ModelsTraining
//
//  Created by Artem on 07.08.2023.
//

import Foundation

struct CategoryModel: Codable {
	let categories: [Category]
}

struct Category: Codable {
//	let id: UUID = UUID()
	let title: String
	let image: String
	let questions: [String]
}
