//
//  ItemStore.swift
//  Lesson4_5
//
//  Created by ThinhLe on 7/30/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit

class ItemStore
{
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item
    {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(_ item: Item)
    {
        if let index = allItems.index(of: item)
        {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int)
    {
        if fromIndex == toIndex
        {
            return
        }
        else
        {
            let movedItem = allItems[fromIndex]
            allItems.remove(at: fromIndex)
            
            allItems.insert(movedItem, at: toIndex)
        }
    }
}
