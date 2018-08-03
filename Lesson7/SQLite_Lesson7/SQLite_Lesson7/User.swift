//
//  User.swift
//  SQLite_Lesson7
//
//  Created by ThinhLe on 8/3/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import Foundation

class User
{
    var name: String
    var email: String
    var id: Int
    
    init(name: String, email: String, id: Int)
    {
        self.name = name
        self.email = email
        self.id = id
    }
}
