//
//  AddChecklistItemViewController.swift
//  Checklist
//
//  Created by Jason Ngo on 2018-10-31.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class AddChecklistItemViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddChecklistViewStyling()
    }
    
    fileprivate func setupAddChecklistViewStyling() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButtonPressed))
        doneButton.isEnabled = false
        
        view.backgroundColor = .white
        navigationItem.title = "Add a new item"
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func handleDoneButtonPressed() {
        print("done pressed")
    }
}
