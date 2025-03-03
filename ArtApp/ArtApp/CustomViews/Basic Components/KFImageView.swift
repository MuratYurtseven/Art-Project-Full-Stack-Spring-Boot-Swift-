//
//  KFImageView.swift
//  ArtApp
//
//  Created by Murat on 27.02.2025.
//

import SwiftUI
import Kingfisher

struct KFImageView: View {
    let imageUrl:String
    @State private var url:URL?
    let font:Font
    let imageName:String
    var body: some View {
        VStack{
            if let url{
                KFImage(url)
                    .cacheMemoryOnly(true)
                    .resizable()
            }
        }
        .overlay(content: {
            VStack{
                Spacer()
                HStack{
                    Text(imageName)
                        .font(font)
                        .fontWeight(.regular)
                        .foregroundStyle(LinearGradient(colors: [.white,.white.opacity(0.75),.white.opacity(0.65)], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black, radius: 4,x:-0.5,y:-0.5)
                    Spacer()
                }
                .padding()
            }
        })
        .onAppear {
            self.url = URL(string: imageUrl)
        }
            
    }
}

#Preview {
    KFImageView(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/4/40/The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg", font: .subheadline, imageName: "Starry Night")
}
