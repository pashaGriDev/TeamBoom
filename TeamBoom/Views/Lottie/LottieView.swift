//
//  LottieView.swift
//  TeamBoom
//
//  Created by Artem on 08.08.2023.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
	// MARK: - Properties

	let name: String
	let loopMode: LottieLoopMode
	let animationSpeed: CGFloat
	let contentMode: UIView.ContentMode
	let isPaused: Bool
	let animationView: LottieAnimationView
    let progress: Double

	// MARK: - Init

	init(name: String,
        loopMode: LottieLoopMode = .playOnce,
        animationSpeed: CGFloat = 1,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        isPaused: Bool, progress: Double) {
		self.name = name
		self.animationView = LottieAnimationView(name: name)
		self.loopMode = loopMode
		self.animationSpeed = animationSpeed
		self.contentMode = contentMode
		self.isPaused = isPaused
        self.progress = progress
	}

	// MARK: - Methods

	func makeUIView(context: Context) -> UIView {
		let view = UIView(frame: .zero)
		view.addSubview(animationView)
		animationView.contentMode = contentMode
		animationView.translatesAutoresizingMaskIntoConstraints = false
		animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
		animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		animationView.loopMode = loopMode
		animationView.animationSpeed = animationSpeed
		return view
	}

	func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
		if isPaused {
			context.coordinator.parent.animationView.pause()
		} else {
			context.coordinator.parent.animationView.play(fromFrame: progress*480, toFrame: 480)
		}
	}

	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}

	// MARK: - Coordinator

	final class Coordinator: NSObject {
		var parent: LottieView

		init(_ parent: LottieView) {
			self.parent = parent
		}
	}
}
