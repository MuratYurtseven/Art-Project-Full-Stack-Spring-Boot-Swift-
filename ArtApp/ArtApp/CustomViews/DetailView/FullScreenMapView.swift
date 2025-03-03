//
//  FullScreenMapView.swift
//  ArtApp
//
//  Created by Murat on 28.02.2025.
//

import SwiftUI
import MapKit
struct FullScreenMapView: View {
    let location: CLLocationCoordinate2D
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            MapCustomView(location: location)
                .edgesIgnoringSafeArea(.all)

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
        .background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
    }
}


