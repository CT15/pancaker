//
//  MainViewController.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
/**
 Initial controller that is presented when the application is successfully launched.
 */
class MainViewController: AppViewController {

    private var mainView: MainView!

    var catPicture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setCatPicture()
        makeViewDisappear()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if Settings.catImageEnabled {
            catPicture.alpha = 1
        } else {
            catPicture.alpha = 0
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startViewChainAnimation()
    }

    private func setView() {
        mainView = MainView(frame: CGRect.zero)
        mainView.delegate = self

        setCurrentView(currentView: mainView)
    }

    private func makeViewDisappear() {
        [mainView.createButton, mainView.listButton, mainView.settingsButton].forEach {
            $0.alpha = 0;
        }
    }

    private func setCatPicture() {
        catPicture = UIImageView(image: UIImage(named: "cat"))
        catPicture.translatesAutoresizingMaskIntoConstraints = false
        catPicture.contentMode = .scaleAspectFill
        view.addSubview(catPicture)
        catPicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        catPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        catPicture.heightAnchor.constraint(equalToConstant: 100).isActive = true
        catPicture.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    // The chain animation will make UI elements to appear in the following order:
    // - createButton
    // - listButton
    // - settingsButton
    // The first part of the chain animation.
    private func startViewChainAnimation() {
        UIView.animate(withDuration: 1, animations: {
            self.mainView.createButton.alpha = 1;
        }, completion: { (true) in
            self.makeListButtonAppear()
        })
    }

    // Second part of the chain animation.
    private func makeListButtonAppear() {
        UIView.animate(withDuration: 1, animations: {
            self.mainView.listButton.alpha = 1;
        }, completion: { (true) in
            self.makeSettingsButtonAppear()
        })
    }

    // Last part of the chain animation.
    private func makeSettingsButtonAppear() {
        UIView.animate(withDuration: 1) {
            self.mainView.createButton.alpha = 1
            self.mainView.listButton.alpha = 1
            self.mainView.settingsButton.alpha = 1
        }
    }
}

/**
 Extension of MainViewController that handles all button press events on MainView.
 */
extension MainViewController: MainViewDelegate {
    func didPressSettingsButton() {
        let settingsViewController = SettingsViewController()
        present(settingsViewController, animated: true)
    }

    func didPressListButton() {
        let listViewController = ListViewController()
        present(listViewController, animated: true)
    }

    func didPressCreateButton() {
        let createViewController = CreateViewController()
        present(createViewController, animated: true)
    }
}
