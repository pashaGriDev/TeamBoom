//
//  NavigationBarBackButton.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 10.08.2023.
//
// swiftlint:disable multiple_closures_with_trailing_closure

import SwiftUI

struct CustomBackButton: View {
	// MARK: - States&Properties

	@Environment(\.presentationMode) var presentationMode

	// MARK: - UI

	var body: some View {
		Button(action: {
			presentationMode.wrappedValue.dismiss() // Симулировать действие "назад"
		}) {
			Image(systemName: "chevron.backward")
			// swiftlint:enable multiple_closures_with_trailing_closure
				.font(.title)
				.foregroundColor(.violet)
		}
	}
}
