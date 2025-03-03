//
//  HomeView.swift
//  ArtApp
//
//  Created by Murat on 27.02.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(.vertical,showsIndicators: false){
                    if let paintingOfTheDay = viewModel.PaintingOfTheDay{
                        PaintingOfTheDayView(urlString: paintingOfTheDay.imageURL)
                            .frame(width: 410, height: 300)
                    }
                    
                    HStack{
                        Text("Most Popular Paintings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(LinearGradient(colors: [.white,.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .shadow(color: .black, radius: 0.25,x:0.2,y:0.45)
                        Spacer()
                    }
                    .padding(.horizontal,10)
                    MostPopularPaintingsList(images: viewModel.mostPopularPaintings)
                    
                    HStack{
                        Text("Recommended Paintings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(LinearGradient(colors: [.white,.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .shadow(color: .black, radius: 0.25,x:0.2,y:0.45)
                        Spacer()
                    }
                    .padding(.horizontal,10)
                    
                    RecommendedPaintingsList(images: viewModel.RecommendedPaintings)
                    
                    HStack{
                        Text("Most Visited Paintings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(LinearGradient(colors: [.white,.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .shadow(color: .black, radius: 0.25,x:0.2,y:0.45)
                        Spacer()
                    }
                    .padding(.horizontal,10)
                    MostVisitedPaintingsList(images: viewModel.MostVisitedPaintings)
                    
                    HStack{
                        Text("Users' Top Liked Paintings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(LinearGradient(colors: [.white,.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .shadow(color: .black, radius: 0.25,x:0.2,y:0.45)
                        Spacer()
                    }
                    .padding(.horizontal,10)
                    
                    UsersTopLikedPaintingsList(images: viewModel.MostLikedPaintings)
                    
                    
                    
                }
            }
            .ignoresSafeArea(.all,edges: .top)
        }
    }
}

#Preview {
    HomeView()
}
