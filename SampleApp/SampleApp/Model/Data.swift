//
//  Data.swift
//  SampleApp
//
//  Created by Calvin Tantio on 8/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
import FirebaseDatabase

/**
 This represents the only data of this application that is stored
 in external database.
 */
struct Data: FirebaseSaveable {
    var key: String?

    static var path = "/data"

    var name: String
    var favouritePancake: String

    init(name: String, favouritePancake: String) {
        self.key = nil
        self.name = name
        self.favouritePancake = favouritePancake
    }

    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let favouritePancake = value["favouritePancake"] as? String else {
                return nil
        }

        self.key = snapshot.key
        self.name = name
        self.favouritePancake = favouritePancake
    }

    func toAnyObject() -> Any {
        return [
            "name": name,
            "favouritePancake": favouritePancake
        ]
    }
}
