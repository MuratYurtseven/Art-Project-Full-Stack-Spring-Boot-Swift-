//
//  FullScreenPaintingView.swift
//  ArtApp
//
//  Created by Murat on 1.03.2025.
//

import SwiftUI

struct FullScreenPaintingView: View {
    @Binding var isPresented: Bool
    let imageUrl:String
    var body: some View {
        ZStack{
            BasicKFImageView(imageUrl: imageUrl)
            BasicKFImageView(imageUrl: imageUrl)
                .scaledToFit()
        }
        .ignoresSafeArea(.all,edges: .all)
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.spring(duration: 1.5)) {
                            isPresented = false
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

