//
//  TableViewController.swift
//  DispatchGroupExercise
//
//  Created by ThinhLe on 8/1/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController
{
    var users: [String] = []
    let groupA = ["user1", "user2"]
    let groupB = ["user3", "user4"]
    let groupC = ["user5", "user6"]
    
    let dispatchGroup = DispatchGroup()
    
    @IBAction func loadData(_ sender: UIButton) {
        print("loading data")
        gotA()
        gotB()
        gotC()
        dispatchGroup.notify(queue: .main) {
            print("reloading data")
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    func run(after seconds: Int, completion: @escaping () ->Void)
    {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(seconds)) {
            completion()
        }
    }
    
    func gotA()
    {
        dispatchGroup.enter()
        print("getting A")
        run(after: 2) {
            self.users.append(contentsOf: self.groupA)
            print("Got A")
            self.dispatchGroup.leave()
        }
        
    }
    
    func gotB()
    {
        dispatchGroup.enter()
        print("getting B")
        run(after: 4) {
            self.users.append(contentsOf: self.groupB)
            print("Got B")
            self.dispatchGroup.leave()
        }
    }
    
    func gotC()
    {
        dispatchGroup.enter()
        print("getting C")
        run(after: 6) {
            self.users.append(contentsOf: self.groupC)
            print("Got C")
            self.dispatchGroup.leave()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }
}
