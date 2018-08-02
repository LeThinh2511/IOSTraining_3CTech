//
//  GithubAPI.swift
//  Lesson6_exercise
//
//  Created by ThinhLe on 8/2/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import Foundation

class GithubAPI
{
    let session: URLSession = URLSession(configuration: .default)
    
    
    
    func getUsers(since: Int, completion: @escaping ([UserGithub]) -> Void)
    {
        let urlString = "https://api.github.com/users?since=\(since)"
        let url = URL(string: urlString)
        if let url = url
        {
            let request = URLRequest(url: url)
            session.dataTask(with: request)
            { (data, response, error) in
                if let data = data
                {
                    let users = self.parseJSONToUsers(jsonData: data)
                    completion(users)
                }
            }.resume()
        }
    }
    
    func parseJSONToUsers(jsonData: Data) -> ([UserGithub])
    {
        var users = [UserGithub]()
        do
        {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            guard let usersJson = jsonObject as? [[AnyHashable:Any]] else
            {
                print("loi")
                return [UserGithub]()
            }
            for user in usersJson
            {
                let name = user["login"] as! String
                let id = user["id"] as! Int
                let avatar_url = user["avatar_url"] as? String
                users.append(UserGithub(name: name, id: id, avatar_url: avatar_url))
            }
        }
        catch
        {
            print("Dinh dang JSON khong dung!")
        }
        return users
    }
}
