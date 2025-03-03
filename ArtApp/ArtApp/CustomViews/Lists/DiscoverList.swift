//
//  DiscoverList.swift
//  ArtApp
//
//  Created by Murat on 3.03.2025.
//

import SwiftUI

struct DiscoverList: View {
    @StateObject private var viewModel:DiscoverViewModel = DiscoverViewModel()
    @State private var page = 0
    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
                ForEach(viewModel.allPaintings,id:\.self) { painting in
                    NavigationLink {
                        DetailPaintingView(painting: painting)
                    } label: {
                        KFImageView(imageUrl: painting.imageURL, font: .caption, imageName: painting.name)
                            .frame(width: 180, height: 180)
                            .clipShape(.rect(cornerRadius: 16))
                            .onAppear {
                                if painting == viewModel.allPaintings.last && !viewModel.isLoading {
                                    page += 1
                                    viewModel.getAllPaintings(page: page)
                                    
                                }
                            }
                    }
                }
            }
            if viewModel.isLoading{
                ProgressView("Loading").padding()
            }
        }
        .navigationTitle("Discover")
        .onAppear {
            if viewModel.allPaintings.isEmpty {
                viewModel.getAllPaintings(page: page)
            }
        }
    }
}

