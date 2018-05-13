//
//  CreateView.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

protocol CreateViewDelegate: class {
    func didPressBackButton(name: String?, pancake: String?)
    func didPressCreateButton(name: String?, pancake: String?)
}

/**
 View to the CreateViewController.
 */
class CreateView: UIView {

    weak var delegate: CreateViewDelegate?

    var backButton: UIButton!
    var createButton: UIButton!

    var nameTextField: UITextField!
    // for nameTextField animation
    var nameTextFieldLeading: NSLayoutConstraint!

    var pancakeTextField: UITextField!
    // for pancakeTextField animation
    var pancakeTextFieldLeading: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setBackground()
        setTextFields()
        setButtons()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setBackground() {
        let background = Background(frame: CGRect.zero, image: UIImage(named: "pancake2")!)
        addSubview(background)
        background.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        background.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    private func setTextFields() {
        // nameTextField
        nameTextField = CustomTextField(frame: CGRect.zero, placeholder: "Enter name")
        addSubview(nameTextField)
        nameTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true

        nameTextFieldLeading = nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        nameTextFieldLeading.isActive = true

        nameTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // pancakeTextField
        pancakeTextField = CustomTextField(frame: CGRect.zero, placeholder: "Enter favourite pancake")
        addSubview(pancakeTextField)
        pancakeTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true

        pancakeTextFieldLeading = pancakeTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        pancakeTextFieldLeading.isActive = true

        pancakeTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        pancakeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setButtons() {
        backButton = TransparentButton(frame: CGRect.zero, label: "BACK")
        addSubview(backButton)
        backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        createButton = SolidButton(frame: CGRect.zero, label: "CREATE")
        addSubview(createButton)
        createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        createButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        createButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -10).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        [backButton, createButton].forEach {
            $0.addTarget(self, action: #selector(didPressButton), for: UIControlEvents.touchUpInside)
        }
    }

    @objc
    private func didPressButton(sender: UIButton) {
        switch sender {
        case backButton:
            delegate?.didPressBackButton(name: nameTextField.text, pancake: pancakeTextField.text)
        case createButton:
            delegate?.didPressCreateButton(name: nameTextField.text, pancake: pancakeTextField.text)
        default:
            return
        }
    }
}
