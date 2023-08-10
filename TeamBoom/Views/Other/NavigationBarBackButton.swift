//
//  NavigationBarBackButton.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 10.08.2023.
//

import SwiftUI

struct CustomBackButton: View {
	// MARK: - States&Properties

	@Environment(\.presentationMode) var presentationMode

	// MARK: - UI

	var body: some View {
		Button(action: {
			presentationMode.wrappedValue.dismiss() // Симулировать действие "назад"
		}) {
			Image(systemName: "chevron.backward") // Используйте другую иконку или текст, если хотите
				.font(.title)
				.foregroundColor(.violet)
		}
	}
}
