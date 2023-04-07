//
//  NewVideoplayer.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//


import AVKit
import SwiftUI

struct NewVideoPlayerView: View {
    var video: Videos
    @State private var player = AVPlayer()
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(height: 300)
                .onAppear {
                    if let link = video.videoFiles.last?.link {
                        player = AVPlayer(url: URL(string: link)!)
                        player.play()
                    }
                }
            
            Button {
              
                player.usesExternalPlaybackWhileExternalScreenIsActive = true
                player.externalPlaybackVideoGravity = .resizeAspect
                
               
               
            } label: {
                Text("Picture in Picture")
            }.buttonStyle(.bordered).tint(.blue)
        }
    }
}
//struct NewVideoPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewVideoPlayerView(video: <#Videos#>)
//    }
//}




//
//struct VideoPlayerView: UIViewRepresentable {
//    var player: AVPlayer
//
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VideoPlayerView>) {
//     (uiView as? AVPlayerLayer)?.player = player
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<VideoPlayerView>) -> UIView {
//        let videoLayer = AVPlayerLayer(player: player)
//        videoLayer.videoGravity = .resizeAspectFill
//        return videoLayer
//    }
//}
