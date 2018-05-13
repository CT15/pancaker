//
//  Background.swift
//  SampleApp
//
//  Created by Calvin Tantio on 24/4/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

/**
 The background image of the main screen.
 */
class Background: UIView {
    private struct Constants {
        static let darkingLayerAlpha: CGFloat = 0.4
    }

    private var backgroundImage: UIImage!

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // A layer on top of the background image to darken the background image
    private let darkeningLayer: UIView = {
        let blackLayer = UIView()
        blackLayer.backgroundColor = UIColor.black
        blackLayer.alpha = Constants.darkingLayerAlpha
        blackLayer.translatesAutoresizingMaskIntoConstraints = false
        return blackLayer
    }()

    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)

        backgroundImage = image

        translatesAutoresizingMaskIntoConstraints = false
        
        setBackgroundImage()
        setDarkeningLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setBackgroundImage() {
        addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    private func setDarkeningLayer() {
        addSubview(darkeningLayer)
        darkeningLayer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        darkeningLayer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        darkeningLayer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        darkeningLayer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
