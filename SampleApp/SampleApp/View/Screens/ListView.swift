//
//  ListView.swift
//  SampleApp
//
//  Created by Calvin Tantio on 5/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

protocol ListViewDelegate: class {
    func didPressBackButton()
}

/**
 View to the ListViewController
 */
class ListView: UIView {

    weak var delegate: ListViewDelegate?

    let titleArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.4
        return view
    }()

    let title: UILabel = {
        let label = UILabel()
        label.text = "DATA LIST"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.clear
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        return tableView
    }()

    var backButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setBackground()
        setTitleArea()
        setButtons()
        setTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setBackground() {
        let background = Background(frame: CGRect.zero, image: UIImage(named: "pancake3")!)
        addSubview(background)
        background.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        background.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    private func setTitleArea() {
        addSubview(titleArea)
        titleArea.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleArea.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleArea.heightAnchor.constraint(equalToConstant: 80).isActive = true

        addSubview(title)
        title.bottomAnchor.constraint(equalTo: titleArea.bottomAnchor).isActive = true
        title.widthAnchor.constraint(equalTo: titleArea.widthAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setButtons() {
        backButton = TransparentButton(frame: CGRect.zero, label: "BACK")
        addSubview(backButton)
        backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        backButton.addTarget(self, action: #selector(didPressButton), for: UIControlEvents.touchUpInside)
    }

    private func setTableView() {
        addSubview(tableView)
        tableView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: titleArea.bottomAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20).isActive = true
    }

    @objc
    private func didPressButton(sender: UIButton) {
        switch sender {
        case backButton:
            delegate?.didPressBackButton()
        default:
            return
        }
    }
}
