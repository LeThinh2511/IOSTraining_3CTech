//
//  ItemsViewController.swift
//  Lesson4_5
//
//  Created by ThinhLe on 7/28/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController
{
    var itemStore: ItemStore!
    // MARK: connection
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem)
    {
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.index(of: newItem)
        {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
   
    @IBAction func toggleEditingMode(_ sender: UIBarButtonItem)
    {
        if self.isEditing
        {
            self.setEditing(false, animated: true)
        }
        else
        {
            self.setEditing(true, animated: true)
        }
    }
    
    // MARK: DATA SOURCE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemStore.allItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.namelabel.text = item.name
        cell.valueLabel.text = "$\(item.valueInDollars)"
        cell.serialNumberLabel.text = item.serialNumber
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "No more item!"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)"
            let message = "Are you sure you want to delete this item?"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
            alertController.addAction(cancleAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) -> Void in
                self.itemStore.removeItem(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            alertController.addAction(deleteAction)
            self.present(alertController, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func showName(at indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .normal, title: "print name") { (action, view, completion) in
            print(self.itemStore.allItems[indexPath.row].name)
        }
        action.backgroundColor = UIColor.red
        return action
    }
    func showSerialNumber(at indexPath: IndexPath) -> UIContextualAction
    {
        let action = UIContextualAction(style: .normal, title: "print serial number") { (action, view, completion) in
            print(self.itemStore.allItems[indexPath.row].serialNumber ?? "nil")
        }
        action.backgroundColor = UIColor.green
        return action
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let showName = self.showName(at: indexPath)
        let showSerialNumber = self.showSerialNumber(at: indexPath)
        return UISwipeActionsConfiguration(actions: [showName, showSerialNumber])
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == itemStore.allItems.count - 1
        {
            for _ in 0..<5
            {
                itemStore.createItem()
            }
            tableView.reloadData()
        }
    }
    
    // MARK: life cycle
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    //MARK: SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier
        {
        case "showItem":
            let detailViewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let item = itemStore.allItems[indexPath.row]
            
            detailViewController.item = item
            break
        default:
            print("error")
        }
    }
    
    @IBAction func unwindToItemVC(segue: UIStoryboardSegue)
    {
        let detailVC = segue.source as! DetailViewController
        print(detailVC.item.name)
    }
}
