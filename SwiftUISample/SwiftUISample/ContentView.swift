//
//  ContentView.swift
//  SwiftUISample
//
//  Created by leeyeon2 on 2021/08/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello, world!")
                .foregroundColor(Color.red)
            Image("test")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
