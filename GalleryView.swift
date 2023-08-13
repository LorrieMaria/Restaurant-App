//
//  GalleryView.swift
//  Restaurant
//
//  Created by Lorrie Axelrod on 7/17/23.
//

import SwiftUI

struct GalleryView: View {
    
    @State var photoData = [String]()
    @State var sheetVisible = false
    @State var selectedPhoto = ""
    var dataService = DataService()
    
    
    var body: some View {
        
        VStack (alignment: .leading){
            Text("Gallery")
                .font(.largeTitle)
                .bold()
            
            
            // we're going to wrap scroll view in geometry reader to use
            // a max width of the size of the screen
            
            // second spacing is the spacing between rows
            GeometryReader{ proxy in
                
                ScrollView (showsIndicators: false){
                    LazyVGrid(columns: [GridItem(spacing: 10),
                                        GridItem(spacing: 10),
                                        GridItem(spacing: 10)], spacing: 10){
                        ForEach(photoData, id: \.self){ p in
                            Image(p)
                                .resizable()
                                .aspectRatio(contentMode:.fill)
                            
                            // proxy holds the size of the scroll view
                            // we want to divide by 3 to see how wide each column is
                            // subtract 20 (2 gutters)
                                .frame(maxWidth: (proxy.size.width - 20)/3)
                                .clipped()
                                .onTapGesture {
                                    selectedPhoto = p
                                    sheetVisible = true
                                }
                        }
                    }
                }
            }
            
        }
        // add horizontal padding (default is 20)
        .padding(.horizontal, 20)
        .onAppear{
            photoData = dataService.getPhotos()
        }
        // if sheetVisible is true, show photoview
        .sheet(isPresented: $sheetVisible) {
            PhotoView(selectedPhoto: $selectedPhoto,
                      sheetVisible: $sheetVisible)
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
