//
//  RecommendedPaintingsList.swift
//  ArtApp
//
//  Created by Murat on 27.02.2025.
//

import SwiftUI

struct RecommendedPaintingsList: View {
    let images:[Painting]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(images, id: \.self) { image in
                    VStack{
                        NavigationLink {
                            DetailPaintingView(painting: image)
                        } label: {
                            KFImageView(imageUrl: image.imageURL, font: .footnote, imageName: image.name)
                                .scaledToFit()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }


                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
        }
    }
}
