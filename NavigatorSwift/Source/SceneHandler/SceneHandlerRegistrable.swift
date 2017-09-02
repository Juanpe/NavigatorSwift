//
//  SceneHandlerRegistrable.swift
//  NavigatorSwift
//
//  Created by Jose Maria Puerta on 1/9/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

protocol SceneHandlerRegistrable {
	func sceneHandlersToRegister() -> [SceneHandler]
}
