//
//  mapView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI
import MapKit

struct mapView: View {
    @State private var region = MKCoordinateRegion(
        center:CLLocationCoordinate2D(latitude:55.8661, longitude: -4.2492),
        span: MKCoordinateSpan(latitudeDelta: 0.0019, longitudeDelta: 0.0001)
    
    
    
    )
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView()
    }
}
