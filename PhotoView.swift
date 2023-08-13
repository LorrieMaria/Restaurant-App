//
//  PhotoView.swift
//  Restaurant
//
//  Created by Lorrie Axelrod on 7/28/23.
//

import SwiftUI

struct PhotoView: View {
    
    @Binding var selectedPhoto: String
    @Binding var sheetVisible: Bool
    
    var body: some View {
        
        ZStack{
            Image(selectedPhoto)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack{
                HStack{
                    Spacer()
                    Button {
                        sheetVisible = false
                    } label: {
                        Image(systemName: "x.circle")
                            .scaleEffect(2)
                            .foregroundColor(.black)
                    }
                }
                .padding(25)
                Spacer()
            }
            .padding(15)
            
        }
    }
    
    struct PhotoView_Previews: PreviewProvider {
        static var previews: some View {
            
            // create fake binding for the preview
            PhotoView(selectedPhoto: Binding.constant("gallery1"), sheetVisible: Binding.constant(true))}
    }
}
