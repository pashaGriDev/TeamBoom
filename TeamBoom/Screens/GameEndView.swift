//
//  GameEndViewController.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 07.08.2023.
//

import SwiftUI

struct GameEndView: View {
	// MARK: - UI

	var body: some View {
		NavigationView {
			ZStack {
				BackgroundGradientView()
				VStack {
					Text("Проигравший выполняет задание")
						.padding()
						.multilineTextAlignment(.center)
						.font(.system(size: 24, weight: .bold))
					Image("explosion")
					Text("В следующем раунде после каждого ответа хлопать в ладоши")
						.padding()
						.multilineTextAlignment(.center)
						.foregroundColor(.violet)
						.font(.system(size: 24, weight: .bold))
					VStack(spacing: 15) {
						Button {
							// Some code for another task...
						} label: {
							Text("Другое задание")
								.font(.system(size: 22, weight: .bold))
						}
						.frame(width: 274, height: 79)
						.background(.violet)
						.foregroundColor(.yellowGradient)
						.clipShape(RoundedRectangle(cornerRadius: 50))
						.shadow(radius: 15)

						Button {
							// Some code for restart game...
						} label: {
							Text("Начать заново")
								.font(.system(size: 22, weight: .bold))
						}
						.frame(width: 274, height: 79)
						.background(.violet)
						.foregroundColor(.yellowGradient)
						.clipShape(RoundedRectangle(cornerRadius: 50))
						.shadow(radius: 15)

					}
				}
			}
		}
		.navigationBarTitle("Игра для компании", displayMode: .inline)
		.navigationBarTitleDisplayMode(.large)
	}
}

// MARK: - Preview

struct GameEndView_Previews: PreviewProvider {
	static var previews: some View {
		GameEndView()
	}
}
