//
//  Command.swift
//  Command Pattern
//
//  Created by Hanna Östling on 2018-11-25.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

import Foundation

protocol Option {
    func execute()
    func undo()
    func redo()
}

class Command: Option {
    
    let receiver: Receiver
    let item: String
    
    init(receiver: Receiver, operationItem: String) {
        self.receiver = receiver
        self.item = operationItem
    }
    
    func execute() {
        receiver.add(item: item)
    }
    
    func undo() {
        _ = receiver.removeItem()
    }
    
    func redo() {
        receiver.add(item: item)
    }
}
