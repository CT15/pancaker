//
//  SettingsViewController.swift
//  SampleApp
//
//  Created by Calvin Tantio on 5/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class SettingsViewController: AppViewController {

    var settingsView: SettingsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureToggleSwitchValue()
    }

    private func setView() {
        settingsView = SettingsView(frame: CGRect.zero)
        settingsView.delegate = self

        setCurrentView(currentView: settingsView)
    }

    // Matches the toggle switch value with the value in the Setting model.
    private func configureToggleSwitchValue() {
        settingsView.catImageRow.toggleSwitch.isOn = Settings.catImageEnabled
    }
}

extension SettingsViewController: SettingsViewDelegate {
    func didPressBackButton() {
        guard Settings.catImageEnabled == settingsView.catImageRow.toggleSwitch.isOn else {
            let message = "The change in setting has not been saved. Are you sure you want to leave?"
            DialogHelper.askConfirmation(in: self, title: "Unsaved Change", message: message) {
                self.dismiss(animated: true)
            }
            return
        }
        dismiss(animated: true)
    }

    func didPressSaveButton() {
        Settings.catImageEnabled = settingsView.catImageRow.toggleSwitch.isOn

        let message = "Settings updated successfully."
        DialogHelper.showInfo(in: self, title: "Success", message: message)
    }
}
