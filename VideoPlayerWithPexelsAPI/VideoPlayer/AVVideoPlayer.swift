//
//  AVVideoPlayer.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 09.04.23.
//

import SwiftUI
import AVKit

/// we use a AVVideoPlayer struct, just so we can use the Picute-In-Picture feature
struct AVVideoPlayer: UIViewControllerRepresentable {
    @ObservedObject var viewModel: AVPlaerViewModel
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        playerViewController.player = viewModel.player
        playerViewController.canStartPictureInPictureAutomaticallyFromInline = true
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, AVPlayerViewControllerDelegate {
        var parent: AVVideoPlayer
        
        init(_ parent: AVVideoPlayer) {
            self.parent = parent
        }
        
        func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.viewModel.pipStatus = .willStart
        }
        
        func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.viewModel.pipStatus = .didStart
        }
        
        func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.viewModel.pipStatus = .willStop
        }
        
        func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.viewModel.pipStatus = .didStop
        }
    }
}
