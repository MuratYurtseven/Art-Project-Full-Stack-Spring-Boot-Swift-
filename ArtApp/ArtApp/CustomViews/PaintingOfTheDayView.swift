//
//  PaintingOfTheDayView.swift
//  ArtApp
//
//  Created by Murat on 27.02.2025.
//

import SwiftUI
import Kingfisher

struct PaintingOfTheDayView: View {
    let urlString:String
    @State private var url:URL?
    var body: some View {
        VStack{
            if let url{
                KFImage(url)
                    .resizable()
                

            }
        }
        .onAppear {
            self.url = URL(string: urlString)
        }
        .overlay {
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 60,height: 60)
                            .padding(.horizontal,10)
                        Image(systemName: "square.on.square")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black)
                        
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 60,height: 60)
                            .padding(.horizontal,10)
                        Image(systemName: "square.on.square.fill")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black)
                    }
                    Spacer()
                }
                .foregroundStyle(.ultraThinMaterial)
            }
            .padding(.bottom,20)
        }
        
        
    }
}

#Preview {
    PaintingOfTheDayView(urlString: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Sandro_Botticelli_-_La_nascita_di_Venere_-_Google_Art_Project_-_edited.jpg/2560px-Sandro_Botticelli_-_La_nascita_di_Venere_-_Google_Art_Project_-_edited.jpg")
}
