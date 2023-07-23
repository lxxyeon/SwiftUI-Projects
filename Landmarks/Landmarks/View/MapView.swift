//
//  MapView.swift
//  Landmarks
//
//  Created by leeyeon2 on 2023/07/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    //@State : 값을 변경하고 싶은 프로퍼티 앞에 사용하는 property wrapper
    @State var isToggleOn: Bool = true
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        // $ 접두사로 접근 가능
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
