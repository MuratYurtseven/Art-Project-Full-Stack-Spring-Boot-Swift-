//
//  BasicKFImageView.swift
//  ArtApp
//
//  Created by Murat on 1.03.2025.
//

import SwiftUI
import Kingfisher
struct BasicKFImageView: View {
    let imageUrl:String
    @State private var url:URL?
    var body: some View {
        VStack{
            if let url{
                KFImage(url)
                    .cacheMemoryOnly(true)
                    .resizable()
            }
        }
        .onAppear {
            self.url = URL(string: imageUrl)
        }
    }
}

#Preview {
    BasicKFImageView(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/4/40/The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg")
}
