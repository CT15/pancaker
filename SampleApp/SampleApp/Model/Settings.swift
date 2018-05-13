//
//  Settings.swift
//  SampleApp
//
//  Created by Calvin Tantio on 13/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

struct Settings {

    private struct Key {
        static let catImage = "cat-image"
    }

    private static let defaults = UserDefaults.standard

    static var catImageEnabled: Bool {
        set(value) {
            defaults.set(value, forKey: Key.catImage)
        }

        get {
            return defaults.bool(forKey: Key.catImage)
        }
    }
}
