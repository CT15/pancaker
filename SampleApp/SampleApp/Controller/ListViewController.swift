//
//  ListViewController.swift
//  SampleApp
//
//  Created by Calvin Tantio on 5/5/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ListViewController: AppViewController {

    var ref: DatabaseReference?

    var listView: ListView!

    var allData = [Data]()  // Stores all the data from database

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference(withPath: Data.path)
        populateData()
        setView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if allData.isEmpty {
            let message = "Do you want to create a new data?"
            DialogHelper.askConfirmation(in: self, title: "No Data To Display", message: message) {
                let createViewController = CreateViewController()
                self.present(createViewController, animated: true)
            }
        }
    }

    // Stores all the data in the Firebase database into allData array.
    // allData array will be updated every time there is a change in the database.
    // The tableView will also be updated accordingly.
    private func populateData() {
        ref?.observe(.value, with: { (snapshot) in
            var allNewData = [Data]()

            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let newData = Data(snapshot: snapshot) {
                    allNewData.append(newData)
                }
            }

            self.allData = allNewData
            self.listView.tableView.reloadData()
        })
    }

    private func setView() {
        listView = ListView(frame: CGRect.zero)
        listView.delegate = self

        listView.tableView.dataSource = self
        listView.tableView.delegate = self

        setCurrentView(currentView: listView)
    }
}

extension ListViewController: ListViewDelegate {
    func didPressBackButton() {
        dismiss(animated: true)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell = listView.tableView.dequeueReusableCell(withIdentifier: ListCell.identifier) as? ListCell else {
            fatalError("Unable to dequeue cell")
        }

        let data = allData[indexPath.row]
        listCell.dataLabel.text = "\(data.name) likes \(data.favouritePancake)~"

        return listCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let dataKey = allData[indexPath.row].key else {
                return
            }
            ref?.child(dataKey).removeValue()
        }
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
