//
//  SettingsView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 09.08.2023.
//

import SwiftUI

struct SettingsView: View {
	// MARK: - States&Properties

	@ObservedObject var gameModel: GameViewModel
	private let columns = [GridItem(.adaptive(minimum: 155))]

	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				VStack(alignment: .leading) {
					Text("Время игры")
						.font(.custom(CustomFonts.DelaGothicOne, size: 20))
						.foregroundColor(Color.violet)
						.shadow(radius: 5, y: 5)
					LazyVGrid(columns: columns) {
						ForEach(gameModel.getDurations().keys.sorted(), id: \.self) { duration in
							Button(duration) {
								changeDuration(duration: duration)
							}
							.font(.custom(CustomFonts.DelaGothicOne, size: 16))
							.foregroundColor(gameModel.selectedDuration == duration ? .yellowOfButton : .violet)
							.frame(width: 130)
							.padding()
							.background(gameModel.selectedDuration == duration ? .violet : .yellowOfButton)
							.cornerRadius(30)
							.opacity(1)
							.overlay {
								RoundedRectangle(cornerRadius: 30)
									.stroke(.black)
							}
						}
						.shadow(radius: 5, y: 5)
					}
					.padding(.horizontal)
					Spacer()
					VStack(spacing: 30) {
						Toggle("Игра с заданиями", isOn: $gameModel.withPunishment)
							.font(.custom(CustomFonts.DelaGothicOne, size: 20))
							.foregroundColor(Color.violet)
							.tint(Color.violet)
						Toggle("Фоновая музыка", isOn: $gameModel.withBackgroundMusic)
							.font(.custom(CustomFonts.DelaGothicOne, size: 20))
							.foregroundColor(Color.violet)
							.tint(Color.violet)

						HStack {
							Text("Фоновая музыка")
								.font(.custom(CustomFonts.DelaGothicOne, size: 20))
								.foregroundColor(Color.violet)
							Spacer()
							Picker("", selection: $gameModel.backgroundSound) {
								ForEach(gameModel.backgroundSounds.keys.sorted(), id: \.self) { key in
									Text(key)
										.tag(gameModel.backgroundSounds[key] ?? "")
								}
							}
							.tint(.black)
						}

						HStack {
							Text("Тиканье бомбы")
								.font(.custom(CustomFonts.DelaGothicOne, size: 20))
								.foregroundColor(Color.violet)
							Spacer()
							Picker("", selection: $gameModel.tickSound) {
								ForEach(gameModel.tickSounds.keys.sorted(), id: \.self) { key in
									Text(key)
										.tag(gameModel.tickSounds[key] ?? "")
								}
							}
							.tint(.black)
						}

						HStack {
							Text("Взрыв бомбы")
								.font(.custom(CustomFonts.DelaGothicOne, size: 20))
								.foregroundColor(Color.violet)
							Spacer()
							Picker("", selection: $gameModel.explosionSound) {
								ForEach(gameModel.bombSounds.keys.sorted(), id: \.self) { key in
									Text(key)
										.tag(gameModel.bombSounds[key] ?? "")
								}
							}
							.tint(.black)
						}
					}
					Spacer()
					Spacer()
					Spacer()
				}
				.padding(.horizontal)
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .principal) {
				VStack {
					Text("Настройки")
						.modifier(ToolBarButtonModifer())
				}
			}
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: CustomBackButton())
	}
}

// MARK: - Methods

extension SettingsView {
	private func changeDuration(duration: String) {
		gameModel.changeDuration(duration: duration)
	}
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView(gameModel: GameViewModel())
	}
}
