//
//  DismissSceneOperationTests.swift
//  NavigatorSwift
//
//  Created by jmpuerta on 19/9/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

@testable import NavigatorSwift
import XCTest
import Cuckoo

class DismissSceneOperationTests: SceneOperationTests {
	// Class under test
	fileprivate var sut: DismissSceneOperation!
}

// MARK: Tests

extension DismissSceneOperationTests {
	func testRootSceneDisplayedModally_dismissRootSceneAnimated_dismissScene() {
		//given
		let rootViewMock = givenMockViewController(isDisplayedModally: true)
		let rootSceneMock = givenMockScene(name: Constants.anyScene, view: rootViewMock, type: .modal)
		sut = givenSUT(scene: rootSceneMock, animated: true, modalView: rootViewMock)

		// when
		sut.execute(with: nil)

		// then
		verify(rootViewMock).dismiss(animated: true, completion: any())
	}

	func testRootSceneNotDisplayedModally_dismissRootSceneAnimated_dismissScene() {
		//given
		let rootViewMock = givenMockViewController(isDisplayedModally: false)
		let rootSceneMock = givenMockScene(name: Constants.anyScene, view: rootViewMock, type: .modal)
		sut = givenSUT(scene: rootSceneMock, animated: true, modalView: rootViewMock)

		// when
		sut.execute(with: nil)

		// then
		verifyNever(rootViewMock).dismiss(animated: true, completion: any())
	}

	func testRootSceneDisplayedModally_dismissOtherSceneAnimated_doNotDismissScene() {
		//given
		let rootViewMock = givenMockViewController(isDisplayedModally: true)
		let rootSceneMock = givenMockScene(name: Constants.anyScene, view: rootViewMock, type: .modal)
		let otherViewMock = givenMockViewController(isDisplayedModally: true)
		sut = givenSUT(scene: rootSceneMock, animated: true, modalView: otherViewMock)

		// when
		sut.execute(with: nil)

		// then
		verifyNever(rootViewMock).dismiss(animated: true, completion: any())
		verifyNever(otherViewMock).dismiss(animated: true, completion: any())
	}
}

// MARK: Helpers

extension DismissSceneOperationTests {
	func givenMockViewController(isDisplayedModally: Bool) -> MockViewController {
		let viewMock = MockViewController()

		stub(viewMock) { stub in
			when(stub.isBeingDisplayedModally.get).thenReturn(isDisplayedModally)
			when(stub.dismiss(animated: any(), completion: any())).thenDoNothing()
		}

		return viewMock
	}

	func givenSUT(scene: Scene, animated: Bool, modalView: UIViewController) -> DismissSceneOperation {
		let nav = UINavigationController(rootViewController: modalView)
		let sceneRendererMock = givenMockSceneRenderer(window: Window(), root: nav)
		return DismissSceneOperation(scene: scene, animated: animated, renderer: sceneRendererMock)
	}
}
