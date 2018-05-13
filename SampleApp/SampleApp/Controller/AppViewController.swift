//
//  AppViewController.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

/**
 Superclass of all the view controllers in this application.
 */
class AppViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }

    convenience init(currentView: UIView) {
        self.init()
    }

    /// Sets up the view of the view controller.
    /// - Parameters:
    ///     - currentView:  The view that associated with the view controller.
    ///                     This view will be anchored to fill the entire screen.
    func setCurrentView(currentView: UIView) {
        view.addSubview(currentView)
        currentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        currentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        currentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        currentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
