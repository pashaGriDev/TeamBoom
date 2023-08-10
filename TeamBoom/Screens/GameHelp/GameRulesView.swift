//
//  GameRulesView.swift
//  TeamBoom
//
//  Created by Андрей Бородкин on 10.08.2023.
//

import SwiftUI

struct GameRulesView: View {
	// MARK: - States&Properties

	private var rulesArray = rules.components(separatedBy: "\n")

	// MARK: - UI

	var body: some View {
		ZStack {
			BackgroundGradientView()
			VStack {
				VStack(alignment: .center, spacing: 5) {
					ForEach(0..<rulesArray.count) { index in
						if index == 1 {
							RuleView(index: index + 1, content: rulesArray[index], buttonLabel: "Старт игры")
						}
						RuleView(index: index+1, content: rulesArray[index])
					}
					.padding(10)
				}
			}
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .principal) {
					VStack {
						Text("Правила игры")
							.font(.custom(CustomFonts.DelaGothicOne, size: 30))
							.foregroundColor(.violet)
					}
				}
			}
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: CustomBackButton())
		}
	}
}

// MARK: - Preview

struct GameRulesView_Previews: PreviewProvider {
	static var previews: some View {
		GameRulesView()
	}
}

// MARK: - RuleView

struct RuleView: View {

	var index: Int
	var content: String
	var buttonLabel: String?
	var withButton: Bool {
		if let label = buttonLabel {
			return !label.isEmpty ? true : false
		}
		return false
	}

	var body: some View {
		VStack {
			HStack {
				Text(String(index))
					.font(.custom(CustomFonts.DelaGothicOne, size: 22))
					.frame(width: 40, height: 40)
					.background(.violet)
					.foregroundColor(.yellowGradient)
					.clipShape(RoundedRectangle(cornerRadius: 50))
					.shadow(radius: 15)
				Text(content)
					.font(.custom(CustomFonts.DelaGothicOne, size: 15))
					.multilineTextAlignment(.center)
			}
			if withButton {
				Text(String(buttonLabel!))
					.font(.custom(CustomFonts.DelaGothicOne, size: 18))
					.frame(width: 150, height: 40)
					.background(.violet)
					.foregroundColor(.yellowGradient)
					.clipShape(RoundedRectangle(cornerRadius: 50))
					.shadow(radius: 15)
			}
		}
	}
}
