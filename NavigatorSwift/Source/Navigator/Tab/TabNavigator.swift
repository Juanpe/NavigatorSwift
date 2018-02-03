//
//  TabNavigator.swift
//  NavigatorSwift
//
//  Created by jmpuerta on 12/9/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import UIKit

final public class TabNavigator: Navigator, NavigatorPreviewing {
	public var previews: [UIView : (Preview, UIViewControllerPreviewing)] = [:]
	public let sceneProvider: SceneProvider
	public var sceneURLHandler: SceneURLHandler
	public let sceneOperationManager: SceneOperationManager

	public init(window: UIWindow,
				sceneProvider: SceneProvider = SceneProvider(),
				sceneURLHandler: SceneURLHandler = EmptySceneURLHandler()) {
		sceneOperationManager = SceneOperationManager(window: window)
		self.sceneProvider = sceneProvider
		self.sceneURLHandler = sceneURLHandler
	}
}

// MARK: - Public methods

public extension TabNavigator {
	public func setTabs(_ sceneContexts: [SceneContext]) {
		let views = sceneContexts
			.map(sceneProvider.scene)
			.map(buildViewController)

		if let tabBarContainer = sceneOperationManager.rootViewController as? TabBarContainer {
			tabBarContainer.viewControllers = views
		}
	}
}

// MARK: - Private methods

private extension TabNavigator {
	func buildViewController(scene: Scene) -> UIViewController {
		return UINavigationController(rootViewController: scene.view())
	}
}
