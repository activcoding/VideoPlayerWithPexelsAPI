//
//  VideoPlayerWithPexelsAPIApp.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

import SwiftUI
import AVKit

@main
struct VideoPlayerWithPexelsAPIApp: App {
    init() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .moviePlayback)
            try session.setActive(true)
            print("session has movie playback: **\(session.category)**")
        } catch let err {
            print(err.localizedDescription)
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
