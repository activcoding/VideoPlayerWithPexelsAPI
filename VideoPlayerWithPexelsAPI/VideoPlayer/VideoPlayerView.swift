//
//  ViewPlayer.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @StateObject private var viewModel = AVPlaerViewModel()
    
    var video: Videos
    @State private var player = AVPlayer()
    @State private var playerLayer = AVPlayerLayer()
    @State private var playerViewController = AVPlayerViewController()
    @State private var pip: AVPictureInPictureController!
    
    var body: some View {
        VStack {
            AVVideoPlayer(viewModel: viewModel)
                .frame(width: 400, height: 300)
                .onAppear{
                    if let link = video.videoFiles.first?.link {
                        /// note that passing the title to the viewModel.media hasn't an impact on the UI
                        /// but feel free to implement  a use in the UI
                        viewModel.media = MediaViewModel(title: video.user.name, url: link)
                    }
                }
        }
    }
}

/*
struct ViewPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ViewPlayer()
    }
}
*/
