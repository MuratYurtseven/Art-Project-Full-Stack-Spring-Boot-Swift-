//
//  ContentView.swift
//  ArtApp
//
//  Created by Murat on 24.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var paintings: [Painting] = []
    var body: some View {
        VStack {
            ScrollView(.vertical,showsIndicators: false) {
                ForEach(paintings,id:\.self) { painting in
                    let imageUrl = URL(string: painting.imageURL)
                    AsyncImage(url: imageUrl)
                        .scaledToFit()
                }
            }
        }
        .padding()
        .onAppear {
            NetworkManager.shared.getPopularPaintings { result in
                switch result {
                case .success(let success):
                    print(success.count)
                    self.paintings = success
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
