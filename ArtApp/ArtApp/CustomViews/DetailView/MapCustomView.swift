//
//  MapCustomView.swift
//  ArtApp
//
//  Created by Murat on 28.02.2025.
//

import SwiftUI
import MapKit

struct MapCustomView: View {
    let location:CLLocationCoordinate2D
    var body: some View {
        Map{
            Annotation("Museum", coordinate: location) {
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary,lineWidth:2)
                    Image(systemName: "building.columns.fill")
                        .padding(5)
                }
            }
            .annotationTitles(.hidden)
        }
        .mapStyle(.standard(elevation: .realistic))
    
    }
}

#Preview {
    MapCustomView(location: CLLocationCoordinate2D(latitude: 40.761436, longitude: -73.977621))
}
