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
                    player.allwdPictureInPicturePlayback = true
                    player.usesExternalPlaybackWhileExternalScreenIsActive = true
                    player.externalPlaybackVideoGravity = .resizeAspect

                    let controller = AVPicuteInPictureController(playerLayer: player.currentItem?.preferredDisplayLayer ?? AVPlayerLayer())
                     controller.startPictureInPicture()
                } label: {
                    Text("Picture in Picture")
                }.buttonStyle(.bordered).tint(.blue)
   }
}