//
//  AVPlayerViewModel.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 08.04.23.
//

import UIKit
import AVKit
import AVFoundation
import Combine
import SwiftUI

/// The pipStatus can be used to update the UI, in case the user starts or stops the pip mode.
enum PipStatus {
    case willStart
    case didStart
    case willStop
    case didStop
}

/// A view model class for AVPlayer that uses an `AVPlayer` instance to play media.
/// it is used to provide a `AVPlayer`for the AVVideoPlayer

final class AVPlaerViewModel: ObservableObject {
    @Published var pipStatus: PipStatus = .willStart
    @Published var media: MediaViewModel?
    
    let player = AVPlayer()
    private var cancallable: AnyCancellable?
    
    init() {
        cancallable = $media
            .compactMap({ $0 })
            .compactMap({ URL(string: $0.url) })
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.player.replaceCurrentItem(with: AVPlayerItem(url: $0))
            })
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    func setAudioSession(to value: AVAudioSession.Category) {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(value)
        } catch {
            print("audio session failed!")
        }
    }
}
