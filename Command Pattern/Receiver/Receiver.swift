//
//  Receiver.swift
//  Command Pattern
//
//  Created by Hanna Östling on 2018-11-25.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

import UIKit

class Receiver {
    
    var list: [String] = []
    
    func add(item: String) {
        list.append(item)
    }

    func removeItem() -> String? {
        return list.remove(at: list.count - 1)
    }
    
}
