//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Jason Ngo on 2018-10-31.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import Foundation

struct ChecklistItem {
  var description: String
  private(set) var isCheckmarked: Bool
  
  mutating func toggleCheckmark() {
    isCheckmarked = !isCheckmarked
  }
  
}
