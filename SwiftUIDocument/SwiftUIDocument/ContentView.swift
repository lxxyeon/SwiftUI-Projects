//
//  ContentView.swift
//  SwiftUIDocument
//
//  Created by leeyeon2 on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        
        VStack(
            alignment: .leading,
            spacing: 1
        ) {
            ForEach(
                1...10,
                id: \.self
            ) {
                Text("Item \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
