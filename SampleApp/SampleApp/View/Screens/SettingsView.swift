//
//  SettingsView.swift
//  SampleApp
//
//  Created by Calvin Tantio on 5/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

protocol SettingsViewDelegate: class {
    func didPressBackButton()
    func didPressSaveButton()
}

/**
 View for SettingsViewController
 */
class SettingsView: UIView {

    weak var delegate: SettingsViewDelegate?

    private var backButton: UIButton!
    private var saveButton: UIButton!

    var catImageRow: SettingRow!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setBackground()
        setButtons()
        setSettingRows()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setBackground() {
        let background = Background(frame: CGRect.zero, image: UIImage(named: "pancake4")!)
        addSubview(background)
        background.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        background.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    private func setButtons() {
        backButton = TransparentButton(frame: CGRect.zero, label: "BACK")
        addSubview(backButton)
        backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        saveButton = SolidButton(frame: CGRect.zero, label: "SAVE")
        addSubview(saveButton)
        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -10).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        [backButton, saveButton].forEach {
            $0.addTarget(self, action: #selector(didPressButton), for: UIControlEvents.touchUpInside)
        }
    }

    private func setSettingRows() {
        catImageRow = SettingRow(frame: CGRect.zero, label: "Cat Image")
        addSubview(catImageRow)
        catImageRow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        catImageRow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        catImageRow.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        catImageRow.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }

    @objc
    private func didPressButton(sender: UIButton) {
        switch sender {
        case backButton:
            delegate?.didPressBackButton()
        case saveButton:
            delegate?.didPressSaveButton()
        default:
            break
        }
    }
}
