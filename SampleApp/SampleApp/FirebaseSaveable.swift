//
//  FirebaseSaveable.swift
//  SampleApp
//
//  Created by Calvin Tantio on 11/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import FirebaseDatabase

/**
 A type that can be saved in Firebase realtime database.
 */
protocol FirebaseSaveable {
    // The unique identifier in the object in the database.
    // nil key value means the object is not saved in the database yet.
    var key: String? { get }

    // The path of the Model in the Firebase JSON tree.
    static var path: String { get }

    // Return the required attributes of the object packaged in a dictionary
    func toAnyObject() -> Any
}

extension FirebaseSaveable {

    // Save / Update object in the database.
    func save() {
        let ref = Database.database().reference(withPath: Self.path)

        guard let key = key else {
            // Save new object.
            ref.childByAutoId().setValue(self.toAnyObject())
            return
        }

        // Update object in the database.
        ref.childByAutoId().child(key).setValue(self.toAnyObject())
    }
}
