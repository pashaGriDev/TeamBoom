//
//  LottieBombView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import Lottie
import SwiftUI

struct LottieBombView: UIViewRepresentable {
	// MARK: - Properties

	let name: String
	let loopMode: LottieLoopMode
	let animationSpeed: CGFloat

	// MARK: - Methods

	func makeUIView(context: Context) -> Lottie.LottieAnimationView {
		let animationView = LottieAnimationView(name: name)
		animationView.loopMode = loopMode
		animationView.animationSpeed = animationSpeed
		animationView.play()
		return animationView
	}

	func updateUIView(_ uiView: LottieAnimationView, context: Context) {

	}
}
