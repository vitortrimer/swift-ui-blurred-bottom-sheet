//
//  Home.swift
//  SwiftUIBottomSheetExample
//
//  Created by Vitor Trimer on 13/12/22.
//

import SwiftUI
import MapKit

struct Home: View {
    
    // MARK: - Sheet Property
    @State var shouldShowSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -22.013612, longitude: -47.8891649), latitudinalMeters: 10000, longitudinalMeters: 10000)
            
            Map(coordinateRegion: .constant(region)).ignoresSafeArea()
            Button {
                shouldShowSheet.toggle()
            } label: {
                Image(systemName: "dock.rectangle")
                    .font(.title2)
                    .fontWeight(.semibold )
            }.padding(15)
                .blurredSheet(.init(.ultraThinMaterial), show: $shouldShowSheet) {
                } content: {
                    Text("Blurred BottomSheet! :)")
                        .presentationDetents([.large, .medium, .height(150)])
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

