//
//  UsersViewController.swift
//  SQLite_Lesson7
//
//  Created by ThinhLe on 8/3/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class UsersViewController: UITableViewController
{
    
    var users = [User]()
    var usersTable = UserTable()
    
    @IBAction func addUser(_ sender: UIBarButtonItem)
    {
        let addUserAlert = UIAlertController(title: "Adding User", message: "fill infor to add user!", preferredStyle: .alert)
        
        addUserAlert.addTextField { (textField) in
            textField.placeholder = "name"
        }
        
        addUserAlert.addTextField { (textField) in
            textField.placeholder = "email"
        }
        
        addUserAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        addUserAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (alertAction) in
            if let name = addUserAlert.textFields?.first?.text, let email = addUserAlert.textFields?.last?.text
            {
                self.usersTable.insertUser(user: User(name: name, email: email, id: Int(arc4random_uniform(100))))
                self.users = self.usersTable.listAllUsers()
                self.tableView.reloadData()
            }
        }))
        
        self.present(addUserAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func updateUser(_ sender: UIBarButtonItem) {
        
        let updateUserAlert = UIAlertController(title: "Update User", message: "fill infor to update user!", preferredStyle: .alert)
        
        updateUserAlert.addTextField { (textField) in
            print("name")
        }
        
        updateUserAlert.addTextField { (textField) in
            print("email")
        }
        
        updateUserAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        updateUserAlert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (alertAction) in
            //updateUser()
        }))
        
        self.present(updateUserAlert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
    }
    
    //MARK: table datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }
}
