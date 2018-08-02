//
//  UserGithub.swift
//  Lesson6_exercise
//
//  Created by ThinhLe on 8/1/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import Foundation

class UserGithub
{
    var name: String
    var id: Int
    var avatar_url: String?
    
    
    init(name: String, id: Int, avatar_url: String?)
    {
        self.name = name
        self.id = id
        self.avatar_url = avatar_url
    }
}
