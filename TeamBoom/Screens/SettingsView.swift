//
//  SettingsView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 09.08.2023.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - States&Properties

    let columns = [GridItem(.adaptive(minimum: 155))]
    @StateObject  var gameModel: GameViewModel

    // MARK: - Init
    init(gameModel: GameViewModel) {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.tintColor
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.yellow
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        self._gameModel = StateObject(wrappedValue: gameModel)
    }
    // MARK: - UI

    var body: some View {
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
                .buttonStyle(ThemeAnimationStyle())
                .padding(.horizontal)
                Spacer()
                VStack(spacing: 30) {
                    Toggle("Игра с заданиями", isOn: $gameModel.withPunishment)
                        .toggleStyle(SwitchToggleStyle(tint: Color.violet))
                        .font(.custom(CustomFonts.DelaGothicOne, size: 20))
                        .foregroundColor(Color.violet)
                        .tint(Color.violet)
                    Toggle("Фоновая музыка", isOn: $gameModel.withBackgroundMusic)
                        .toggleStyle(SwitchToggleStyle(tint: Color.violet))
                        .font(.custom(CustomFonts.DelaGothicOne, size: 20))
                        .foregroundColor(Color.violet)
                        .tint(Color.violet)
                    VStack(alignment: .leading) {
                        Text("Мелодия")
                            .font(.custom(CustomFonts.DelaGothicOne, size: 20))
                            .foregroundColor(Color.violet)
                        Picker("", selection: $gameModel.backgroundSound) {
                            ForEach(gameModel.backgroundSounds.keys.sorted(), id: \.self) { key in
                                Text(key)
                                    .tag(gameModel.backgroundSounds[key] ?? "")
                            }
                        }
                        .pickerStyle(.segmented)
                        .background(.orangeGradient.opacity(0.1))
                    }

                    VStack(alignment: .leading) {
                        Text("Тиканье бомбы")
                            .font(.custom(CustomFonts.DelaGothicOne, size: 20))
                            .foregroundColor(Color.violet)
                        Picker("", selection: $gameModel.tickSound) {
                            ForEach(gameModel.tickSounds.keys.sorted(), id: \.self) { key in
                                Text(key)
                                    .tag(gameModel.tickSounds[key] ?? "")
                            }
                        }
                        .pickerStyle(.segmented)
                        .background(.orangeGradient.opacity(0.1))
                    }

                    VStack(alignment: .leading) {
                        Text("Взрыв бомбы")
                            .font(.custom(CustomFonts.DelaGothicOne, size: 20))
                            .foregroundColor(Color.violet)
                        Picker("", selection: $gameModel.explosionSound) {
                            ForEach(gameModel.bombSounds.keys.sorted(), id: \.self) { key in
                                Text(key)
                                    .tag(gameModel.bombSounds[key] ?? "")
                            }
                        }
                        .pickerStyle(.segmented)
                        .background(.orangeGradient.opacity(0.1))
                    }
                }
                Spacer()
                Spacer()
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
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
