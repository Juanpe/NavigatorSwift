//
//  XCUIApplication+Uitls.swift
//  NavigationSwiftDemoUITests
//
//  Created by jmpuerta on 25/11/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import XCTest

extension XCUIApplication {
	var stateLabel: XCUIElement {
		return staticTexts["StateLabel"]
	}
}
