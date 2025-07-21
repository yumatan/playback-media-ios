//
//  ContentView.swift
//  playback-media-ios
//
//  Created by yumatan on 2025/07/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    private var player: AVPlayer? {
        guard let url = Bundle.main.url(forResource: "video-sample", withExtension: "mp4") else {
            return nil
        }
        return AVPlayer(url: url)
    }

    var body: some View {
        if let avPlayer = player {
            VideoPlayer(player: avPlayer)
                .onAppear {
                    // Playback starts automatically when the screen appears.
                    avPlayer.play()
                }
                .edgesIgnoringSafeArea(.all) // Full screen.
        } else {
            // Displays an error message if the URL is invalid.
            Text("The video URL is invalid.")
        }
    }
}

#Preview {
    ContentView()
}
