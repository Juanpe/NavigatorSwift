//
//  DismissAllViewControllerOperation.swift
//  NavigatorSwift
//
//  Created by Jose Maria Puerta on 8/9/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

class DismisAllViewControllerOperation: SceneOperation {
	fileprivate let animated: Bool
	fileprivate let renderer: SceneRenderer

	init(animated: Bool, renderer: SceneRenderer) {
		self.animated = animated
		self.renderer = renderer
	}
}

// MARK: SceneOperation methods

extension DismisAllViewControllerOperation  {
	func execute(with completion: CompletionBlock?) {
		renderer.rootViewController.dismiss(animated: animated, completion: completion)

		if !animated {
			completion?()
		}
	}
}
