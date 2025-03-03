//
//  DetailPaintingView.swift
//  ArtApp
//
//  Created by Murat on 28.02.2025.
//

import SwiftUI
import MapKit

struct DetailPaintingView: View {
    @StateObject private var viewModel = DetailViewModel()
    let painting: Painting
    @State private var mapTapped:Bool = false
    @State private var paintingTapped:Bool = false
    @State private var isTappedInfArtist:Bool = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical){
                VStack{
                    
                    KFImageView(imageUrl: painting.imageURL, font: .title, imageName: painting.name)
                        .frame(height: 350)
                        .scaledToFit()
                        .clipShape(BottomRoundedShape())
                        .onTapGesture {
                            withAnimation(.spring(duration: 1.5)) {
                                self.paintingTapped.toggle()
                            }
                        }
                        .overlay {
                            VStack{
                                Spacer()
                                HStack{
                                    Spacer()
                                    Button {
                                        withAnimation(.spring(duration: 1.5)) {
                                            self.isTappedInfArtist.toggle()
                                        }
                                        
                                    } label: {
                                        ZStack{
                                            Circle()
                                                .frame(width:40,height: 40)
                                                .foregroundStyle(Color.secondary.opacity(0.6))
                                            Image(systemName: "person.fill")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(Color.secondary)
                                                .padding()
                                        }
                                    }
                                }
                            }
                        }
                    if isTappedInfArtist{
                        if let artist = viewModel.artist{
                            ArtistView(artist: artist)}}
                    VStack{
                        HStack{
                            Text(painting.analysis)
                            Spacer()
                            Text(painting.completionDate.replacingOccurrences(of:"-",with: " "))
                        }
                        .font(.title2)
                        .shadow(color: .white, radius: 0.65,x:-0.4,y:-0.4)
                        .padding(.horizontal,10)
                        .padding(.top,20)
                        if let description = painting.description{
                            Text(description)
                                .font(.title3)
                                .shadow(color: .white, radius: 0.65,x:-0.4,y:-0.4)
                                .padding(.horizontal,10)
                                .padding(.top,30)
                        }

                        
                        VStack{
                            HStack{
                                Text("Location")
                                Spacer()
                                
                            }
                            HStack{
                                Text(painting.location.locationName)
                                    .font(.subheadline)
                                Spacer()
                                
                            }
                        }
                        .font(.title)
                        .shadow(color: .white, radius: 0.65,x:-0.4,y:-0.4)
                        .padding(.horizontal,10)
                        .padding(.top,15)
                        HStack{
                            MapCustomView(location: CLLocationCoordinate2D(latitude: painting.location.latitude, longitude: painting.location.longitude))
                                .clipShape(.rect(cornerRadius: 4))
                                .frame(width: 270,height: 150)
                                .onTapGesture {
                                    withAnimation(.spring(duration: 1.5)) {
                                        self.mapTapped.toggle()
                                    }
                                    
                                }
                            
                            Spacer()
                        }
                        .padding(.horizontal,10)
                    }
                    .opacity(isTappedInfArtist ? 0.2: 1)
                    .fullScreenCover(isPresented: $mapTapped) {
                        FullScreenMapView(location: CLLocationCoordinate2D(latitude: painting.location.latitude, longitude: painting.location.longitude), isPresented: $mapTapped)
                    }
                    .fullScreenCover(isPresented: $paintingTapped) {
                        FullScreenPaintingView(isPresented: $paintingTapped, imageUrl: painting.imageURL)
                    }
                    Spacer()
                }
            }
        }
        .ignoresSafeArea(.all,edges: [.top,.horizontal,.bottom])
        .onAppear {
            viewModel.fetchArtist(id: painting.artistID)
        }
        .navigationBarHidden(true)
        
    }
}


#Preview {
    DetailPaintingView(painting: Painting(paintID: 1, name: "Starry Night", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1920px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg", description: "A swirling night sky over a village, with expressive brushstrokes and vibrant colors representing motion and emotional intensity. A masterpiece of Post-Impressionism.", location: Location(id: 1, locationName: "The Museum of Modern Art, New York", latitude: 40.761436, longitude: -73.977621), artistID: 1, analysis: "Impressionist style", completionDate: "1889-06-01", popularity: 3.7, recommendedRate: 4.6, likedRate: 3.6, visitedRate: 4.6))
}
