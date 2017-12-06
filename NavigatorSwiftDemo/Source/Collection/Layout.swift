//
//  Layout.swift
//  NavigatorSwiftDemo
//
//  Created by jmpuerta on 25/11/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation
import UIKit

class Layout: UICollectionViewFlowLayout {
	var items: CGFloat {
		return 4
	}

	override func prepare() {
		super.prepare()
		guard let collectionView = collectionView else { return }
		let width = (collectionView.bounds.width - items) / items
		itemSize = CGSize(width: width, height: width)
		minimumLineSpacing = 1
		minimumInteritemSpacing = 1
		sectionHeadersPinToVisibleBounds = true
	}
}
