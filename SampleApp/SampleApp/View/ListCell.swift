//
//  ListCell.swift
//  SampleApp
//
//  Created by Calvin Tantio on 13/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    static let identifier = "ListCell"

    let dataLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.color1
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setupCell()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupCell() {
        addSubview(dataLabel)
        dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        dataLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
        dataLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dataLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
