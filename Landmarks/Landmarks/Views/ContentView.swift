//
//  ContentView.swift
//  Landmarks
//
//  Created by leeyeon2 on 2023/07/23.
//

import SwiftUI

// View 프로토콜 따름
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
