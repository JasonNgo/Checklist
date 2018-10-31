//
//  ChecklistCell.swift
//  Checklist
//
//  Created by Jason Ngo on 2018-10-31.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class ChecklistCell: UITableViewCell {
  
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var checklistItem: ChecklistItem! {
    didSet {
      descriptionLabel.text = checklistItem.description
      
      if checklistItem.isCheckmarked {
        accessoryType = .checkmark
      } else {
        accessoryType = .none
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}
