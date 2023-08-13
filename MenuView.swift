//
//  MenuView.swift
//  Restaurant
//
//  Created by Lorrie Axelrod on 7/17/23.
//

import SwiftUI

struct MenuView: View {
    
    // DATABASE RELATED CODE -> PUT INTO IT'S OWN STRUCT
    
    // creating an empty array that holds items of type MenuItem
    
    // @State is a property wrapper, gives property extra behaviors
    
    // Updates views in UI when this property changes.
    @State var menuItems:[MenuItem] = [MenuItem]()
    
    // create an instance of DataService to use
    var dataService = DataService()
    
    
    var body: some View {
        
        List(menuItems){ item in
            
            // calling the menu list row view / struct
            MenuListRow(item: item)
            
        }
        // removes basic styling
        .listStyle(.plain)
        
        // run code in brackets when list appears on screen
        .onAppear{
            // Assign our menuitem list to the data in dataservice.
            menuItems = dataService.getData()
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
    
}
