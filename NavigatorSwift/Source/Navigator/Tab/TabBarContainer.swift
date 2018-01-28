//
//  TabBarContainer.swift
//  NavigatorSwift
//
//  Created by Jose Maria Puerta on 8/9/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import UIKit

open class TabBarContainer: UITabBarController, ViewControllerContainer {

}

extension TabBarContainer {
	public var rootViewController: UIViewController {
		return self
	}

	public var firstLevelNavigationControllers: [UINavigationController] {
		let viewControllers = self.viewControllers ?? []
		return viewControllers.flatMap { $0 as? UINavigationController }
	}

	public var visibleNavigationController: UINavigationController {
		return selectedViewController as! UINavigationController
	}

	public func select(viewController: UIViewController) {
		selectedViewController = viewController
	}
}
