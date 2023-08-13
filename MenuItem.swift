//
//  MenuItem.swift
//  Menu
//
//  Created by Lorrie Axelrod on 7/3/23.
//

// We're creating a new struct

import Foundation

// any single generic menu item
// follows an identifiable protocol

struct MenuItem: Identifiable{
    // creating a random ID
    var id:UUID = UUID()
    var name:String
    var price:String
    var imageName:String
}
