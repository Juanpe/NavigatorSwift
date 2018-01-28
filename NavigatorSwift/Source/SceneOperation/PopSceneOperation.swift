//
//  PopSceneOperation.swift
//  NavigatorSwift
//
//  Created by Jose Maria Puerta on 8/9/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import UIKit

struct PopSceneOperation: VisibleViewControllerFindable {
	fileprivate let popToRoot: Bool
	fileprivate let animated: Bool
	fileprivate let manager: SceneOperationManager

	init(toRoot popToRoot: Bool, animated: Bool, manager: SceneOperationManager) {
		self.popToRoot = popToRoot
		self.animated = animated
		self.manager = manager
	}
}

// MARK: SceneOperation methods

extension PopSceneOperation: SceneOperation {
	func execute(with completion: CompletionBlock?) {
		logTrace("[PopSceneOperation] Executing operation")

		let visibleViewController = self.visibleViewController(from: manager.rootViewController)

		guard let navigationController = visibleViewController.navigationController else {
			logTrace("[PopSceneOperation] No navigation controller found in the most visible view controller \(visibleViewController)")
			completion?()
			return
		}

		if popToRoot {
			logTrace("[PopSceneOperation] Popping to root")
			navigationController.popToRootViewController(animated: animated)
		} else {
			navigationController.popViewController(animated: animated)
		}

		let animationTime: TimeInterval = animated ? UIView.defaultAnimationDuration : 0.0

		DispatchQueue.main.asyncAfter(deadline: .now() + animationTime) {
			completion?()
		}
	}
}
