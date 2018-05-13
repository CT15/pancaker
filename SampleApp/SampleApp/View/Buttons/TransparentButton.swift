//
//  TransparentButton.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
/**
 Button with transparent background.
 */
class TransparentButton: BounceButton {

    private struct Constants {
        static let buttonBorderWidth: CGFloat = 2.0
        static let buttonBorderColor = Palette.color1.cgColor
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

        backgroundColor = UIColor.clear

        layer.borderWidth = Constants.buttonBorderWidth
        layer.borderColor = Constants.buttonBorderColor
    }
}
