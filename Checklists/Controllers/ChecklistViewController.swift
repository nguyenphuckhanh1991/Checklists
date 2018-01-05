//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by nguyen.phuc.khanh on 1/5/18.
//  Copyright © 2018 khanh.nguyen. All rights reserved.
//

import UIKit

class ChecklistViewController: UIViewController {
    var items: [ChecklistItem]
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]() // add this line
        let row0item = ChecklistItem() // let
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item) // add this line
        let row1item = ChecklistItem() // let
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item) // add this line
        let row2item = ChecklistItem() // let
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item) // add this line
        let row3item = ChecklistItem() // let
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item) // add this line
        let row4item = ChecklistItem() // let
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item) // add this line
        super.init(coder: aDecoder)
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: Button Function
    @IBAction func addItem() {
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    // MARK: Function
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
}
// MARK: UITableViewDataSource
extension ChecklistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
}
// MARK: UITableViewDelegate
extension ChecklistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}
