//
//  ContentView.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var manager = VideoManager()
    @State private var searchText: String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if manager.videos.isEmpty {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                    } else {
                        ForEach(manager.videos, id: \.id) { video in
                            NavigationLink {
                                ViewPlayer(video: video)
                            } label: {
                                VideoTumbnail(url: URL(string: video.image)!, title: video.user.name, views: String(video.id))
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .sidebar, prompt: "Search for videos")
            .onSubmit(of: .search) {
                manager.searchQeuery = searchText
                print(manager.videos.count)
            }
            .navigationTitle("VideoPlayer")
//            .toolbar {
//                ToolbarItem {
//                    Button {
//                        manager.searchQeuery = searchText
//                    } label: {
//                        Image(systemName: "arrow.clockwise")
//                    }
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
