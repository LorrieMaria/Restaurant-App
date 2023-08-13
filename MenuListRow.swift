//
//  MenuListRow.swift
//  Menu
//
//  Created by Lorrie Axelrod on 7/15/23.
//

import SwiftUI

struct MenuListRow: View {
    
    // property for each item that is passed in
    
    var item: MenuItem
    
    var body: some View {
        
        // view of the entire HStack / row
        
        HStack{
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .cornerRadius(10)
            
            Text(item.name)
                .bold()
            
            Spacer()
            
            Text("$" + item.price)
        
        }
        .listRowSeparator(.hidden)
        .listRowBackground(
            Color(.brown)
                .opacity(0.1)
        )
    }
}

struct MenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuListRow(item: MenuItem(name: "Test Item", price: "30,000", imageName: "tako-sushi"))
    }
}
