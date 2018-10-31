//
//  ViewController.swift
//  Checklist
//
//  Created by Jason Ngo on 2018-10-31.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Checklist"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupData()
    }
    
    @objc func handleAddItemButtonPressed() {
        print("add button pressed")
        let addItemViewController = AddChecklistItemViewController()
        navigationController?.pushViewController(addItemViewController, animated: true)
    }
    
}

// MARK: - Setup Functions

fileprivate extension ChecklistViewController {
    func setupNavigationBar() {
        let addItemButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddItemButtonPressed))
        navigationItem.rightBarButtonItem = addItemButton
    }
    
    func setupTableView() {
        let checklistCellNib = UINib(nibName: "ChecklistCell", bundle: nil)
        tableView.backgroundColor = .white
        tableView.register(checklistCellNib, forCellReuseIdentifier: "checklistCell")
    }
    
    func setupData() {
        let item1 = ChecklistItem(description: "Item 1", isCheckmarked: false)
        let item2 = ChecklistItem(description: "Item 2", isCheckmarked: false)
        let item3 = ChecklistItem(description: "Item 3", isCheckmarked: false)
        let item4 = ChecklistItem(description: "Item 4", isCheckmarked: false)
        let item5 = ChecklistItem(description: "Item 5", isCheckmarked: false)
        
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item5)
        
        tableView.reloadData()
    }
}

// MARK: - Helper Functions

fileprivate extension ChecklistViewController {
    func addRandomItem() {
        let randomDescription1 = "Random description 1"
        let randomDescription2 = "Random description 2"
        let randomDescription3 = "Random description 3"
        
        let random = Int.random(in: 0 ... 2)
        var item = ChecklistItem(description: "Item", isCheckmarked: false)
        
        switch random {
        case 0:
            item.description = randomDescription1
        case 1:
            item.description = randomDescription2
        default:
            item.description = randomDescription3
        }
        
        items.append(item)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ChecklistViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "checklistCell") as? ChecklistCell else {
            fatalError()
        }
        
        cell.checklistItem = items[indexPath.row]
        return cell
    }
}

// MARK: UITableViewDelegate

extension ChecklistViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath) as? ChecklistCell) != nil {
            items[indexPath.row].toggleCheckmark()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // Deleting rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let removedIndexPaths = [indexPath]
        tableView.deleteRows(at: removedIndexPaths, with: .automatic)
    }
}
