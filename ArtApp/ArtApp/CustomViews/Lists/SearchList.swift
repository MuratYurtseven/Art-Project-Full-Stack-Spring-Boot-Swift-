//
//  SearchList.swift
//  ArtApp
//
//  Created by Murat on 3.03.2025.
//

import SwiftUI

struct SearchList: View {
    let paintings:[Painting]
    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
                ForEach(paintings,id:\.self) { painting in
                    NavigationLink {
                        DetailPaintingView(painting: painting)
                    } label: {
                        KFImageView(imageUrl: painting.imageURL, font: .caption, imageName: painting.name)
                            .frame(width: 180, height: 180)
                            .clipShape(.rect(cornerRadius: 16))
                    }
                }
            }
        }
    }
}

