//
//  SettingsView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 09.08.2023.
//

import SwiftUI

struct SettingsView: View {
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameModel
	private let columns = [GridItem(.adaptive(minimum: 175))]

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				VStack(alignment: .leading) {
					Text("Время игры")
						.font(.custom(CustomFont.DelaGothicOne, size: 20))
						.foregroundColor(Color.violet)
					LazyVGrid(columns: columns) {
						ForEach(gameModel.getDurations().keys.sorted(), id: \.self) { duration in
							Button {
								changeDuration(duration: duration)
							} label: {
								Text(duration)
							}
							.font(.custom(CustomFont.DelaGothicOne, size: 16))
							.foregroundColor(gameModel.selectedDuration == duration ? .yellowOfButton : .violet)
							.frame(width: 150)
							.padding(.horizontal)
							.padding(.vertical)
							.background(gameModel.selectedDuration == duration ? .violet : .yellowOfButton)
							.cornerRadius(30)
							.opacity(1)
							.overlay {
								RoundedRectangle(cornerRadius: 30)
									.stroke(.black)
							}
						}
					}
					Spacer()
					VStack(spacing: 30) {
						Toggle("Игра с заданиями", isOn: $gameModel.withPunishment)
							.font(.custom(CustomFont.DelaGothicOne, size: 20))
							.foregroundColor(Color.violet)
							.tint(Color.violet)
						Toggle("Фоновая музыка", isOn: $gameModel.withBackgroundMusic)
							.font(.custom(CustomFont.DelaGothicOne, size: 20))
							.foregroundColor(Color.violet)
							.tint(Color.violet)

						HStack {
							Text("Фоновая музыка")
								.font(.custom(CustomFont.DelaGothicOne, size: 20))
								.foregroundColor(Color.violet)
							Spacer()
							Picker("", selection: $gameModel.backgroundSound) {
								ForEach(gameModel.backgroundSounds.keys.sorted(), id: \.self) { key in
									Text(key)
										.tag(gameModel.backgroundSounds[key] ?? "")
								}
							}
						}
						HStack {
							Text("Тиканье бомбы")
								.font(.custom(CustomFont.DelaGothicOne, size: 20))
								.foregroundColor(Color.violet)
							Spacer()
							Picker("", selection: $gameModel.tickSound) {
								ForEach(gameModel.tickSounds.keys.sorted(), id: \.self) { key in
									Text(key)
										.tag(gameModel.tickSounds[key] ?? "")
								}
							}
							.pickerStyle(.menu)
						}

						HStack {
							Text("Взрыв бомбы")
								.font(.custom(CustomFont.DelaGothicOne, size: 20))
								.foregroundColor(Color.violet)
							Spacer()
							Picker("", selection: $gameModel.explosionSound) {
								ForEach(gameModel.bombSounds.keys.sorted(), id: \.self) { key in
									Text(key)
										.tag(gameModel.bombSounds[key] ?? "")
								}
							}
						}
					}
					Spacer()
					Spacer()
					Spacer()
				}
				.padding(.horizontal)
			}
			.navigationTitle("Настройки")
			.navigationBarTitleDisplayMode(.inline)
		}
	}

	private func changeDuration(duration: String) {
		gameModel.changeDuration(duration: duration)
	}
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView(gameModel: GameModel())
	}
}
