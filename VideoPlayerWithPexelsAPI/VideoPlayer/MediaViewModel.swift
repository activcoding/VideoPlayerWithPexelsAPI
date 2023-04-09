//
//  MediaViewModel.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 09.04.23.
//

import Foundation

/// This model is for the AVPlayer
/// The title isn't important, but the url is
/// In VideoPlayerView, a MediaViewModel is passet to the AVPlayerViewModel
/// So the AVPlayer knows which video to play
struct MediaViewModel {
    var title: String
    var url: String
}
