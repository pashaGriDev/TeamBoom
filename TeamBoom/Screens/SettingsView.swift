//
//  SettingsView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 09.08.2023.
//

import SwiftUI

struct SettingsView: View {
	// MARK: - States&Properties

	@State var withPunishment: Bool = false
	@State var withBackgroundMusic: Bool = false
	@State private var backgroundMusic: [String] = ["Мелодия 1", "Мелодия 2", "Мелодия 3"]
	@State private var tickSound: [String] = ["Тикание 1", "Тикание 2", "Тикание 3"]
	@State private var bombSound: [String] = ["Взрыв 1", "Взрыв 2", "Взрыв 3"]

	private let columns = [GridItem(.adaptive(minimum: 175))]
	private let durations = ["Короткое", "Среднее", "Длинное", "Случайное"]

	private let selectedDuration: String = "Короткое"

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				VStack (alignment: .leading) {
					Text("Время игры")
						.font(.system(size: 20).bold())
						.foregroundColor(Color.violet)
					LazyVGrid(columns: columns) {
						ForEach(durations, id: \.self) { duration in
							Button {
							} label: {
								Text(duration)
							}
							.font(.system(size: 16).bold())
							.foregroundColor(.yellowOfButton)
							.frame(width: 150)
							.padding(.horizontal)
							.padding(.vertical)
							.background(.violet)
							.cornerRadius(30)
							.opacity(1)
						}
					}
					Spacer()
					Toggle("Игра с заданиями", isOn: $withPunishment)
						.padding(.horizontal)
						.font(.system(size: 20).bold())
						.foregroundColor(Color.violet)
					Toggle("Фоновая музыка", isOn: $withBackgroundMusic)
						.padding(.horizontal)
						.font(.system(size: 20).bold())
						.foregroundColor(Color.violet)

					HStack {
						Text("Фоновая музыка")
							.font(.system(size: 20).bold())
							.foregroundColor(Color.violet)
						Spacer()
						Picker("", selection: $backgroundMusic) {
							ForEach(backgroundMusic, id: \.self) { melody in
								Text(melody)
							}
						}
					}

					HStack {
						Text("Тиканье бомбы")
							.font(.system(size: 20).bold())
							.foregroundColor(Color.violet)
						Spacer()
						Picker("", selection: $backgroundMusic) {
							ForEach(tickSound, id: \.self) { sound in
								Text(sound)
							}
						}
					}

					HStack {
						Text("Взрыв бомбы")
							.font(.system(size: 20).bold())
							.foregroundColor(Color.violet)
						Spacer()
						Picker("", selection: $bombSound) {
							ForEach(bombSound, id: \.self) { sound in
								Text(sound)
							}
						}
					}
					Spacer()
					Spacer()
				}
				.padding(.horizontal)
			}
			.navigationTitle("Настройки")
		}
	}
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
