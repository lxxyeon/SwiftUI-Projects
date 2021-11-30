//
//  SimpleVideoPlayer.swift
//  Project04 - VideoEffect
//
//  Created by leeyeon2 on 2021/11/30.
//

import SwiftUI
import AVKit

class SimpleVideoPlayerViewModel: ObservableObject {
    
    private static let defaultURL = Bundle.main.url(forResource: "bunny", withExtension: "mp4")!
    
    let player = AVPlayer(url: defaultURL)
}

struct SimpleVideoPlayer: View {
    
    @StateObject var model = SimpleVideoPlayerViewModel()
    // 포토 픽커
    @State var showsPhotoPicker: Bool = false
    
    var body: some View {
        
        VideoPlayer(player: model.player)
            .aspectRatio(1.0, contentMode: .fit)
            .onAppear {
                model.player.play()
            }
            .onDisappear {
                model.player.pause()
            }//포토 픽커 보여줌
            .sheet(isPresented: $showsPhotoPicker, content: {
                PhotoPicker(configuration: .default,
                            isPresented: $showsPhotoPicker) { result in
                    if case let .success(url) = result {
                        model.player.replaceCurrentItem(with: AVPlayerItem(url: url))
                    }
                }
            })//state를 true로 만드는 버튼
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Open") {
                        self.showsPhotoPicker = true
                    }
                }
            })
            .navigationTitle("Simple Video Player")
            .navigationBarTitleDisplayMode(.inline)
    }
}
