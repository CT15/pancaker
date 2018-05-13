//
//  MainView.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

protocol MainViewDelegate: class {
    func didPressSettingsButton()
    func didPressListButton()
    func didPressCreateButton()
}

/**
 View to the MainViewController.
 */
class MainView: UIView {

    weak var delegate: MainViewDelegate?

    var background: UIView!

    var settingsButton: UIButton!
    var listButton: UIButton!
    var createButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setBackground()
        setButtons()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setBackground() {
        background = Background(frame: CGRect.zero, image: UIImage(named: "pancake1")!)
        addSubview(background)
        background.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        background.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    private func setButtons() {
        settingsButton = SolidButton(frame: CGRect.zero, label: "SETTINGS")
        addSubview(settingsButton)
        settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        settingsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        settingsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        listButton = TransparentButton(frame: CGRect.zero, label: "LIST")
        addSubview(listButton)
        listButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        listButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        listButton.bottomAnchor.constraint(equalTo: settingsButton.topAnchor, constant: -10).isActive = true
        listButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        createButton = TransparentButton(frame: CGRect.zero, label: "CREATE")
        addSubview(createButton)
        createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        createButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        createButton.bottomAnchor.constraint(equalTo: listButton.topAnchor, constant: -10).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        [settingsButton, listButton, createButton].forEach {
            $0.addTarget(self, action: #selector(didPressButton), for: UIControlEvents.touchUpInside)
        }
    }

    @objc
    private func didPressButton(sender: UIButton) {
        switch sender {
        case settingsButton:
            delegate?.didPressSettingsButton()
        case listButton:
            delegate?.didPressListButton()
        case createButton:
            delegate?.didPressCreateButton()
        default:
            return
        }
    }
}
