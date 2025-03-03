//
//  TabbarNavigation.swift
//  ArtApp
//
//  Created by Murat on 27.02.2025.
//

import SwiftUI

struct TabbarNavigation: View {
    var body: some View {
        TabView{
            
            Tab("Home", systemImage: "house"){
                HomeView()
                    
            }
            
            Tab("Discover", systemImage: "text.justify"){
                DiscoverView()
            }
            
            Tab("Search", systemImage: "magnifyingglass"){
                SearchView()
            }
            
            Tab("Favourites", systemImage: "heart"){
                FavouritesView()
            }
        }
    }
}

#Preview {
    TabbarNavigation()
}
