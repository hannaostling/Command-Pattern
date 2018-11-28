//
//  ViewController.swift
//  Command Pattern
//
//  Created by Hanna Östling on 2018-11-25.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let invoker: Invoker = Invoker()
    let receiver: Receiver = Receiver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if let text = inputTextField.text{
            let command = Command(receiver: receiver, operationItem: text)
            invoker.setCommand(command: command)
        }
        updateUI()
    }
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        invoker.undo()
        updateUI()
    }
    
    @IBAction func redoButtonPressed(_ sender: Any) {
        invoker.redo()
        updateUI()
    }
    
    func updateUI() {
        inputTextField.text = ""
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiver.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = receiver.list[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
}
