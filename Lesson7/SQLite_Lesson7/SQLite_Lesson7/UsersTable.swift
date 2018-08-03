//
//  UserSQLite.swift
//  SQLite_Lesson7
//
//  Created by ThinhLe on 8/3/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import Foundation
import SQLite

class UserTable
{
    var database: Connection!
    let usersTable = Table("usersTable")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    let id = Expression<Int>("id")
    
    init()
    {
        do
        {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("Users").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
            self.createTable()
        }
        catch
        {
            print(error)
        }
    }
    
    func createTable()
    {
        do
        {
            try database.run(usersTable.create(block: { (tableBuilder) in
                tableBuilder.column(name)
                tableBuilder.column(email, unique: true)
                tableBuilder.column(id, primaryKey: true)
            }))
            print("created table")
        }
        catch
        {
            print(error)
        }
    }
    
    func insertUser(user: User)
    {
       let insert = self.usersTable.insert(self.name <- user.name, self.email <- user.email, self.id <- user.id)
        do
        {
            try self.database.run(insert)
            print("inserted user")
        }
        catch
        {
            print(error)
            print("Loi luc insert")
        }
    }
    
    func removeUser(user: User)
    {
        let userDelete = usersTable.filter(id == user.id)
        do
        {
            try self.database.run(userDelete.delete())
            print("removed \(user.name)")
        }
        catch
        {
            print(error)
        }
    }
    
    func updateUser(user: User)
    {
        let userUpdate = usersTable.filter(id == user.id)
        
        do
        {
            try self.database.run(userUpdate.update(name <- user.name, email <- user.email))
            print("updated")
        }
        catch
        {
            print(error)
        }
    }
    
    func listAllUsers() -> [User]
    {
        var users = [User]()
        do
        {
            for user in try database.prepare(usersTable)
            {
                users.append(User(name: user[name], email: user[email], id: user[id]))
            }
            print("Listed!")
        }
        catch
        {
            print(error)
        }
        
        return users
    }
    
}
