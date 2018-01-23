//
//  EmptySceneURLHandler.swift
//  NavigatorSwift
//
//  Created by jmpuerta on 26/11/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public struct EmptySceneURLHandler: SceneURLHandler {
	public init() {

	}
	
	public func sceneContexts(from url: URL) -> [SceneURLContext] {
		return []
	}
}
