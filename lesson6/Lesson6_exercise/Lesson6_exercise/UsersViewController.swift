//
//  UsersViewController.swift
//  Lesson6_exercise
//
//  Created by ThinhLe on 8/2/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class UsersViewController: UITableViewController
{
    var users = [UserGithub]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 110.5
        getUsers()
    }
    
    func getUsers()
    {
        let githubAPI = GithubAPI()
        githubAPI.getUsers(since: 100) { (usersGithub) in
            self.users = usersGithub
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        let user = users[indexPath.row]
        cell.IDLabel.text = "\(user.id)"
        cell.nameLabel.text = user.name
        
        if let avatar_url = user.avatar_url, let url = URL(string: avatar_url)
        {
            UIImage.getImageFromURL(url: url) { (image) in
                DispatchQueue.main.async {
                    cell.imageCustomView.image = image
                }
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == users.count - 1
        {
            print("Loading more data")
        }
    }
}


extension UIImage
{
    static func getImageFromURL(url: URL, completion: @escaping (UIImage)->Void)
    {
        var image: UIImage?
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if let data = data
            {
                image = UIImage(data: data)
                if let image = image
                {
                    completion(image)
                    print("load anh thanh cong")
                }
                else
                {
                    print("khong the tao anh tu data")
                }
            }
            else
            {
                print("Khong the load image")
            }
        }.resume()
    }
}
