//
//  BounceButton.swift
//  SampleApp
//
//  Created by Calvin Tantio on 5/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

/**
 Button that bounces when pressed.
 */
class BounceButton: UIButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6,
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: { self.transform = CGAffineTransform.identity }, completion: nil)

        super.touchesBegan(touches, with: event)
    }
}
