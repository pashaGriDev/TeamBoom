//
//  Color + ext.swift
//  TeamBoom
//
//  Created by Павел Грицков on 07.08.23.
//

import SwiftUI

extension ShapeStyle where Self == Color {
	static var violet: Color {
		Color(red: 0.5, green: 0.18, blue: 0.56)
	}

	static var yellowOfButton: Color {
		Color(red: 0.98, green: 1.0, blue: 0)
	}

	static var yellowGradient: Color {
		Color(red: 0.96, green: 0.97, blue: 0.04)
	}

	static var orangeGradient: Color {
		Color(red: 1.0, green: 0.6, blue: 0.019).opacity(0.63)
	}
}
