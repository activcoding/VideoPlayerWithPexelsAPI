//
//  ViewPlayer.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

import SwiftUI
import AVKit

struct ViewPlayer: View {
    var video: Videos
    @State private var player = AVPlayer()
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                if let link = video.videoFiles.last?.link {
                    player = AVPlayer(url: URL(string: link)!)
                    player.play()
                }
                
                player.allowsExternalPlayback = true
                player.usesExternalPlaybackWhileExternalScreenIsActive = true
                player.externalPlaybackVideoGravity = .resizeAspect
                
            
                let controller = AVPictureInPictureController(playerLayer: AVPlayerLayer())
                controller?.startPictureInPicture()
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
