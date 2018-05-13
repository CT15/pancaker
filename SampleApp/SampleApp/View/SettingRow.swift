//
//  SettingRow.swift
//  SampleApp
//
//  Created by Calvin Tantio on 5/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

/**
 A setting option display.
 */
class SettingRow: UIView {

    private struct Constants {
        static let borderWidth: CGFloat = 2.0
        static let borderColor = Palette.color1.cgColor
        static let labelTextColor = Palette.color1
    }

    var optionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.labelTextColor
        return label
    }()

    var toggleSwitch = CustomSwitch()

    init(frame: CGRect, label: String) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false

        optionLabel.text = label
        setupRow()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupRow() {
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = Constants.borderColor

        // Sets toogleSwitch container.
        let switchContainer = UIView()
        switchContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(switchContainer)
        switchContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        switchContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        switchContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        switchContainer.widthAnchor.constraint(equalToConstant: 100).isActive = true

        // Puts toggleSwitch inside the container.
        switchContainer.addSubview(toggleSwitch)
        toggleSwitch.centerXAnchor.constraint(equalTo: switchContainer.centerXAnchor).isActive = true
        toggleSwitch.centerYAnchor.constraint(equalTo: switchContainer.centerYAnchor).isActive = true

        // Sets optionLabel
        addSubview(optionLabel)
        optionLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        optionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        optionLabel.trailingAnchor.constraint(equalTo: switchContainer.leadingAnchor).isActive = true
        optionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
}
