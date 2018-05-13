//
//  CreateViewController.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
import Firebase

/**
 Controller that handles the creation of new data.
 */
class CreateViewController: AppViewController {

    var createView: CreateView!

    // for animations
    var initialNameTextFieldLeading: NSLayoutConstraint?
    var initialPancakeTextFieldLeading: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        moveTextFieldsOutOfScreen()
    }

    private func moveTextFieldsOutOfScreen() {
        createView.nameTextFieldLeading.isActive = false
        initialNameTextFieldLeading = createView.nameTextField.leadingAnchor.constraint(equalTo: createView.leadingAnchor, constant: -view.bounds.width)
        initialNameTextFieldLeading?.isActive = true

        createView.pancakeTextFieldLeading.isActive = false
        initialPancakeTextFieldLeading = createView.pancakeTextField.leadingAnchor.constraint(equalTo: createView.leadingAnchor, constant: -view.bounds.width)
        initialPancakeTextFieldLeading?.isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.initialNameTextFieldLeading?.isActive = false
            self.createView.nameTextFieldLeading.isActive = true
            self.view.layoutIfNeeded()
        }, completion: nil)

        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseOut, animations: {
            self.initialPancakeTextFieldLeading?.isActive = false
            self.createView.pancakeTextFieldLeading.isActive = true
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    private func setView() {
        createView = CreateView(frame: CGRect.zero)
        createView.delegate = self

        setCurrentView(currentView: createView)
    }
}

/**
 Extension of CreateViewController that handles all button press events on CreateView.
 */
extension CreateViewController: CreateViewDelegate {
    func didPressBackButton(name: String?, pancake: String?) {
        let nameText = name?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let pancakeText = pancake?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard nameText.isEmpty && pancakeText.isEmpty else {
            let message = "The data you entered is not yet created. Are you sure you want to leave?"
            DialogHelper.askConfirmation(in: self, title: "Warning", message: message) {
               self.closeCreateViewController()
            }
            return
        }

        closeCreateViewController()
    }

    private func closeCreateViewController() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            self.initialNameTextFieldLeading?.isActive = true
            self.createView.nameTextFieldLeading.isActive = false
            self.view.layoutIfNeeded()
        }, completion: nil)

        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseIn, animations: {
            self.initialPancakeTextFieldLeading?.isActive = true
            self.createView.pancakeTextFieldLeading.isActive = false
            self.view.layoutIfNeeded()
        }, completion: { (success) in
            self.dismiss(animated: true)
        })
    }

    func didPressCreateButton(name: String?, pancake: String?) {
        let nameText = name?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let pancakeText = pancake?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        // Notifying the user if the one / more of the fields are empty.
        // Fails to save into the database.
        guard !nameText.isEmpty && !pancakeText.isEmpty else {
            let message = "Cannot create a new data. Make sure that all the fields are not empty."
            DialogHelper.showInfo(in: self, title: "Error", message: message)
            return
        }

        // Saving data into the database.
        let newData = Data(name: nameText, favouritePancake: pancakeText)
        newData.save()

        // Notifying user after saving.
        let message = "Your new data has been added to the database."
        DialogHelper.showInfo(in: self, title: "Success", message: message) {
            [self.createView.nameTextField, self.createView.pancakeTextField].forEach {
                $0.text = ""
            }
        }
    }
}
