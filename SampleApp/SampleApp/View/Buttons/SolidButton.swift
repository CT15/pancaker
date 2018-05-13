//
//  SolidButton.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
/**
 Button with a predetermined background color.
 */
class SolidButton: BounceButton {
    private struct Constants {
        static let buttonBackgroundColor = Palette.color2
    }

    init(frame: CGRect, label: String) {
        super.init(frame: frame)
        setupButton(label: label)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupButton(label: String) {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(label, for: UIControlState.normal)
        backgroundColor = Constants.buttonBackgroundColor
    }
}
