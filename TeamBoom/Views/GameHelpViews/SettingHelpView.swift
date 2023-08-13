//
//  SettingHelpView.swift
//  TeamBoom
//
//  Created by Андрей Бородкин on 12.08.2023.
//

import SwiftUI

struct SettingHelpView: View {
	// MARK: - States&Properties

	var fontSize: CGFloat = 18
	var bullet: String?
	var bulletPoint: String

	var descriptiveBulletPoint: Bool
	var specialFormat: Bool?

	var body: some View {
		HStack(alignment: .top) {
			if let specialFormat = specialFormat, specialFormat == true {
				Text(bulletPoint)
					.font(.custom(CustomFonts.DelaGothicOne, size: 30))
					.foregroundColor(.violet)
					.multilineTextAlignment(.center)
			} else {
				BulletPoint(bullet: bullet)
				Text(bulletPoint)
					.font(.custom(CustomFonts.DelaGothicOne, size: fontSize))
					.foregroundColor(Color(.init(red: 60/255, green: 58/255, blue: 58/255, alpha: 1)))
					.multilineTextAlignment(.center)
			}
		}
	}

}

struct SettingHelpView_Previews: PreviewProvider {
	static var previews: some View {
		SettingHelpView(bulletPoint: "Testing", descriptiveBulletPoint: true)
	}
}
