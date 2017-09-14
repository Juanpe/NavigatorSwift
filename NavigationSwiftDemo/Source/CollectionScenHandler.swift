//
//  CollectionScenHandler.swift
//  NavigatorSwift
//
//  Created by jmpuerta on 3/9/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import NavigatorSwift
import UIKit

extension SceneName {
	static let collection: SceneName = "Collection"
}

class CollectionScenHandler: SceneHandler {
	var name: SceneName {
		return .collection
	}

	func buildViewController(with parameters: Parameters) -> UIViewController {
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
	}

	var isViewControllerRecyclable: Bool {
		return true
	}
}
