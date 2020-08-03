//
//  ToDoListItem.swift
//  PathWay
//
//  Created by macOS on 10.07.2020.
//  Copyright © 2020 Ruslan Akhmadeev. All rights reserved.
//

import Foundation

class ToDoListItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked.toggle()
    }
    
}
