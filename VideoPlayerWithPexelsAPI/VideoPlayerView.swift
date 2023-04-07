import AVKit

struct VideoPlayerView: UIViewRepresentable {
    var player: AVPlayer

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VideoPlayerView>) {
     (uiView as? AVPlayerLayer)?.player = player
    }

    func makeUIView(context: UIViewRepresentableContext<VideoPlayerView>) -> UIView {
        let videoLayer = AVPlayerLayer(player: player)
        videoLayer.videoGravity = .resizeAspectFill
        return videoLayer
    }
}