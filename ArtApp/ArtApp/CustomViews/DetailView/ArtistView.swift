//
//  ArtistView.swift
//  ArtApp
//
//  Created by Murat on 1.03.2025.
//

import SwiftUI

struct ArtistView: View {
    let artist: Artist
    var body: some View {
        VStack{
            HStack{
                BasicKFImageView(imageUrl: artist.profileImageURL)
                    .scaledToFit()
                    .frame(height: 150)
                    .clipShape(Circle())
                
                HStack{
                    VStack(spacing:7){
                        HStack{
                            Text(artist.name)
                            Text(artist.surname)
                        }
                        .font(.headline)
                        .fontWeight(.semibold)
                    }
                }
                .padding(.leading,50)
                Spacer()
            }
            Text(artist.aboutLife)
                .font(.subheadline)
                .fontWeight(.regular)
        }
        .padding(.horizontal,10)
    }
}

#Preview {
    ArtistView(artist: Artist(name: "Vincent", surname: "van Gogh", profileImageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project_%28454045%29.jpg/1024px-Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project_%28454045%29.jpg", aboutLife: "A Dutch Post-Impressionist painter known for his vivid color palette and emotional depth. He is one of the most influential figures in Western art history.", bornTime: "1853-03-30", deadTime: "1890-07-29", artistID: 1))
}
