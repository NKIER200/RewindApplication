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
        center:CLLocationCoordinate2D(latitude:25.781_441, longitude: -80.188_332),
        span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.01)
    
    
    
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
