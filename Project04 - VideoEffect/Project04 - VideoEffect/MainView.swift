//
//  ContentView.swift
//  Project04 - VideoEffect
//
//  Created by leeyeon2 on 2021/11/30.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink(destination: SimpleVideoPlayer()) {
                    Text("Video Player")
                }
                
                NavigationLink(destination: CoreImageVideoPlayer()) {
                    Text("CoreImage Video Player")
                }

                NavigationLink(destination: MetalVideoPlayer()) {
                    Text("Metal Video Player")
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Video Effects")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
