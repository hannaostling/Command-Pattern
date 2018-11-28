//
//  Invoker.swift
//  Command Pattern
//
//  Created by Hanna Östling on 2018-11-25.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

import Foundation

import UIKit

class Invoker {
    
    var commandList: [Command] = []
    var undoCommandList: [Command] = []
    
    func setCommand(command: Command) {
        commandList.append(command)
        command.execute()
    }
    
    func undo() {
        if commandList.count > 0 {
            let command = commandList.remove(at: commandList.count - 1)
            undoCommandList.append(command)
            command.undo()
        }
        else {
            print("Nothing to undo!")
        }
    }
    
    func redo() {
        if undoCommandList.count > 0 {
            let command = undoCommandList.remove(at: undoCommandList.count - 1)
            commandList.append(command)
            command.redo()
        }
        else {
            print("Nothing to redo!")
        }
    }
    
}
